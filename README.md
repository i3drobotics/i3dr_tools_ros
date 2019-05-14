# Auto install package dependences
Run install script to automatically install the required packages
	./install.sh

# Manually install package dependences
## i3dr_realsense:
Follow realsense instructions for install realsense in ROS
[link](https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md#installing-the-packages)
## i3dr_deimos:
Follow deimos install instructions 
[link](https://github.com/i3drobotics/deimos-ros/blob/master/README.md)

## i3dr_registration_localisation:
	sudo apt-get install ros-kinetic-serial
	sudo apt-get install ros-kinetic-rtabmap
	sudo apt-get install ros-kinetic-robot-localization
	sudo apt-get install ros-kinetic-imu-tools
