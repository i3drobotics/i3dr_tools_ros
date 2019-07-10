#include <ros/ros.h>
#include <ros/console.h>
#include <ros/param.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "imu_to_tf");
    ros::NodeHandle nh;
    ros::NodeHandle p_nh("~");

    ros::spin();

    return 0;
}