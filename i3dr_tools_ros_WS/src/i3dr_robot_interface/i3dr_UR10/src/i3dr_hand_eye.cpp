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
sensor_msgs::ImageConstPtr MSG_RIGHT_IMAGE;
sensor_msgs::CameraInfoConstPtr MSG_CAMERA_INFO_LEFT;
sensor_msgs::CameraInfoConstPtr MSG_CAMERA_INFO_RIGHT;

typedef message_filters::sync_policies::ApproximateTime<
    sensor_msgs::Image,sensor_msgs::Image, sensor_msgs::CameraInfo, sensor_msgs::CameraInfo>
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

    //cv::Ptr<cv::aruco::Dictionary> markerDictionary = cv::aruco::getPredefinedDictionary(cv::aruco::PREDEFINED_DICTIONARY_NAME::DICT_ARUCO_ORIGINAL);
    cv::Ptr<cv::aruco::Dictionary> markerDictionary = cv::aruco::getPredefinedDictionary(cv::aruco::PREDEFINED_DICTIONARY_NAME::DICT_6X6_250);
    float aruco_marker_length = 0.045;

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

    ROS_INFO("Detecting markers...");
    cv::aruco::detectMarkers(frame, markerDictionary, markerCorners, markerIds);
    if (markerCorners.size() > 0)
    {
        //cv::aruco::estimatePoseSingleMarkers(markerCorners, aruco_marker_length, camera_matrix, camera_distortion, rotationVectors, translationVectors);
        
        if (markerIds.size() > 0){
            ROS_INFO("Creating grid...");
            cv::Ptr<cv::aruco::GridBoard> board = cv::aruco::GridBoard::create(4, 3, 0.045, 0.0095, markerDictionary,1);
            ROS_INFO("Getting pose...");
            cv::Vec3d rvec, tvec;
            int valid = cv::aruco::estimatePoseBoard(markerCorners,markerIds,board,camera_matrix,camera_distortion,rvec, tvec);
            if (valid > 0){
                ROS_INFO("Drawing markers...");
                cv::aruco::drawAxis(frame, camera_matrix, camera_distortion, rvec, tvec, aruco_marker_length);
                
                ROS_INFO("Getting markers tf...");
                cam_aruco_tf.setOrigin(tf::Vector3(tvec.val[0], tvec.val[1], tvec.val[2]));
                tf::Quaternion q;
                q.setRPY(rvec.val[0], rvec.val[1], rvec.val[2]);
                cam_aruco_tf.setRotation(q);

                ROS_INFO("Done.");

                valid_aruco = true;
            } else {
                valid_aruco = false;
                ROS_INFO("No Aruco found");
            }
        } else {
            valid_aruco = false;
            ROS_INFO("No Aruco found");
        }

        //std::cout << "T" << translationVectors[0] << std::endl;
        //std::cout << "R" << rotationVectors[0] << std::endl; 
    }
    else
    {
        valid_aruco = false;
        ROS_INFO("No Aruco found");
    }

    return valid_aruco;
}

void imageCallback(const sensor_msgs::ImageConstPtr &msg_image_left, const sensor_msgs::ImageConstPtr &msg_image_right, const sensor_msgs::CameraInfoConstPtr &msg_camera_info_left, const sensor_msgs::CameraInfoConstPtr &msg_camera_info_right)
{
    MSG_LEFT_IMAGE = msg_image_left;
    MSG_CAMERA_INFO_LEFT = msg_camera_info_left;
    MSG_RIGHT_IMAGE = msg_image_right;
    MSG_CAMERA_INFO_RIGHT = msg_camera_info_right;
}

bool trig_aruco_robot(std_srvs::Empty::Request &request, std_srvs::Empty::Response &response)
{
    ROS_INFO("aruco robot alignment triggered");
    //get transform from aruco marker to tooltip
    tf::StampedTransform arcuo_to_tooltip_tf = getTf("tool0","base_link");
    
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
        cv_bridge::CvImagePtr left_image, right_image;
        left_image = cv_bridge::toCvCopy(MSG_LEFT_IMAGE, "mono8");
        right_image = cv_bridge::toCvCopy(MSG_RIGHT_IMAGE, "mono8");
        cv::Mat Kl, Dl, Rl, Pl, Kr, Dr, Rr, Pr;
        ROS_INFO("extracting info...");
        cameraInfo_to_KDRP(MSG_CAMERA_INFO_LEFT, Kl, Dl, Rl, Pl);
        cameraInfo_to_KDRP(MSG_CAMERA_INFO_RIGHT, Kr, Dr, Rr, Pr);
        std::string camera_frame_left = "phobos_cameraLeft_optical";
        std::string camera_frame_right = "phobos_cameraRight_optical";
        std::string camera_base_frame = "phobos_base_link";

        ROS_INFO("detecting aruco...");
        //find transform from aruco to camera left
        tf::Transform camL_aruco_tf,camR_aruco_tf;
        bool aruco_found_l = findAruco(left_image->image, Kl, Dl, camL_aruco_tf);
        bool aruco_found_r = findAruco(right_image->image, Kr, Dr, camR_aruco_tf);

        cv::Mat frame_resize_l, frame_resize_r;
        cv::resize(left_image->image, frame_resize_l, cv::Size(960, 540));
        cv::resize(right_image->image, frame_resize_r, cv::Size(960, 540));
        cv::imshow("i3dr_hand_eye_l", frame_resize_l);
        cv::imshow("i3dr_hand_eye_r", frame_resize_r);
        cv::waitKey(1);

        if (aruco_found_l && aruco_found_r){
            //find transform from camera_left to camera_base
            tf::StampedTransform camera_left_to_base_tf = getTf(camera_base_frame,camera_frame_left);
            tf::StampedTransform camera_right_to_base_tf = getTf(camera_base_frame,camera_frame_right);

            static tf::TransformBroadcaster tf_br;
            tf_br.sendTransform(tf::StampedTransform(camL_aruco_tf, ros::Time::now(), camera_frame_left, "aruco_marker_left"));
            tf_br.sendTransform(tf::StampedTransform(camR_aruco_tf, ros::Time::now(), camera_frame_right, "aruco_marker_right"));

            
            tf::Transform zero_tf;
            tf::Quaternion q;
            q.setRPY(0, 0, 0);
            zero_tf.setRotation(q);

            //find transform from aruco_marker to camera_base
            //transform world->camera_base where aruco_marker is world zero
            //tf::Transform camera_base_to_aruco_tf = camL_aruco_tf.inverse() * camera_left_to_base_tf;

            tf_br.sendTransform(tf::StampedTransform(zero_tf, ros::Time::now(), camera_base_frame, "world"));
            //tf_br.sendTransform(tf::StampedTransform(cam_aruco_tf, ros::Time::now(), camera_frame, "aruco_marker"));
            //ROS_INFO("camera calibrated to world coordinates (aruco is world zero)");
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

    cv::namedWindow("i3dr_hand_eye_r");
    cv::startWindowThread();

    cv::namedWindow("i3dr_hand_eye_l");
    cv::startWindowThread();
    
    //TODO: add loading previous calibration from yaml
    //TODO: add saving calibration to yaml

    ros::ServiceServer srv_aruco_cam = nh.advertiseService("trig_aruco_camera", trig_aruco_camera);
    ros::ServiceServer srv_aruco_robot = nh.advertiseService("trig_aruco_robot", trig_aruco_robot);

    // Subscribers creation.
    message_filters::Subscriber<sensor_msgs::Image> sub_image_l(nh, camera_namespace + "/left/image_raw", 1);
    message_filters::Subscriber<sensor_msgs::Image> sub_image_r(nh, camera_namespace + "/right/image_raw", 1);
    message_filters::Subscriber<sensor_msgs::CameraInfo> sub_camera_info_l(nh, camera_namespace + "/left/camera_info", 1);
    message_filters::Subscriber<sensor_msgs::CameraInfo> sub_camera_info_r(nh, camera_namespace + "/right/camera_info", 1);

    // Message filter creation.
    message_filters::Synchronizer<policy_t> sync(policy_t(10), sub_image_l,sub_image_r, sub_camera_info_l,sub_camera_info_r);
    sync.registerCallback(boost::bind(&imageCallback, _1, _2, _3, _4));

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