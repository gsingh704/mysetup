FROM greyltc/archlinux-aur:yay
RUN sudo -u ab -D~ bash -c 'yay -Syu --removemake --needed --noprogressbar --noconfirm  android-sdk gradle cordova jdk8-openjdk'
RUN sudo -u ab -D~ bash -c 'yay -R --noconfirm jdk-openjdk'



# RUN sdkmanager "build-tools;30.0.3"
# cordova create myapp com.example.myapp MyApp
# cd myapp/
#  cordova platform add android
#  cordova build android
