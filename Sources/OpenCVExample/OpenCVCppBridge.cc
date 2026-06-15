#include "OpenCVCppBridge.h"

#include <opencv2/core.hpp>

int OpenCVCppOnePixelRows(void) {
    cv::Mat mat(1, 1, CV_8UC1);
    return mat.rows;
}

int OpenCVCppOnePixelCols(void) {
    cv::Mat mat(1, 1, CV_8UC1);
    return mat.cols;
}

int OpenCVCppOnePixelType(void) {
    cv::Mat mat(1, 1, CV_8UC1);
    return mat.type();
}
