FROM greyltc/archlinux-aur:yay
RUN sudo -u ab -D~ bash -c 'yay -Syu --removemake --needed --noprogressbar --noconfirm  android-sdk gradle cordova jdk8-openjdk'
RUN sudo -u ab -D~ bash -c 'yay -R --noconfirm jdk-openjdk'
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_HOME=/opt/android-sdk
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk
ENV PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools"
RUN yes | sdkmanager "build-tools;30.0.3"



# cordova create myapp com.example.myapp MyApp
# cd myapp/
#  cordova platform add android
#  cordova build android
