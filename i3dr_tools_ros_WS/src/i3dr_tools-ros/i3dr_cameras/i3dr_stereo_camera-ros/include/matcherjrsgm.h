#ifndef MATCHERJRSGM_H
#define MATCHERJRSGM_H

#include <PhobosIntegration/PhobosIntegration.hpp>
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

class MatcherJrSGM {
    public:
        MatcherJrSGM(void) {
                            init();
        }

        ~MatcherJrSGM(void){
            if(matcher_handle != nullptr){
                JR::Phobos::DestroyMatchStereoHandle(matcher_handle);
            }
        }

        void setMatchCosts(float p1,float p2);
        void setOcclusion(bool enable);
        void setInterpolation(bool enable);
        void setSubPixel(bool enable);
        void setDisparityRange(int min_disparity);
        void setCensusWindow(int disparity_range);
        void compute(cv::Mat left,cv::Mat right,cv::Mat disp);

    private:
        JR::Phobos::TSTEREOHANDLE matcher_handle = nullptr;
        JR::Phobos::SMatchingParametersInput params;
        //QString config_path = "jr_sgm_config.cfg";
        std::string config_path = "jr_sgm_config.cfg";

        void readConfig(std::string &sConfigFile);

        void init(void);
        void initParameters(int nPyramids, JR::Phobos::SSGMParameters sgm_params);
        //JR::Phobos::SMatchingParameters parsePyramid(QSettings *settings, QString group);
        //JR::Phobos::SMatchingParameters parsePyramid(std::vector<std::string> *settings, std::string group);
        JR::Phobos::SMatchingParameters parsePyramid(void);
        JR::Phobos::SSGMParameters initSGMParameters();
};

#endif // MATCHERJRSGM_H
