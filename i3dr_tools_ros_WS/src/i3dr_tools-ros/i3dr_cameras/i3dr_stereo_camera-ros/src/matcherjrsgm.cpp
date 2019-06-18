#include "matcherjrsgm.h"

void MatcherJrSGM::init(){
    // Load default config
    readConfig(config_path);

    //enableInterpolation(false);
    //enableOcclusionDetection(false);
    //setWindowSize(9);

    //min_disparity = 0;
    //disparity_range = 65;

    //setDisparityRange(21);
    //setMatchCosts(0.5, 1.5);

    //matcher_handle = JR::Phobos::CreateMatchStereoHandle(params);

}

void MatcherJrSGM::initParameters(int nPyramids, JR::Phobos::SSGMParameters sgm_params){

}

void MatcherJrSGM::readConfig(std::string &sConfigFile){
    /* Load a configuration file for the matcher */

    //QSettings* settings = new QSettings(sConfigFile, QSettings::IniFormat);

    //settings->beginGroup("Input");
    params.oGPUs = std::vector<int>(1, 0);
    params.bHasNodata = false;
    params.fNodataValue = -99999.000000;
    //settings->endGroup();

    //settings->beginGroup("Output");
    params.bWriteBackDisp = false;
    params.bWriteRevBackMatchDistance = false;
    params.bWriteBackMatchDistance = false;
    //settings->endGroup();

    //settings->beginGroup("Parameter");
    params.nNumberOfPyramids = 5;
    params.strDispPredictionFile = "";
    params.strBackDispPredictionFile = "";
    params.fTopPredictionShift = 0;
    params.nNumberOfMorphologicalIter = 0;
    params.nDebugLevel = 0;
    params.strDebugOutput = "./";
    //settings->endGroup();

    params.oPyramidParams.resize(static_cast<size_t>(params.nNumberOfPyramids));

    for(int i=0; i < params.nNumberOfPyramids; i++){
        //auto group = QString("Pyramid %1").arg(QString::number(i));
        //params.oPyramidParams.at(i) = parsePyramid(settings, group);
        params.oPyramidParams.at(i) = parsePyramid();
    }

    //auto group = QString("Pyramid %1").arg(QString::number(params.nNumberOfPyramids));
    //params.oFinalSubPixelParameters = parsePyramid(settings, group);
    params.oFinalSubPixelParameters = parsePyramid();

}

JR::Phobos::SMatchingParameters MatcherJrSGM::parsePyramid(void){
    /* Load in matching parameters for a particular pyramid */
    //settings->beginGroup(group);

    JR::Phobos::SMatchingParameters pyramid;

    pyramid.bCompute = true;
    pyramid.nMetric = 0; // Census cost
    pyramid.nMaximumNumberOfDisparities = 31;
    pyramid.fDisparityStepSize = 0.5;
    pyramid.nSubpixelFnc = 2;
    pyramid.fMaxCost = 6;
    pyramid.bDoSubpixelNormalization = true;
    pyramid.bBackMatch = false;
    pyramid.bComputeBackDisparity = false;

    pyramid.fMaxBackMatchingDist = 1.5;
    pyramid.bKeepValueOnNodataInBackmatch = false;
    pyramid.bKeepValueOnOutsideImage = false;
    pyramid.bMultiGPU_AfterDSI = false;

    pyramid.nRegionGrowingMode = 1;
    pyramid.nRegionGrowingIterations = 1;

    // manually added from GUI
    pyramid.bMedian = true;  // use median optimizer
    pyramid.iMedX = 3;
    pyramid.iMedY = 3;
    pyramid.iNodataPol = 1;      //"Disparity Median Optimizer Nodata Policy"
    pyramid.iBorderPol = 2;      //"Disparity Median Optimizer Border Policy"
    pyramid.fMedianThresh = -1;
    pyramid.bSplittedMedian = false;  //"Disparity Median Optimizer Splitted Version"

    pyramid.bSpeckle = true;      // use speckle optimizer
    pyramid.iSpeckleMaxSize = 200;  //"Disparity Speckle Filter Max Region Size"
    pyramid.fSpeckleMaxDiff = 0.5;  //"Disparity Speckle Filter Max Difference"

    pyramid.bInterpol = true;    // "Interpolate Disparity"
    pyramid.nDir = 32;            // "Interpolator Number Of Directions"
    pyramid.nNth = 32;            // "Interpolator Number Nth Elements"
    pyramid.nMinNth = 0;         // "Interpolator Minimum Number Of Elements"
    pyramid.fRadius = -1;         // "Interpolator Match Radius"
    pyramid.nMode = 2;        // "Interpolator Mode" (Gauss);

    pyramid.bOcclusionDetection = true;
    pyramid.fOcclusionDispGapSize = 1.1;
    pyramid.bOccInterpol = true;  // "Interpolate Occlusions"
    pyramid.nOccDir = 32;  // "Occlusion Interpolator Number Of Directions"
    pyramid.nOccNth = 32;  // "Occlusion Interpolator Number Nth Elements"
    pyramid.nOccMinNth = 0;
    pyramid.fOccRadius = -1;  // "Occlusion Interpolator Match Radius"
    pyramid.nOccMode = 2;     // "Occlusion Interpolator Mode" (Percentile 10)

    pyramid.nRegionGrowingMode = 1;      //0 no, 1 iterations, 2//full
    pyramid.nRegionGrowingIterations = 5;

    pyramid.oMetricParams.nWindowSizeX = 9;
    pyramid.oMetricParams.nWindowSizeY = 9;
    pyramid.oMetricParams.fMetricDeltaX = 1;
    pyramid.oMetricParams.fMetricDeltaY = 1;
    pyramid.oMetricParams.nCensusCenterFunction = 1; // Census Center Function
    pyramid.oMetricParams.nNumberOfScales = 0;
    pyramid.oMetricParams.fScaleStepSize = 0.250000;
    pyramid.oMetricParams.nNumberOfSlants = 0;
    pyramid.oMetricParams.fSlantStepSize = 0.250000;
    pyramid.oMetricParams.bUseProximityWeight = 0;
    pyramid.oMetricParams.fProximityGamma = 2;
    pyramid.oMetricParams.bUseSimilarityWeight = 0;
    pyramid.oMetricParams.fSimilarityGamma = 2;

    JR::Phobos::SSGMParameters oSGMParams;

    oSGMParams.nAllowedOutsideImageMatchCount = 2147483647;
    oSGMParams.bDSICountCorrection = true;
    oSGMParams.nDSICountCorrectionNoDataCheckMode = 1;

    // Up/Down
    oSGMParams.bMatch_S_N = true;
    oSGMParams.fP1_S_N = 0.100000f;
    oSGMParams.fP2_S_N = 0.800000f;
    oSGMParams.bP2EqualP1_S_N = 0;
    oSGMParams.nAdaptiveP1Fnc_S_N = 0;
    oSGMParams.nAdaptiveP2Fnc_S_N = 0;
    oSGMParams.bAdditive_S_N = true;

    // Left/Right
    oSGMParams.bMatch_E_W = true;
    oSGMParams.fP1_E_W = 0.1;
    oSGMParams.fP2_E_W = 0.8;
    oSGMParams.bP2EqualP1_E_W = 0;
    oSGMParams.nAdaptiveP1Fnc_E_W = 0; // None
    oSGMParams.nAdaptiveP2Fnc_E_W = 0; // Inverse gradient
    oSGMParams.bAdditive_E_W = true;

    // Diagonal
    oSGMParams.bMatch_SW_NE = true;
    oSGMParams.fP1_SW_NE = 0.1;
    oSGMParams.fP2_SW_NE = 0.8;
    oSGMParams.bP2EqualP1_SW_NE = 0;
    oSGMParams.nAdaptiveP1Fnc_SW_NE = 0;
    oSGMParams.nAdaptiveP2Fnc_SW_NE = 0;
    oSGMParams.bAdditive_SW_NE = true;

    // Diagonal
    oSGMParams.bMatch_SE_NW = true;
    oSGMParams.fP1_SE_NW = 0.1;
    oSGMParams.fP2_SE_NW = 0.8;
    oSGMParams.bP2EqualP1_SE_NW = 0;
    oSGMParams.nAdaptiveP1Fnc_SE_NW = 0;
    oSGMParams.nAdaptiveP2Fnc_SE_NW = 0;
    oSGMParams.bAdditive_SE_NW = true;

    oSGMParams.bUseDSITexture = false;
    oSGMParams.bUseAggregatedCostTexture = true;

    pyramid.oSGMParams = oSGMParams;
    //settings->endGroup();

    return pyramid;
}


void MatcherJrSGM::setMatchCosts(float p1,float p2){

}
void MatcherJrSGM::setOcclusion(bool enable){

}
void MatcherJrSGM::setInterpolation(bool enable){

}
void MatcherJrSGM::setSubPixel(bool enable){

}
void MatcherJrSGM::setDisparityRange(int min_disparity){

}
void MatcherJrSGM::setCensusWindow(int disparity_range){

}
void MatcherJrSGM::compute(cv::Mat left,cv::Mat right,cv::Mat disp){

}