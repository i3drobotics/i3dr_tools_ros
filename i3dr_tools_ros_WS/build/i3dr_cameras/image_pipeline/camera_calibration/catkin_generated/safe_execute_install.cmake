execute_process(COMMAND "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_cameras/image_pipeline/camera_calibration/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_cameras/image_pipeline/camera_calibration/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
