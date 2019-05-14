/***
 * This example expects the serial port has a loopback on it.
 *
 * Alternatively, you could use an Arduino:
 *
 * <pre>
 *  void setup() {
 *    Serial.begin(<insert your baudrate here>);
 *  }
 *
 *  void loop() {
 *    if (Serial.available()) {
 *      Serial.write(Serial.read());
 *    }
 *  }
 * </pre>
 */

#include <ros/ros.h>
#include <serial/serial.h>
#include <std_msgs/String.h>
#include <std_msgs/Empty.h>
#include "std_msgs/Float64.h"
#include "sensor_msgs/Imu.h"
#include "sensor_msgs/MagneticField.h"
#include <tf/transform_broadcaster.h>

#include <math.h>

serial::Serial ser;

ros::Publisher imu_data_raw_pub;
ros::Publisher imu_mag_pub;

struct ImuData
{
    double ax;
    double ay;
    double az;
    double gx;
    double gy;
    double gz;
    double mx;
    double my;
    double mz;
    double r;
    double p;
    double y;
};

void write_callback(const std_msgs::String::ConstPtr &msg)
{
    ROS_INFO_STREAM("Writing to serial port" << msg->data);
    ser.write(msg->data);
}

std::vector<std::string> split_delim(std::string data, std::string delim)
{
    std::vector<std::string> data_split;
    char start = 0U;
    char end = data.find(delim);
    while (end != std::string::npos)
    {
        data_split.push_back(data.substr(start, end - start));

        start = end + delim.length();
        end = data.find(delim, start);
    }
    data_split.push_back(data.substr(start, end));
    return (data_split);
}

void publish_imu_data(ImuData imu_data)
{
    sensor_msgs::Imu imu_data_raw_msg;
    sensor_msgs::MagneticField imu_magnetic_msg;
    std_msgs::Float64 imu_temperature_msg;
    
    double orientation_stddev = 0.1;
    double linear_acceleration_stddev = 0.023145;
    double angular_velocity_stddev = 0.0010621;
    double magnetic_field_stddev = 0.00000080786;
    /*
    double linear_acceleration_stddev = 0;
    double angular_velocity_stddev = 0;
    double magnetic_field_stddev = 0;
    */

    double orientation_cov = orientation_stddev * orientation_stddev;
    double linear_acceleration_cov = linear_acceleration_stddev * linear_acceleration_stddev;
    double angular_velocity_cov = angular_velocity_stddev * angular_velocity_stddev;
    double magnetic_field_cov = magnetic_field_stddev * magnetic_field_stddev;
    std::string frame_id = "imu_link";

    imu_data_raw_msg.header.stamp = imu_magnetic_msg.header.stamp = ros::Time::now();

    //imu_data_raw_msg has no orientation values
    //imu_data_raw_msg.orientation_covariance[0] = -1;
    imu_data_raw_msg.orientation_covariance[0] =
        imu_data_raw_msg.orientation_covariance[4] =
            imu_data_raw_msg.orientation_covariance[8] = orientation_cov;

    imu_data_raw_msg.linear_acceleration_covariance[0] =
        imu_data_raw_msg.linear_acceleration_covariance[4] =
            imu_data_raw_msg.linear_acceleration_covariance[8] = linear_acceleration_cov;

    imu_data_raw_msg.angular_velocity_covariance[0] =
        imu_data_raw_msg.angular_velocity_covariance[4] =
            imu_data_raw_msg.angular_velocity_covariance[8] = angular_velocity_cov;

    imu_magnetic_msg.magnetic_field_covariance[0] =
        imu_magnetic_msg.magnetic_field_covariance[4] =
            imu_magnetic_msg.magnetic_field_covariance[8] = magnetic_field_cov;

    imu_data_raw_msg.header.stamp =
        imu_magnetic_msg.header.stamp = ros::Time::now();

    imu_data_raw_msg.header.frame_id =
        imu_magnetic_msg.header.frame_id = frame_id;

    double CONVERTOR_G2A = 9.80665;
    double CONVERTOR_D2R = M_PI/180;
    double CONVERTOR_UT2T = 1000000;

    // original data used degrees unit, convert to radians
    tf::Quaternion ori_quat;
    ori_quat.setRPY(imu_data.r * CONVERTOR_D2R,imu_data.p * CONVERTOR_D2R,imu_data.y * CONVERTOR_D2R);
    imu_data_raw_msg.orientation.x = ori_quat[0];
    imu_data_raw_msg.orientation.y = ori_quat[1];
    imu_data_raw_msg.orientation.z = ori_quat[2];
    imu_data_raw_msg.orientation.w = ori_quat[3];

    // original data used the g unit, convert to m/s^2
    imu_data_raw_msg.linear_acceleration.x = imu_data.ax * CONVERTOR_G2A;
    imu_data_raw_msg.linear_acceleration.y = imu_data.ay * CONVERTOR_G2A;
    imu_data_raw_msg.linear_acceleration.z = imu_data.az * CONVERTOR_G2A;

    // original data used the degree/s unit, convert to radian/s
    imu_data_raw_msg.angular_velocity.x = imu_data.gx * CONVERTOR_D2R;
    imu_data_raw_msg.angular_velocity.y = imu_data.gy * CONVERTOR_D2R;
    imu_data_raw_msg.angular_velocity.z = imu_data.gz * CONVERTOR_D2R;

    // original data used the uTesla unit, convert to Tesla
    imu_magnetic_msg.magnetic_field.x = imu_data.mx / CONVERTOR_UT2T;
    imu_magnetic_msg.magnetic_field.y = imu_data.my / CONVERTOR_UT2T;
    imu_magnetic_msg.magnetic_field.z = imu_data.mz / CONVERTOR_UT2T;

    imu_data_raw_pub.publish(imu_data_raw_msg);
    imu_mag_pub.publish(imu_magnetic_msg);
}

ImuData process_serial(std::string data)
{
    ImuData imu_data;
    //check string is correct format
    int string_length = data.length();
    if (string_length > 30)
    {
        //check string ends with '\n'
        if (data.at(string_length - 1) == '\n')
        {
            // remove brackets
            std::string data_newline_removed = data.substr(0, string_length - 2);

            // comma seperate
            std::vector<std::string> data_split_elements = split_delim(data_newline_removed, ";");
            if (data_split_elements.size() == 4)
            {
                for (std::vector<std::string>::iterator it = data_split_elements.begin(); it != data_split_elements.end(); it++)
                {
                    std::vector<std::string> data_split_vals = split_delim(*it, ",");
                    if (data_split_vals.size() == 4)
                    {
                        std::string data_name = data_split_vals.at(0);
                        double data_x = std::atof(data_split_vals.at(1).c_str());
                        double data_y = std::atof(data_split_vals.at(2).c_str());
                        double data_z = std::atof(data_split_vals.at(3).c_str());
                        //ROS_INFO("%s: %f %f %f", data_name.c_str(), data_x, data_y, data_z);
                        if (data_name == "accel")
                        {
                            imu_data.ax = data_x;
                            imu_data.ay = data_y;
                            imu_data.az = data_z;
                        }
                        else if (data_name == "gyro")
                        {
                            imu_data.gx = data_x;
                            imu_data.gy = data_y;
                            imu_data.gz = data_z;
                        }
                        else if (data_name == "mag")
                        {
                            imu_data.mx = data_x;
                            imu_data.my = data_y;
                            imu_data.mz = data_z;
                        }
                        else if (data_name == "madgwick"){
                            imu_data.r = data_x;
                            imu_data.p = data_y;
                            imu_data.y = data_z;
                        }
                        else
                        {
                            //ROS_ERROR("Invalid serial data. Data name Must be 'accel/gyro/mag'");
                        }
                    }
                    else
                    {
                        //ROS_ERROR("Invalid serial data. Values array is of incorrect size");
                    }
                }
            }
            else
            {
                //ROS_ERROR("Invalid serial data. Incorrect number of elements");
            }
        }
        else
        {
            //ROS_ERROR("Invalid serial data. Serial data is missing '\n' from near end. MUST be in the format: '{\"accel\":[0,0,0],\"gyro\":[0,0,0],\"mag\":[0,0,0]}\\n'");
        }
    }
    else
    {
        //ROS_ERROR("Invalid serial data. Serial data is too small. MUST be in the format: '\"accel\",0,0,0;\"gyro\",0,0,0;\"mag\",0,0,0\\n'");
    }
    return (imu_data);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "serial_example_node");
    ros::NodeHandle nh;

    std::string port;
    int baud;
    nh.param<std::string>("port", port, "/dev/ttyACM0");
    nh.param<int>("baud", baud, 115200);

    ros::Subscriber write_sub = nh.subscribe("write_to_imu", 1000, write_callback);
    imu_data_raw_pub = nh.advertise<sensor_msgs::Imu>("imu/data_raw", 1);
    imu_mag_pub = nh.advertise<sensor_msgs::MagneticField>("imu/mag", 1);

    try
    {
        ser.setPort(port);
        ser.setBaudrate(baud);
        serial::Timeout to = serial::Timeout::simpleTimeout(1000);
        ser.setTimeout(to);
        ser.open();
    }
    catch (serial::IOException &e)
    {
        ROS_ERROR_STREAM("Unable to open port ");
        return -1;
    }

    if (ser.isOpen())
    {
        ROS_INFO_STREAM("Serial Port initialized");
    }
    else
    {
        return -1;
    }

    ros::Rate loop_rate(80);
    while (ros::ok())
    {

        ros::spinOnce();

        if (ser.available())
        {
            std::string serial_data = ser.readline(ser.available());
            if (serial_data == "init\r\n"){
                ROS_INFO("Initalising IMU...");
            }
            if (serial_data == "cal\r\n"){
                ROS_INFO("Move in figure of 8 to calibrate magnetometer...");
            }
            if (serial_data == "ready\r\n"){
                ROS_INFO("Done.");
                ROS_INFO("Continously reading IMU data");
            }
            ImuData imu_data = process_serial(serial_data);
            publish_imu_data(imu_data);
        }
        loop_rate.sleep();
    }
    ser.close();
}
