#!/bin/bash

# DEIMOS dependencies
sudo apt-get install libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt install ros-kinetic-joint-state-publisher ros-kinetic-stereo-image-proc ros-kinetic-robot-state-publisher ros-kinetic-xacro

# REALSENSE dependencies
sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
sudo apt-get install librealsense2-dkms
sudo apt-get install librealsense2-utils
sudo apt-get install librealsense2-dev
sudo apt-get install librealsense2-dbg

# Registration and localisation dependencies
sudo apt-get install ros-kinetic-serial
sudo apt-get install ros-kinetic-rtabmap
sudo apt-get install ros-kinetic-robot-localization
sudo apt-get install ros-kinetic-imu-tools

sudo apt-get update
sudo apt-get upgrade