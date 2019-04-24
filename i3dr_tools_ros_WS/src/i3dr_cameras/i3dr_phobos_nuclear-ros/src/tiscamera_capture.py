#!/usr/bin/env python3

# Starter for The Imaging Source cameras in ros.
# Needs Python 3
# Please refer to https://github.com/TheImagingSource/tiscamera
# Goto: http://wiki.ros.org/gscam for info.
# Install sudo apt-get install ros-kinetic-gscam

import tiscamera

# Open the camera. Parameters are serial number, width, height, frame rate, color and liveview.
cam = tiscamera.Camera("17719924", 1920, 1080, 30, True, False)

# Start the live stream from the camera and also "rosrun"
cam.start_pipeline()

# Set some properties
cam.set_property("Exposure Auto", True)
cam.set_property("Gain Auto", True)
cam.set_property("Brightness Reference", 128)


input("Press Enter to end program")

# Stop the camera pipeline.
cam.stop_pipeline()

print('Program ended')