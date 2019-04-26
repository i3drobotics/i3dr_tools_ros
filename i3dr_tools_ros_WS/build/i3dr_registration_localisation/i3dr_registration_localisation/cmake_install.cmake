# Install script for directory: /home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_registration_localisation/i3dr_registration_localisation

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_registration_localisation/i3dr_registration_localisation/catkin_generated/installspace/i3dr_registration_localisation.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_registration_localisation/cmake" TYPE FILE FILES
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_registration_localisation/i3dr_registration_localisation/catkin_generated/installspace/i3dr_registration_localisationConfig.cmake"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/build/i3dr_registration_localisation/i3dr_registration_localisation/catkin_generated/installspace/i3dr_registration_localisationConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/i3dr_registration_localisation" TYPE FILE FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/src/i3dr_registration_localisation/i3dr_registration_localisation/package.xml")
endif()

