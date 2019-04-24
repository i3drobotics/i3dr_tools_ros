#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/Image.h>
#include <stereo_msgs/DisparityImage.h>

#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>

#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>

#include <message_filters/subscriber.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/synchronizer.h>

ros::Publisher point_cloud_pub, point_cloud_normal_pub;
typedef pcl::PointCloud<pcl::PointXYZRGBNormal> PointCloudRGBNormal;
typedef pcl::PointCloud<pcl::PointXYZRGB> PointCloudRGB;

typedef message_filters::sync_policies::ApproximateTime<
    stereo_msgs::DisparityImage, sensor_msgs::Image>
    policy_t;

//Convert disparity image from opencv Mat to PCL Point Cloud XYZRGB
PointCloudRGB::Ptr Mat2PCL(cv::Mat image, cv::Mat coords, PointCloudRGBNormal::Ptr normal){

    PointCloudRGB::Ptr ptCloudTemp(new PointCloudRGB);
    PointCloudRGBNormal::Ptr ptCloudNormal(new PointCloudRGBNormal);

    pcl::PointXYZRGB point;
    pcl::PointXYZRGBNormal pNormal;
    uint32_t rgb = 0;
    uchar col = 0;

    point.x = 0;
    point.y = 0;
    point.z = 0;

    pNormal.x = 0;
    pNormal.y = 0;
    pNormal.z = 0;

    pNormal.normal_x = 0;
    pNormal.normal_y = 0;
    pNormal.normal_z = 0;

    rgb = ((int)255) << 16 | ((int)255) << 8 | ((int)255);
    point.rgb = *reinterpret_cast<float *>(&rgb);

    pNormal.rgb = point.rgb;

    ptCloudTemp->points.push_back(point);
    ptCloudNormal->points.push_back(pNormal);

    for (int i = 1; i < coords.rows-1; i++) {
        float *reconst_ptr = coords.ptr<float>(i);
        uchar *rgb_ptr = image.ptr<uchar>(i);

        if(!rgb_ptr || !reconst_ptr) return(ptCloudTemp);

        for (int j = 1; j < coords.cols-1; j++) {
            if (rgb_ptr[j] == 0) continue;

            point.x = reconst_ptr[3 * j];
            point.y = reconst_ptr[3 * j + 1];
            point.z = reconst_ptr[3 * j + 2];

            if(abs(point.x) > 10) continue;
            if(abs(point.y) > 10) continue;
            if(abs(point.z) > 10) continue;
            col = rgb_ptr[j];

            rgb = ((int)col) << 16 | ((int)col) << 8 | ((int)col);
            point.rgb = *reinterpret_cast<float *>(&rgb);

            //normal
            float dzdx = (coords.at<float>(i+1, j) - coords.at<float>(i-1, j)) / 2.0;
            float dzdy = (coords.at<float>(i, j+1) - coords.at<float>(i, j-1)) / 2.0;

            cv::Vec3f d(-dzdx, -dzdy, 1.0f);

            cv::Vec3f n = normalize(d);

            pNormal.x = point.x;
            pNormal.y = point.y;
            pNormal.z = point.z;

            pNormal.rgb = point.rgb;

            pNormal.normal_x = n[0];
            pNormal.normal_y = n[1];
            pNormal.normal_z = n[2];

            ptCloudNormal->points.push_back(pNormal);

            ptCloudTemp->points.push_back(point);
        }
    }
    pcl::copyPointCloud(*ptCloudNormal,*normal);
    return(ptCloudTemp);
}

//Get ROS disparity msg from stereo camera and send to processing
void disparityCallback(const stereo_msgs::DisparityImageConstPtr& msg_disp, const sensor_msgs::ImageConstPtr &msg_img)
{
  cv_bridge::CvImagePtr input_disparity, input_image;
  input_image = cv_bridge::toCvCopy(msg_img);
  input_disparity = cv_bridge::toCvCopy(msg_disp->image);

  PointCloudRGBNormal::Ptr point_cloud_normal (new PointCloudRGBNormal);
  PointCloudRGB::Ptr point_cloud (new PointCloudRGB);
  point_cloud = Mat2PCL(input_image->image,input_disparity->image,point_cloud_normal);

  point_cloud->header.frame_id = msg_disp->header.frame_id;
  point_cloud_normal->header.frame_id = msg_disp->header.frame_id;
  pcl_conversions::toPCL(ros::Time::now(), point_cloud->header.stamp);
  pcl_conversions::toPCL(ros::Time::now(), point_cloud_normal->header.stamp);
  point_cloud_pub.publish(point_cloud);
  point_cloud_normal_pub.publish(point_cloud_normal);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "generate_point_cloud");
  ros::NodeHandle nh;
  ros::NodeHandle pnode("~");

  std::string ns = ros::this_node::getNamespace();

  // Subscribers creation
  message_filters::Subscriber<stereo_msgs::DisparityImage> disparity_sub(nh, ns+"/i3dr_disparity", 1);
  message_filters::Subscriber<sensor_msgs::Image> image_sub(nh, ns+"/left/image_rect", 1);

  // Message filter creation.
  message_filters::Synchronizer<policy_t> sync(policy_t(10), disparity_sub, image_sub);
  sync.registerCallback(boost::bind(&disparityCallback, _1, _2));

  point_cloud_pub = nh.advertise<PointCloudRGB>(ns+"/i3dr_points2", 1);
  point_cloud_normal_pub = nh.advertise<PointCloudRGBNormal>(ns+"/i3dr_points2_normal", 1);

  ros::spin();
}