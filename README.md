# I3DR TOOLS ROS

A ROS workspace and collection of tools for working with I3DR cameras

## Auto install package dependences

Run install script to automatically install the required packages

``` bash
./install.sh
```

## Manually install package dependences

### i3dr_realsense

Follow realsense instructions for install realsense in ROS
[link](https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md#installing-the-packages)

### i3dr_deimos

Follow deimos install instructions 
[link](https://github.com/i3drobotics/deimos-ros/blob/master/README.md)

### i3dr_registration_localisation:

``` bash
sudo apt-get install ros-kinetic-serial
sudo apt-get install ros-kinetic-rtabmap
sudo apt-get install ros-kinetic-robot-localization
sudo apt-get install ros-kinetic-imu-tools
```

### Build ros workspace

To build the ros workspace use:

``` bash
catkin_make [OPTIONS]
```

#### Build options

Build without/with i3dr algorithm. Will not be able to use algorithm index 2 in

Package : i3dr_stereo_camera

Node : generate_disparity

```
-DENABLE_I3DR_ALG=[ON/OFF]
```
