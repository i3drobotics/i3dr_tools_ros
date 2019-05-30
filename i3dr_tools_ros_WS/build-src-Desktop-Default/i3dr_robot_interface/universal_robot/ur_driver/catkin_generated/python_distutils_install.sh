#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_robot_interface/universal_robot/ur_driver"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/usr/local/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/usr/local/lib/python2.7/dist-packages:/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default" \
    "/usr/bin/python" \
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_robot_interface/universal_robot/ur_driver/setup.py" \
    build --build-base "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/i3dr_robot_interface/universal_robot/ur_driver" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/usr/local" --install-scripts="/usr/local/bin"
