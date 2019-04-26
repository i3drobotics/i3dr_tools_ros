# Install script for directory: /home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_stereo_camera/srv" TYPE FILE FILES
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetFloat.srv"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/srv/SetInt.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_stereo_camera/cmake" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_cameras/i3dr_stereo_camera-ros/catkin_generated/installspace/i3dr_stereo_camera-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/include/i3dr_stereo_camera")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/share/roseus/ros/i3dr_stereo_camera")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/share/common-lisp/ros/i3dr_stereo_camera")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/share/gennodejs/ros/i3dr_stereo_camera")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/lib/python2.7/dist-packages/i3dr_stereo_camera")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/lib/python2.7/dist-packages/i3dr_stereo_camera")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/i3dr_stereo_camera" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/include/i3dr_stereo_camera/i3DR_DisparityConfig.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/i3dr_stereo_camera" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/lib/python2.7/dist-packages/i3dr_stereo_camera/__init__.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/lib/python2.7/dist-packages/i3dr_stereo_camera/cfg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages/i3dr_stereo_camera" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/devel/lib/python2.7/dist-packages/i3dr_stereo_camera/cfg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_cameras/i3dr_stereo_camera-ros/catkin_generated/installspace/i3dr_stereo_camera.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_stereo_camera/cmake" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_cameras/i3dr_stereo_camera-ros/catkin_generated/installspace/i3dr_stereo_camera-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_stereo_camera/cmake" TYPE FILE FILES
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_cameras/i3dr_stereo_camera-ros/catkin_generated/installspace/i3dr_stereo_cameraConfig.cmake"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_cameras/i3dr_stereo_camera-ros/catkin_generated/installspace/i3dr_stereo_cameraConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_stereo_camera" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_stereo_camera-ros/package.xml")
endif()

