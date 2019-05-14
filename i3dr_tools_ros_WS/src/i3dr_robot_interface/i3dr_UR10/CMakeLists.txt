cmake_minimum_required(VERSION 2.8.3)
set (CMAKE_CXX_STANDARD 11)
project(i3dr_ur10)

find_package(catkin REQUIRED COMPONENTS
                roscpp std_msgs tf rospy std_srvs
            )

include_directories(
    ${catkin_INCLUDE_DIRS}
)

catkin_package(
    #INCLUDE_DIRS include
	CATKIN_DEPENDS roscpp std_msgs
	LIBRARIES ${PROJECT_NAME}
)