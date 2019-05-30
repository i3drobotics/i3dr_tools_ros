#include "ros/ros.h"
#include "std_msgs/String.h"

#include <message_filters/subscriber.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/synchronizer.h>

#include <sensor_msgs/CameraInfo.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/JointState.h>

#include <std_srvs/Empty.h>

#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>

#include <cv_bridge/cv_bridge.h>
#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/ximgproc.hpp"
#include "opencv2/imgcodecs.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/core/utility.hpp"
#include "opencv2/aruco/dictionary.hpp"
#include "opencv2/aruco.hpp"

int STATE_CAMERA = 0;
int STATE_ARM = 1;
int state = STATE_CAMERA;

sensor_msgs::ImageConstPtr MSG_LEFT_IMAGE;
sensor_msgs::CameraInfoConstPtr MSG_CAMERA_INFO;

typedef message_filters::sync_policies::ApproximateTime<
    sensor_msgs::Image, sensor_msgs::CameraInfo>
    policy_t;

void cameraInfo_to_KDRP(const sensor_msgs::CameraInfoConstPtr msg_camera_info, cv::Mat &K, cv::Mat &D, cv::Mat &R, cv::Mat &P)
{
    K = cv::Mat(3, 3, CV_64FC1, (void *)msg_camera_info->K.data());
    D = cv::Mat(1, 5, CV_64FC1, (void *)msg_camera_info->D.data());
    R = cv::Mat(3, 3, CV_64FC1, (void *)msg_camera_info->R.data());
    P = cv::Mat(3, 4, CV_64FC1, (void *)msg_camera_info->P.data());
}

void createArucoMarkers()
{
    cv::Mat outputMarker;
    cv::Ptr<cv::aruco::Dictionary> markerDictionary = cv::aruco::getPredefinedDictionary(cv::aruco::PREDEFINED_DICTIONARY_NAME::DICT_5X5_50);
    for (int i = 0; i < 50; i++)
    {
        cv::aruco::drawMarker(markerDictionary, i, 500, outputMarker, 1);
        std::ostringstream convert;
        std::string imageName = "4x4Marker_";
        convert << imageName << i << ".jpg";
        imwrite(convert.str(), outputMarker);
    }
}

tf::StampedTransform getTf(std::string tf_a, std::string tf_b)
{
    tf::TransformListener tf_listener;
    tf::StampedTransform transform;
    try
    {
        tf_listener.waitForTransform(tf_a, tf_b, ros::Time(0), ros::Duration(2.0));
        tf_listener.lookupTransform(tf_a, tf_b, ros::Time(0), transform);
    }
    catch (tf::TransformException ex)
    {
        ROS_ERROR("%s", ex.what());
        ros::Duration(1.0).sleep();
    }
    return (transform);
}

bool findAruco(cv::Mat frame, cv::Mat camera_matrix, cv::Mat camera_distortion, tf::Transform& cam_aruco_tf)
{
    bool valid_aruco;
    cv::aruco::DetectorParameters parameters;
    std::vector<int> markerIds;
    std::vector<std::vector<cv::Point2f>> markerCorners, rejectedCansidates;

    cv::Ptr<cv::aruco::Dictionary> markerDictionary = cv::aruco::getPredefinedDictionary(cv::aruco::PREDEFINED_DICTIONARY_NAME::DICT_ARUCO_ORIGINAL);
    float aruco_marker_length = 0.05;

    std::vector<cv::Vec3d> rotationVectors, translationVectors;

    cv::Mat Rotationmatrix;
    cv::Mat WorldPoints1(3, 1, CV_64FC1);
    cv::Mat WorldPoints2(3, 1, CV_64FC1);
    cv::Mat WorldPoints3(3, 1, CV_64FC1);
    cv::Mat WorldPoints4(3, 1, CV_64FC1);

    cv::Mat ImagePoints1(3, 1, CV_64FC1);
    cv::Mat ImagePoints2(3, 1, CV_64FC1);
    cv::Mat ImagePoints3(3, 1, CV_64FC1);
    cv::Mat ImagePoints4(3, 1, CV_64FC1);
    cv::Mat translationMatrix(3, 1, CV_64FC1);

    cv::aruco::detectMarkers(frame, markerDictionary, markerCorners, markerIds);
    if (markerCorners.size() > 0)
    {
        cv::aruco::estimatePoseSingleMarkers(markerCorners, aruco_marker_length, camera_matrix, camera_distortion, rotationVectors, translationVectors);

        ImagePoints1.at<double>(0, 0) = markerCorners[0][0].x;
        ImagePoints1.at<double>(1, 0) = markerCorners[0][0].y;
        ImagePoints1.at<double>(2, 0) = 0.0f;

        ImagePoints2.at<double>(0, 0) = markerCorners[0][1].x;
        ImagePoints2.at<double>(1, 0) = markerCorners[0][1].y;
        ImagePoints2.at<double>(2, 0) = 0.0f;

        ImagePoints3.at<double>(0, 0) = markerCorners[0][2].x;
        ImagePoints3.at<double>(1, 0) = markerCorners[0][2].y;
        ImagePoints3.at<double>(2, 0) = 0.0f;

        ImagePoints4.at<double>(0, 0) = markerCorners[0][3].x;
        ImagePoints4.at<double>(1, 0) = markerCorners[0][3].y;
        ImagePoints4.at<double>(2, 0) = 0.0f;

        translationMatrix.at<double>(0, 0) = translationVectors[0].val[0];
        translationMatrix.at<double>(1, 0) = translationVectors[0].val[1];
        translationMatrix.at<double>(2, 0) = translationVectors[0].val[2];

        for (int i = 0; i < markerIds.size(); i++)
        {
            cv::aruco::drawAxis(frame, camera_matrix, camera_distortion, rotationVectors[i], translationVectors[i], aruco_marker_length);
            Rodrigues(rotationVectors[i], Rotationmatrix);
            WorldPoints1 = (Rotationmatrix.t() * ImagePoints1) - (Rotationmatrix.t() * translationMatrix);
            WorldPoints2 = (Rotationmatrix.t() * ImagePoints2) - (Rotationmatrix.t() * translationMatrix);
            WorldPoints3 = (Rotationmatrix.t() * ImagePoints3) - (Rotationmatrix.t() * translationMatrix);
            WorldPoints4 = (Rotationmatrix.t() * ImagePoints4) - (Rotationmatrix.t() * translationMatrix);
            //std::cout << "T" << translationVectors[i] << std::endl;
        }

        cam_aruco_tf;
        cam_aruco_tf.setOrigin(tf::Vector3(translationVectors[0].val[0], translationVectors[0].val[1], translationVectors[0].val[2]));
        tf::Quaternion q;
        q.setRPY(rotationVectors[0].val[0], rotationVectors[0].val[1], rotationVectors[0].val[2]);
        cam_aruco_tf.setRotation(q);

        valid_aruco = true;
    }
    else
    {
        valid_aruco = false;
        ROS_INFO("No Aruco found");
    }
    cv::Mat frame_resize;
    cv::resize(frame, frame_resize, cv::Size(960, 540));
    cv::imshow("i3dr_hand_eye", frame_resize);
    cv::waitKey(1);

    return valid_aruco;
}

void imageCallback(const sensor_msgs::ImageConstPtr &msg_image, const sensor_msgs::CameraInfoConstPtr &msg_camera_info)
{
    MSG_LEFT_IMAGE = msg_image;
    MSG_CAMERA_INFO = msg_camera_info;
}

bool trig_aruco_robot(std_srvs::Empty::Request &request, std_srvs::Empty::Response &response)
{
    ROS_INFO("aruco robot alignment triggered");
    //get transform from aruco marker to tooltip
    tf::StampedTransform arcuo_to_tooltip_tf = getTf("tool0","world");
    
    tf::Transform rotate_world_tf;
    tf::Quaternion q;
    q.setRPY(3.14, 0, 0);
    rotate_world_tf.setRotation(q);

    tf::Transform rot_world_tf = rotate_world_tf * arcuo_to_tooltip_tf;

    //transform world->robot_base so that aruco marker == tooltip
    static tf::TransformBroadcaster tf_br;
    tf_br.sendTransform(tf::StampedTransform(rot_world_tf, ros::Time::now(), "world", "base_link"));
    return(true);
}

bool trig_aruco_camera(std_srvs::Empty::Request &request, std_srvs::Empty::Response &response)
{
    ROS_INFO("aruco camera alignment triggered");
    try
    {
        ROS_INFO("loading image...");
        cv_bridge::CvImagePtr input_image;
        input_image = cv_bridge::toCvCopy(MSG_LEFT_IMAGE, "mono8");
        cv::Mat K, D, R, P;
        ROS_INFO("extracting info...");
        cameraInfo_to_KDRP(MSG_CAMERA_INFO, K, D, R, P);
        std::string camera_frame = MSG_CAMERA_INFO->header.frame_id;
        std::string camera_base_frame = "phobos_base_link";

        ROS_INFO("detecting aruco...");
        //find transform from aruco to camera left
        tf::Transform cam_aruco_tf;
        bool aruco_found = findAruco(input_image->image, K, D, cam_aruco_tf);

        if (aruco_found){
            //find transform from camera_left to camera_base
            tf::StampedTransform camera_left_to_base_tf = getTf(camera_base_frame,camera_frame);

            //find transform from aruco_marker to camera_base
            //transform world->camera_base where aruco_marker is world zero
            tf::Transform camera_base_to_aruco_tf = camera_left_to_base_tf * cam_aruco_tf;

            static tf::TransformBroadcaster tf_br;
            tf_br.sendTransform(tf::StampedTransform(camera_base_to_aruco_tf, ros::Time::now(), "world", camera_base_frame));
            ROS_INFO("camera calibrated to world coordinates (aruco is world zero)");
        }
    }
    catch (cv_bridge::Exception &e)
    {
        ROS_ERROR("exception %s", e.what());
    }
    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "i3dr_hand_eye");
    ros::NodeHandle nh;
    ros::NodeHandle p_nh("~");

    std::string camera_namespace, world_tf, arm_tooltip_tf;

    bool save_current_tf = false;

    //Get parameters
    if (p_nh.getParam("camera_namespace", camera_namespace))
    {
        ROS_INFO("camera_namespace: %s", camera_namespace.c_str());
    }
    if (p_nh.getParam("world_tf", world_tf))
    {
        ROS_INFO("world_tf: %s", world_tf.c_str());
    }
    if (p_nh.getParam("arm_tooltip_tf", arm_tooltip_tf))
    {
        ROS_INFO("arm_tooltip_tf: %s", arm_tooltip_tf.c_str());
    }

    cv::namedWindow("i3dr_hand_eye");
    cv::startWindowThread();
    
    //TODO: add loading previous calibration from yaml
    //TODO: add saving calibration to yaml

    ros::ServiceServer srv_aruco_cam = nh.advertiseService("trig_aruco_camera", trig_aruco_camera);
    ros::ServiceServer srv_aruco_robot = nh.advertiseService("trig_aruco_robot", trig_aruco_robot);

    // Subscribers creation.
    message_filters::Subscriber<sensor_msgs::Image> sub_image_l(nh, camera_namespace + "/image_raw", 1);
    message_filters::Subscriber<sensor_msgs::CameraInfo> sub_camera_info_l(nh, camera_namespace + "/camera_info", 1);

    // Message filter creation.
    message_filters::Synchronizer<policy_t> sync(policy_t(10), sub_image_l, sub_camera_info_l);
    sync.registerCallback(boost::bind(&imageCallback, _1, _2));

    while (ros::ok())
    {
        //get tf from tooltip
        tf::StampedTransform world_arm_tooltip_tf = getTf(world_tf, arm_tooltip_tf);
        float x = world_arm_tooltip_tf.getOrigin().getX();
        float y = world_arm_tooltip_tf.getOrigin().getY();
        float z = world_arm_tooltip_tf.getOrigin().getZ();
        //std::cout << x << "," << y << "," << z << std::endl;
        if (save_current_tf)
        {
            save_current_tf = false;
            if (state == STATE_CAMERA)
            {
            }
            else if (state == STATE_ARM)
            {
            }
        }

        ros::spinOnce();
    }

    cv::destroyWindow("i3dr_hand_eye");
    return 0;
}