FROM greyltc/archlinux-aur:yay
RUN sudo -u ab -D~ bash -c 'yay -Syu --removemake --needed --noprogressbar --noconfirm  libxext libxrender libxtst gnu-free-fonts  intellij-idea-ultimate-edition jdk-openjdk midori'
CMD  /opt/intellij-idea-ultimate-edition/bin/idea.sh

#Idea comunity
FROM archlinux
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm intellij-idea-community-edition libxext libxrender libxtst jdk-openjdk ttf-fira-code otf-fira-sans
CMD idea

#scenebuilder netbeans
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt install -y wget  git xdg-utils maven  libgtk2.0-0 libpango1.0-0 libgdk-pixbuf2.0-0 libgl1-mesa-glx sqlite3
RUN wget https://download2.gluonhq.com/scenebuilder/19.0.0/install/linux/SceneBuilder-19.0.0.deb
RUN wget https://dlcdn.apache.org/netbeans/netbeans-installers/17/apache-netbeans_17-1_all.deb 
RUN wget https://cdn.azul.com/zulu/bin/zulu20.30.11-ca-fx-jdk20.0.1-linux_amd64.deb
RUN mkdir /usr/share/desktop-directories/
RUN dpkg -i SceneBuilder-19.0.0.deb
RUN dpkg -i apache-netbeans_17-1_all.deb
RUN echo 'export PATH=$PATH:/opt/scenebuilder/bin' >> ~/.bashrc
RUN apt remove -y openjdk-*
RUN dpkg -i zulu20.30.11-ca-fx-jdk20.0.1-linux_amd64.deb
RUN wget https://github.com/xerial/sqlite-jdbc/releases/download/3.41.2.1/sqlite-jdbc-3.41.2.1.jar 

#visual-pardigm
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y wget
RUN wget https://eu8.dl.visual-paradigm.com/visual-paradigm/vpce17.0/20230401/Visual_Paradigm_CE_17_0_20230401_Linux64.sh
RUN chmod +x Visual_Paradigm_CE_17_0_20230401_Linux64.sh
RUN apt install -y openjdk-19-jdk


# #run x11 apps
# docker run -ti  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ubuntu
# xhost +      

FROM greyltc/archlinux-aur:yay
RUN sudo -u ab -D~ bash -c 'yay -Syu --removemake --needed --noprogressbar --noconfirm  android-sdk gradle cordova jdk8-openjdk'
RUN sudo -u ab -D~ bash -c 'yay -R --noconfirm jdk-openjdk'
RUN export ANDROID_SDK_ROOT=/opt/android-sdk
RUN export ANDROID_HOME=/opt/android-sdk

# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
# RUN sdkmanager "build-tools;30.0.3"
# cordova create myapp com.example.myapp MyApp
# cd myapp/
#  cordova platform add android
#  cordova build android



#docker run -ti  -v /mnt/partition/docker/web/:/data --name web beevelop/cordova
