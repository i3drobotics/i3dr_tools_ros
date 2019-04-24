cmake_minimum_required(VERSION 2.8.3)
project(uno_imu)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  serial
  std_msgs
  sensor_msgs
  tf
)

catkin_package(
  CATKIN_DEPENDS
    serial
    std_msgs
    sensor_msgs
    imu_filter_madgwick
    tf
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(imu_serial src/imu_serial.cpp)

target_link_libraries(imu_serial
  ${catkin_LIBRARIES}
)
