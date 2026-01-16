
pkg install x11-repo tur-repo
pkg i wget curl tar unzip
pkg install build-essential extra-cmake-modules ninja mesa mesa-dev libglvnd-dev libwayland-protocols vulkan-headers plasma-wayland-protocols jq libcap boost boost-headers xorgproto libxss sdl2
pkg i pulseaudio
#pkg i xorg-*
#pkg i xdg-*
pkg install \
  xorg-xrandr \
  xorg-xsetroot \
  #xorg-xset \
  #xorg-xinput \
  xorg-xkbcomp \
  xkeyboard-config
pkg install xdg-utils \
  #xdg-user-dirs

# pkg i qt6-*
pkg install \
  qt6-qtbase \
  qt6-qtdeclarative \
  qt6-qtsvg \
  qt6-qttools \
  qt6-qtmultimedia \
  qt6-qtwayland \
  qt6-qtwebengine \
  qt6-qtimageformats \
  qt6-qt5compat
pkg i qt6-qtbase-gtk-platformtheme qcoro qcoro-static layer-shell-qt phonon-qt6
  
# pkg i kf6-*
pkg install \
  kf6-kcoreaddons \
  kf6-ki18n \
  kf6-kconfig \
  kf6-kconfigwidgets \
  kf6-kguiaddons \
  kf6-kwidgetsaddons \
  kf6-kiconthemes \
  kf6-kxmlgui \
  kf6-kservice \
  kf6-kdbusaddons \
  kf6-kglobalaccel \
  kf6-kio \
  kf6-knotifications \
  kf6-kcrash \
  kf6-kpackage \
  kf6-karchive \
  kf6-ktextwidgets \
  kf6-ktexteditor \
  kf6-kstatusnotifieritem
pkg i kf6-kcmutils kf6-prison kf6-kdeclarative kf6-knotifyconfig kf6-kidletime kf6-attica
pkg install termux-x11-nightly dbus

pkg install kpipewire kweather libplasma plasma-activities plasma-activities-stats plasma-wayland-protocols kf6-baloo
pkg in xwayland 
pkg in libxcvt libdisplay-info libwayland-protocols

pkg in docbook-xml
pkg in docbook-xsl
cpan install URI::Escape

pkg install sassc
pkg in pycairo

##qtlocation
cd
wget -O qtlocation-6.10.1.tar.gz https://github.com/qt/qtlocation/archive/refs/tags/v6.10.1.tar.gz
tar -xf qtlocation-6.10.1.tar.gz
cd qtlocation-6.10.1
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux -G Ninja
ninja -j4
ninja install

#Qtsensors
cd
wget -O qtsensors-6.10.1.tar.gz https://github.com/qt/qtsensors/archive/refs/tags/v6.10.1.tar.gz
tar -xf qtsensors-6.10.1.tar.gz
cd qtsensors-6.10.1
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF  -G Ninja
ninja -j4
ninja install

#krunner
cd
wget -O krunner-6.22.0.tar.gz https://github.com/KDE/krunner/archive/refs/tags/v6.22.0.tar.gz
tar -xf krunner-6.22.0.tar.gz
cd krunner-6.22.0
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON
make -j4
make install

#kdoctools
cd
wget -O kdoctools-6.22.0.tar.gz https://github.com/KDE/kdoctools/archive/refs/tags/v6.22.0.tar.gz
tar -xf kdoctools-6.22.0.tar.gz
cd kdoctools-6.22.0
mkdir build && cd build
mkdir -p ~/bin
ln -s ~/kdoctools-6.22.0/build/bin/meinproc6 ~/bin/KF6::meinproc6
export PATH="$HOME/bin:$PATH"
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux -DBUILD_WITH_QT6=ON  -DKDOCTOOLS_BUILD_MANPAGES=OFF -DKDOCTOOLS_BUILD_QCH=OFF
make -j4
make install

#KDED
cd
wget -O kded-6.22.0.tar.gz https://github.com/KDE/kded/archive/refs/tags/v6.22.0.tar.gz
tar -xf kded-6.22.0.tar.gz
cd kded-6.22.0
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON
make -j4
make install

#Knewstuff
cd
wget -O knewstuff-6.22.0.tzr.gz https://github.com/KDE/knewstuff/archive/refs/tags/v6.22.0.tar.gz
tar -xf knewstuff-6.22.0.tar.gz
cd knewstuff-6.22.0
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON
make -j4
make install

#kunitconversion
cd
wget -O kunitconversion-6.22.0.tar.gz https://github.com/KDE/kunitconversion/archive/refs/tags/v6.22.0.tar.gz
tar -xf kunitconversion-6.22.0.tar.gz
cd kunitconversion-6.22.0
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON -DBUILD_PYTHON_BINDINGS=OFF
make -j4
make install


url=https://download.kde.org/stable/plasma/6.5.2/

#plasma5support
cd
wget $url/plasma5support-6.5.2.tar.xz
tar -xf plasma5support-6.5.2.tar.xz
cd plasma5support-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON
make -j$(nproc)
make install

#kwayland
cd
wget $url/kwayland-6.5.2.tar.xz
tar -xf kwayland-6.5.2.tar.xz
cd kwayland-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j$(nproc)
make install

#libkscreen
cd
wget $url/libkscreen-6.5.2.tar.xz
tar -xf libkscreen-6.5.2.tar.xz
cd libkscreen-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON
make -j$(nproc)
make install

#kdecoration
cd
wget $url/kdecoration-6.5.2.tar.xz
tar -xf kdecoration-6.5.2.tar.xz
cd kdecoration-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON
make -j$(nproc)
make install

#kglobalacceld
cd
wget -O kglobalacceld-6.5.2.tar.gz https://github.com/KDE/kglobalacceld/archive/refs/tags/v6.5.2.tar.gz
tar -xf kglobalacceld-6.5.2.tar.gz
cd kglobalacceld-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON
make -j4
make install

#nighttime
cd
git clone https://invent.kde.org/plasma/knighttime.git
cd knighttime
git checkout v6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON
make -j8
make install

#kscreenlocker 
cd
git clone https://invent.kde.org/plasma/kscreenlocker.git
cd kscreenlocker
git checkout v6.5.2
mkdir build && cd build
nano ../CMakeLists.txt
# find two lines "find_package(PAM REQUIRED)" and "add_subdirectory(greeter)" and place a # before like "#find_package(PAM REQUIRED)" and "#add_subdirectory(greeter)"
#now save it
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON
make -j4
make install

#Kwin_X11
cd
git clone https://invent.kde.org/plasma/kwin-x11.git
cd kwin-x11
git checkout v6.5.2
mkdir build && cd build
nano ../CMakeLists.txt
#find "find_package(UDev)" and comment out or replace with "#find_package(UDev)"
#save it
nano ../src/CMakeLists.txt
#find "UDev::UDev" and comment "#UDev::UDev"
#find "utils/udev.h" and comment "#utils/udev.h"
also search this:
PUBLIC
        Qt::DBus
        Qt::Quick
        Qt::Widgets
        Wayland::Server
        KF6::ConfigCore
        KF6::CoreAddons
        KF6::WindowSystem
        epoxy::epoxy
replace with:
PUBLIC
        Qt::DBus
        Qt::Quick
        Qt::Widgets
        Wayland::Server
        KF6::ConfigCore
        KF6::CoreAddons
        KF6::WindowSystem
        epoxy::epoxy
        android-shmem
        
#save it
nano ../src/kcms/rules/CMakeLists.txt
#find this:
set(kcm_libs
    Qt::Quick

    KF6::KCMUtils
    KF6::I18n
    KF6::KCMUtilsQuick
    KF6::WindowSystem
    KF6::XmlGui
)
#replace with :
set(kcm_libs
    Qt::Quick
    Qt::DBus
    KF6::KCMUtils
    KF6::I18n
    KF6::KCMUtilsQuick
    KF6::WindowSystem
    KF6::XmlGui
    android-shmem
)
#save it
nano ../src/utils/CMakeLists.txt
#find "udev.cpp" and comment "#udev.cpp"
#save it
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON -DBUILD_WAYLAND_COMPOSITOR=OFF -DBUILD_KWIN_WAYLAND=OFF -DBUILD_KWIN_X11=ON -DKF6_HOST_TOOLING=$PREFIX/lib/cmake
make -j4
make install

# plasma workspace
cd
wget $url/plasma-workspace-6.5.2.tar.xz
tar -xf plasma-workspace-6.5.2.tar.xz
cd plasma-workspace-6.5.2
mkdir build && cd build
nano ../CMakeLists.txt
#find this line "find_package(KWinDBusInterface CONFIG REQUIRED)" and replace it with "find_package(KWinX11DBusInterface CONFIG REQUIRED)"
#find this line "find_package(UDev REQUIRED)" and add # before like "#find_package(UDev REQUIRED)"
#find this line "find_package(PolkitQt6-1)" and add # before like "#find_package(PolkitQt6-1)"
#find and comment "#find_package(KSysGuard ${PROJECT_DEP_VERSION} CO.....
#find and comment #add_subdirectory(devicenotifications)
nano ../kcms/CMakeLists.txt
#find and comment #add_subdirectory(region_language)
#find and comment #add_subdirectory(users)
nano ../kcms/region_language/localegenhelper/CMakeLists.txt
#find and comment  "PolkitQt6-1::Core" 
nano ../kcms/region_language/CMakeLists.txt
#find and comment exampleutility.cpp exampleutility.h
nano ../devicenotifications/CMakeLists.txt
#find and comment "UDev::UDev"
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON -DBUILD_CAMERAINDICATOR=OFF
make -j4
make install

#plasma-workspace-wallpapers
cd
wget $url/plasma-workspace-wallpapers-6.5.2.tar.xz
tar -xf plasma-workspace-wallpapers-6.5.2.tar.xz
cd plasma-workspace-wallpapers-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON
make -j4
make install

#plasma-integration
cd
wget $url/plasma-integration-6.5.2.tar.xz
tar -xf plasma-integration-6.5.2.tar.xz
cd plasma-integration-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF  -DBUILD_QT5=OFF -DBUILD_QT6=ON
make -j4
make install

#milou
cd
wget $url/milou-6.5.2.tar.xz
tar -xf milou-6.5.2.tar.xz
cd milou-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON
make -j4
make install

#frameworkintegration
cd
wget -O frameworkintegration-6.22.0.tar.gz https://github.com/KDE/frameworkintegration/archive/refs/tags/v6.22.0.tar.gz
tar -xf frameworkintegration-6.22.0.tar.gz
cd frameworkintegration-6.22.0
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON
make -j$(nproc)
make install

#ocean-sound-theme
cd
wget $url/ocean-sound-theme-6.5.2.tar.xz
tar -xf ocean-sound-theme-6.5.2.tar.xz
cd ocean-sound-theme-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON
make -j4
make install

#breeze
wget $url/breeze-6.5.2.tar.xz
tar -xf breeze-6.5.2.tar.xz
cd breeze-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_QT6=ON -DBUILD_QT5=OFF
make -j$(nproc)
make install

#breeze-gtk
wget $url/breeze-gtk-6.5.2.tar.xz
tar -xf breeze-gtk-6.5.2.tar.xz
cd breeze-gtk-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux -DBUILD_WITH_QT6=ON
make -j$(nproc)
make install

#oxygen
wget $url/oxygen-6.5.2.tar.xz
tar -xf oxygen-6.5.2.tar.xz
cd oxygen-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF  -DBUILD_QT5=OFF -DBUILD_QT6=ON
make -j4
make install

#oxygen-sounds
wget $url/oxygen-sounds-6.5.2.tar.xz
tar -xf oxygen-sounds-6.5.2.tar.xz
cd oxygen-sounds-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON
make -j4
make install

#plasma-nano
wget $url/plasma-nano-6.5.2.tar.xz
tar -xf plasma-nano-6.5.2.tar.xz
cd plasma-nano-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j4
make install

#KpluseaudioQt
wget -O pulseaudio-qt-1.7.0.tar.gz https://github.com/KDE/pulseaudio-qt/archive/refs/tags/v1.7.0.tar.gz
tar -xf pulseaudio-qt-1.7.0.tar.gz
cd pulseaudio-qt-1.7.0
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j4
make install

#plasma-pa
cd
wget $url/plasma-pa-6.5.2.tar.xz
tar -xf plasma-pa-6.5.2.tar.xz
cd plasma-pa-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j4
make install

#plasma-welcome
cd
wget $url/plasma-welcome-6.5.2.tar.xz
tar -xf plasma-welcome-6.5.2.tar.xz
cd plasma-welcome-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j4
make install

#purpose
cd
git clone https://github.com/KDE/purpose.git
cd purpose
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j4
make install

#plasma-browser-integration
cd
wget $url/plasma-browser-integration-6.5.2.tar.xz
tar -xf plasma-browser-integration-6.5.2.tar.xz
cd plasma-browser-integration-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DCOPY_MESSAGING_HOST_FILE_HOME=ON
make -j4
make install

#plasma-sdk
cd
wget $url/plasma-sdk-6.5.2.tar.xz
tar -xf plasma-sdk-6.5.2.tar.xz
cd plasma-sdk-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j4
make install

#qqc2-breeze-style
cd
wget $url/qqc2-breeze-style-6.5.2.tar.xz
tar -xf qqc2-breeze-style-6.5.2.tar.xz
cd qqc2-breeze-style-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j4
make install

#qqc2-desktop-style
cd
git clone https://github.com/KDE/qqc2-desktop-style.git
cd qqc2-desktop-style
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF
make -j4
make install

#plasma-desktop
cd
wget $url/plasma-desktop-6.5.2.tar.xz
tar -xf plasma-desktop-6.5.2.tar.xz
cd plasma-desktop-6.5.2
mkdir build && cd build
nano ../CMakeLists.txt 
#find and comment pkg_check_modules(LIBWACOM libwacom REQUIRED IMPORTED_TARGET)
#find and replace find_package(KWinDBusInterface CONFIG REQUIRED) with find_package(KWinX11DBusInterface CONFIG REQUIRED) 
#find and comment find_package(UDev)
#find and comment find_package(KSysGuard CONFIG REQUIRED)
nano ../kcms/tablet/CMakeLists.txt
#find and comment PkgConfig::LIBWACOM
nano ../applets/taskmanager/CMakeLists.txt
#find and comment KSysGuard::ProcessCore
nano ../kcms/gamecontroller/CMakeLists.txt
#find and comment UDev::UDev
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF   -DBUILD_WITH_QT6=ON -DBUILD_CAMERAINDICATOR=OFF -DBUILD_KCM_MOUSE_X11=OFF -DBUILD_KCM_TOUCHPAD_X11=OFF
# try
cmake .. \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_SYSTEM_NAME=Linux \
  -DBUILD_TESTING=OFF \
  -DBUILD_WITH_QT6=ON \
  -DBUILD_CAMERAINDICATOR=OFF \
  -DBUILD_KCM_MOUSE_X11=OFF \
  -DBUILD_KCM_TOUCHPAD_X11=OFF \
  -DBUILD_KCM_WACOM=OFF \
  -DBUILD_KCM_GAMECONTROLLER=OFF \
  -DBUILD_KCM_TABLET=OFF \
  -DBUILD_KCM_DEVICE_AUTOMATION=OFF \
  -DBUILD_KCM_POWERDEVIL=OFF
# ^ Still unfinished
make -j$(nproc)
make install

#systsystemsettings
cd
wget $url/systemsettings-6.5.2.tar.xz
tar -xf systemsettings-6.5.2.tar.xz
cd systemsettings-6.5.2
mkdir build && cd build
cmake ..   -DCMAKE_INSTALL_PREFIX=$PREFIX   -DCMAKE_BUILD_TYPE=Release   -DCMAKE_SYSTEM_NAME=Linux   -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON
make -j4
make install 