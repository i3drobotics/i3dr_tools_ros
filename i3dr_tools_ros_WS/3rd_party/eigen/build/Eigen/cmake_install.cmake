# Install script for directory: /home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen" TYPE FILE FILES
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/QtAlignedMalloc"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Jacobi"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/SPQRSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/SparseLU"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/UmfPackSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/PardisoSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/StdList"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/CholmodSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/LU"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/IterativeLinearSolvers"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Eigenvalues"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Core"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/StdVector"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/MetisSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Sparse"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Eigen"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Dense"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Cholesky"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/StdDeque"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/SparseCholesky"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/SparseQR"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Geometry"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/OrderingMethods"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/SparseCore"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/SuperLUSupport"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/SVD"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/QR"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/Householder"
    "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/PaStiXSupport"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen" TYPE DIRECTORY FILES "/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/eigen/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

