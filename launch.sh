#!/data/data/com.termux/files/usr/bin/bash

export QT_QPA_PLATFORM=xcb
export QT_XCB_GL_INTEGRATION=none
export QT_QUICK_BACKEND=software
export KDE_FULL_SESSION=true
export XDG_CURRENT_DESKTOP=KDE
export XDG_SESSION_TYPE=x11
export KF6_PREFIX=$PREFIX

# hardware acceleration
#GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.0 \
#MESA_LOADER_DRIVER_OVERRIDE=zink TU_DEBUG=noconform \
#MESA_LOADER_DRIVER_OVERRIDE=zink \
GALLIUM_DRIVER=zink MESA_GL_VERSION_OVERRIDE=4.3COMPAT \
termux-x11 :1 -xstartup "dbus-launch --exit-with-session plasma_session"