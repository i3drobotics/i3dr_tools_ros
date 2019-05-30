# Install script for directory: /home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_phobos-ros

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_phobos/srv" TYPE FILE FILES
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_phobos-ros/srv/SetFloat.srv"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_phobos-ros/srv/SetInt.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_phobos/cmake" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/i3dr_cameras/i3dr_phobos-ros/catkin_generated/installspace/i3dr_phobos-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/devel/include/i3dr_phobos")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/devel/share/roseus/ros/i3dr_phobos")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/devel/share/common-lisp/ros/i3dr_phobos")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/devel/share/gennodejs/ros/i3dr_phobos")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/devel/lib/python2.7/dist-packages/i3dr_phobos")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/devel/lib/python2.7/dist-packages/i3dr_phobos")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/i3dr_cameras/i3dr_phobos-ros/catkin_generated/installspace/i3dr_phobos.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_phobos/cmake" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/i3dr_cameras/i3dr_phobos-ros/catkin_generated/installspace/i3dr_phobos-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_phobos/cmake" TYPE FILE FILES
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/i3dr_cameras/i3dr_phobos-ros/catkin_generated/installspace/i3dr_phobosConfig.cmake"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build-src-Desktop-Default/i3dr_cameras/i3dr_phobos-ros/catkin_generated/installspace/i3dr_phobosConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_phobos" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_cameras/i3dr_phobos-ros/package.xml")
endif()

