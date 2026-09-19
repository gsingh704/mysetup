#!/usr/bin/env bash
set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}      Starting EndeavourOS GNOME Setup    ${NC}"
echo -e "${GREEN}=========================================${NC}"

# Request sudo upfront and keep alive during script execution
log "Requesting administrative privileges upfront..."
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# -------------------------------------------------------------
# 1. Remove Unwanted Packages
# -------------------------------------------------------------
log "Removing unwanted packages..."
PACKAGES_TO_REMOVE=(
    gnome-terminal
    xterm
    gnome-usage
    firewalld
    gnome-clocks
    gnome-weather
    pavucontrol
    firewall-applet
    firewall-config
    gnome-nettool
)

for pkg in "${PACKAGES_TO_REMOVE[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        log "Removing $pkg..."
        sudo pacman -R --noconfirm "$pkg" 2>/dev/null || true
    fi
done

# Clean orphaned packages if any
log "Cleaning orphaned packages..."
ORPHANS=$(pacman -Qtdq 2>/dev/null || true)
if [ -n "$ORPHANS" ]; then
    echo "$ORPHANS" | sudo pacman -Rns --noconfirm - 2>/dev/null || true
fi
success "Package removal completed."

# -------------------------------------------------------------
# 2. Hide Redundant System / Background Desktop Icons
# -------------------------------------------------------------
log "Hiding unnecessary desktop utility icons from app launcher..."
mkdir -p "$HOME/.local/share/applications"

APPS_TO_HIDE=(
    bssh
    bvnc
    avahi-discover
    qv4l2
    qvidcap
    stoken-gui
    stoken-gui-small
    lstopo
)

for app in "${APPS_TO_HIDE[@]}"; do
    if [ -f "/usr/share/applications/${app}.desktop" ]; then
        cp "/usr/share/applications/${app}.desktop" "$HOME/.local/share/applications/" 2>/dev/null || true
        # Prevent appending NoDisplay=true multiple times
        if ! grep -q "NoDisplay=true" "$HOME/.local/share/applications/${app}.desktop"; then
            echo "NoDisplay=true" >> "$HOME/.local/share/applications/${app}.desktop"
        fi
    fi
done
success "Desktop icons hidden."

# -------------------------------------------------------------
# 3. Install Pacman & AUR Packages
# -------------------------------------------------------------
log "Installing required packages via yay..."
PKGS_TO_INSTALL=(
    flatpak
    gnome-software
    baobab
    zsh
    wayland-scroll-factor
    visual-studio-code-bin
    cloudflare-warp-bin
    adw-gtk-theme
)

yay -S --needed --noconfirm "${PKGS_TO_INSTALL[@]}"

# Enable services
log "Enabling Bluetooth service..."
sudo systemctl enable --now bluetooth.service 2>/dev/null || true

if systemctl list-unit-files | grep -q "warp-svc.service"; then
    log "Configuring Cloudflare WARP..."
    sudo systemctl enable --now warp-svc.service 2>/dev/null || true
    sleep 2
    if ! warp-cli registration show &>/dev/null; then
        log "Registering Cloudflare WARP client..."
        warp-cli --accept-tos registration new 2>/dev/null || true
    fi
    warp-cli connect 2>/dev/null || true
    systemctl --user enable --now warp-taskbar.service 2>/dev/null || true
fi

if command -v wsf &>/dev/null; then
    log "Enabling Wayland Scroll Factor..."
    wsf enable 2>/dev/null || true
fi
success "Packages and services configured."

# -------------------------------------------------------------
# 4. Configure Flatpak (User-Only) & Install Flatpak Apps
# -------------------------------------------------------------
log "Removing system-wide Flatpak repositories (enforcing user-only Flatpak)..."
SYSTEM_REMOTES=$(flatpak remotes --system --columns=name 2>/dev/null || true)
if [ -n "$SYSTEM_REMOTES" ]; then
    for remote in $SYSTEM_REMOTES; do
        log "Removing system Flatpak remote: $remote"
        sudo flatpak remote-delete --system "$remote" --force 2>/dev/null || true
    done
fi

log "Configuring user-only Flathub repository..."
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

FLATPAK_APPS=(
    com.google.Chrome
    org.mozilla.firefox
    com.mattjakeman.ExtensionManager
    dev.fredol.open-tv
    org.gtk.Gtk3theme.adw-gtk3
    org.gtk.Gtk3theme.adw-gtk3-dark
)

log "Installing Flatpak applications (user-level)..."
flatpak install --user -y --noninteractive flathub "${FLATPAK_APPS[@]}"
mkdir -p "$HOME/.var/app/dev.fredol.open-tv/config/mpv"
cat << 'EOF' > "$HOME/.var/app/dev.fredol.open-tv/config/mpv/mpv.conf"
profile=fast
hwdec=auto
EOF
success "Flatpak configured as user-only and applications installed."

# -------------------------------------------------------------
# 5. Oh My Zsh & Plugins Setup
# -------------------------------------------------------------
log "Setting up Oh My Zsh & plugins..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM/plugins"

declare -A PLUGINS=(
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    ["zsh-completions"]="https://github.com/zsh-users/zsh-completions"
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
    ["zsh-history-substring-search"]="https://github.com/zsh-users/zsh-history-substring-search"
)

for plugin in "${!PLUGINS[@]}"; do
    target="$ZSH_CUSTOM/plugins/$plugin"
    if [ ! -d "$target" ]; then
        log "Cloning $plugin..."
        git clone --depth=1 "${PLUGINS[$plugin]}" "$target" 2>/dev/null || true
    fi
done

log "Writing ~/.zshrc..."
cat << 'EOF' > "$HOME/.zshrc"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)
source $ZSH/oh-my-zsh.sh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

if which gem &>/dev/null; then
    export GEM_HOME="$(gem env user_gemhome 2>/dev/null)"
    export PATH="$PATH:$GEM_HOME/bin"
fi

# Aliases
alias ys="yay -S"
alias yr="yay -R"
alias pc="sudo pacman -Qtdq | sudo pacman -Rns -"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mpv="flatpak run --filesystem=host --command=mpv dev.fredol.open-tv"
EOF

# Set default shell to zsh if not currently set
if [ "$SHELL" != "$(which zsh)" ] && [ -x "$(which zsh)" ]; then
    log "Changing default shell to zsh..."
    chsh -s "$(which zsh)" "$USER" 2>/dev/null || true
fi
success "Zsh environment configured."

# -------------------------------------------------------------
# 6. Download Wallpapers
# -------------------------------------------------------------
log "Downloading wallpapers..."
mkdir -p "$HOME/.local/share/backgrounds"
curl -sSL -o "$HOME/.local/share/backgrounds/1.jpg" "https://w.wallhaven.cc/full/md/wallhaven-mdjrqy.jpg"
curl -sSL -o "$HOME/.local/share/backgrounds/2.jpg" "https://i.imgur.com/ukrq4Tz.jpeg"
success "Wallpapers downloaded."

# -------------------------------------------------------------
# 7. Install GNOME Shell Extensions
# -------------------------------------------------------------
log "Downloading and installing GNOME Shell extensions..."
python3 - << 'PYEOF'
import urllib.request, json, os, zipfile, io

uuids = [
    'Vitals@CoreCoding.com',
    'dash-to-panel@jderose9.github.com',
    'touchpad-gestures@alpha.com',
    'touchpad-speed-control@ritesh',
    'tiling-assistant@leleat-on-github',
    'pip-on-top@rafostar.github.com',
    'warpgnome@unaibenidorm',
    'nightthemeswitcher@romainvigier.fr',
    'legacyschemeautoswitcher@joshimukul29.gmail.com',
    'gnome-clipboard@b00f.github.io'
]

ext_dir = os.path.expanduser('~/.local/share/gnome-shell/extensions')
os.makedirs(ext_dir, exist_ok=True)

for uuid in uuids:
    target = os.path.join(ext_dir, uuid)
    if not os.path.exists(target):
        try:
            url = f'https://extensions.gnome.org/extension-info/?uuid={uuid}&shell_version=50'
            req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
            with urllib.request.urlopen(req, timeout=10) as resp:
                data = json.loads(resp.read().decode())
                dl_path = data.get('download_url')
            if dl_path:
                dl_url = 'https://extensions.gnome.org' + dl_path
                dl_req = urllib.request.Request(dl_url, headers={'User-Agent': 'Mozilla/5.0'})
                with urllib.request.urlopen(dl_req, timeout=15) as dl_resp:
                    with zipfile.ZipFile(io.BytesIO(dl_resp.read())) as z:
                        z.extractall(target)
                print(f"  [+] Installed extension: {uuid}")
        except Exception as e:
            print(f"  [-] Warning: could not download {uuid}: {e}")
PYEOF
success "GNOME Shell extensions installed."

# -------------------------------------------------------------
# 8. Apply GNOME & Extension Settings (dconf)
# -------------------------------------------------------------
log "Applying GNOME and Extension settings via dconf..."
dconf load / << EOF
[org/gnome/desktop/app-folders]
folder-children=['System', '8cd95115-1fa6-492f-86cd-c0cec319bd16']

[org/gnome/desktop/app-folders/folders/8cd95115-1fa6-492f-86cd-c0cec319bd16]
apps=['org.gnome.Evince.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Showtime.desktop', 'org.gnome.Loupe.desktop']
name='Gnome'
translate=false

[org/gnome/desktop/app-folders/folders/System]
apps=['org.gnome.DiskUtility.desktop', 'org.gnome.SystemMonitor.desktop', 'org.gnome.tweaks.desktop', 'com.mattjakeman.ExtensionManager.desktop', 'org.gnome.Extensions.desktop', 'org.gnome.FileRoller.desktop', 'org.gnome.Settings.desktop', 'org.gnome.PowerStats.desktop', 'org.gnome.baobab.desktop', 'io.github.danielgrasso.WaylandScrollFactor.desktop']
name='X-GNOME-Shell-System.directory'
translate=true

[org/gnome/shell]
app-picker-layout=[{'8cd95115-1fa6-492f-86cd-c0cec319bd16': <{'position': <0>}>, 'System': <{'position': <1>}>, 'code.desktop': <{'position': <2>}>, 'com.cloudflare.WarpTaskbar.desktop': <{'position': <3>}>, 'org.gnome.Software.desktop': <{'position': <4>}>, 'org.gnome.TextEditor.desktop': <{'position': <5>}>}]
enabled-extensions=['Vitals@CoreCoding.com', 'dash-to-panel@jderose9.github.com', 'touchpad-gestures@alpha.com', 'touchpad-speed-control@ritesh', 'tiling-assistant@leleat-on-github', 'pip-on-top@rafostar.github.com', 'warpgnome@unaibenidorm', 'nightthemeswitcher@romainvigier.fr', 'legacyschemeautoswitcher@joshimukul29.gmail.com', 'gnome-clipboard@b00f.github.io']
favorite-apps=['dev.fredol.open-tv.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Console.desktop', 'com.google.Chrome.desktop', 'org.mozilla.firefox.desktop']

[org/gnome/desktop/interface]
clock-format='12h'
clock-show-date=false
gtk-theme='adw-gtk3-dark'
show-battery-percentage=true

[org/gnome/desktop/background]
picture-options='zoom'
picture-uri='file://${HOME}/.local/share/backgrounds/1.jpg'
picture-uri-dark='file://${HOME}/.local/share/backgrounds/1.jpg'

[org/gnome/desktop/screensaver]
picture-uri='file://${HOME}/.local/share/backgrounds/1.jpg'

[org/gnome/shell/extensions/dash-to-panel]
animate-appicon-hover-animation-extent={'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}
appicon-margin=0
appicon-padding=1
appicon-style='NORMAL'
dot-color-dominant=true
dot-color-override=false
dot-position='BOTTOM'
extension-version=74
focus-highlight-dominant=true
group-apps=false 
group-apps-underline-unfocused=true
group-apps-use-fixed-width=true
hotkeys-overlay-combo='TEMPORARILY'
leftbox-padding=-1
middle-click-action='QUIT'
multi-monitors=true
overview-click-to-exit=true
panel-anchors='{"BNQ-B3M05000SL0":"MIDDLE","SDC-0x00000000":"MIDDLE"}'
panel-element-positions='{"BNQ-B3M05000SL0":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}],"SDC-0x00000000":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}'
panel-lengths='{}'
panel-positions='{}'
panel-side-margins=0
panel-sizes='{"BNQ-B3M05000SL0":22,"SDC-0x00000000":22}'
prefs-opened=false
shift-click-action='MINIMIZE'
shift-middle-click-action='LAUNCH'
show-apps-icon-file=''
status-icon-padding=-1
tray-padding=0
tray-size=0
window-preview-title-position='TOP'

[org/gnome/shell/extensions/nightthemeswitcher/time]
nightthemeswitcher-ondemand-keybinding=['<Super>y']

[org/gnome/shell/extensions/touchpad-gestures]
three-swipe-down-keybind='119:4'
three-swipe-left-action=4
three-swipe-left-keybind='65289:4'
three-swipe-right-action=4
three-swipe-right-keybind='65056:5'
three-swipe-up-keybind='116:5'

[org/gnome/shell/extensions/vitals]
battery-slot=3
hide-icons=true
hot-sensors=['_battery_power_rate_']
show-battery=true
EOF
success "GNOME settings applied."

# -------------------------------------------------------------
# 9. Default Applications & VS Code Config
# -------------------------------------------------------------
log "Setting default browser to Google Chrome..."
xdg-settings set default-web-browser com.google.Chrome.desktop 2>/dev/null || true

log "Configuring VS Code..."
mkdir -p "$HOME/.config/Code/User"
if [ ! -f "$HOME/.config/Code/User/settings.json" ]; then
    echo '{"window.autoDetectColorScheme": true}' > "$HOME/.config/Code/User/settings.json"
fi

echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}     Setup Completed Successfully!       ${NC}"
echo -e "${GREEN}=========================================${NC}"
