FROM archlinux
RUN pacman -Syu --noconfirm wget nss atkmm libcups libdrm gtk3 alsa-lib sudo gnu-free-fonts
RUN wget https://github.com/VSCodium/vscodium/releases/download/1.74.2.22355/VSCodium-1.74.2.22355.glibc2.17-x86_64.AppImage
RUN chmod +x VSCodium-1.74.2.22355.glibc2.17-x86_64.AppImage
RUN ./VSCodium-1.74.2.22355.glibc2.17-x86_64.AppImage --appimage-extract
RUN mv squashfs-root /opt/vscodium
RUN ln -s /opt/vscodium/AppRun /usr/local/bin/vscodium
RUN useradd -m builduser 
RUN passwd -d builduser 
RUN printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers
CMD  sudo -u builduser bash -c 'vscodium --no-sandbox'
