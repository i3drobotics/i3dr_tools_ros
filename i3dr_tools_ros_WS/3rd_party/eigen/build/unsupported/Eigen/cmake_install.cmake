# Install script for directory: /home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen

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
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/AdolcForward"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/AlignedVector3"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/ArpackSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/AutoDiff"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/BVH"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/EulerAngles"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/FFT"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/IterativeSolvers"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/KroneckerProduct"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/LevenbergMarquardt"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/MatrixFunctions"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/MoreVectorization"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/MPRealSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/NonLinearOptimization"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/NumericalDiff"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/OpenGLSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/Polynomials"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/Skyline"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/SparseExtra"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/SpecialFunctions"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/Splines"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/unsupported/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/build/unsupported/Eigen/CXX11/cmake_install.cmake")

endif()

