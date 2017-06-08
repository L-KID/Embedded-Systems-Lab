#ifndef MEANSHIFT_H
#define MEANSHIFT_H
#include <iostream>
#include <math.h>
#include "opencv2/core/core.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <stdint.h>
#include "arm_neon.h"

#define PI 3.1415926
class MeanShift
{
 private:
    float bin_width;
    float normalized_C;
    cv::Mat* kernel;

public:
    struct config{
            int num_bins;
            int piexl_range;
            int MaxIter;
        }cfg;
    
    cv::Mat target_model;
    cv::Rect target_Region;

    MeanShift();
    void Init_target_frame(const cv::Mat &frame,const cv::Rect &rect);
    float Epanechnikov_kernel(cv::Mat* kernel);
    float Epanechnikov_kernel_old(cv::Mat &kernel);
    cv::Mat pdf_representation(const cv::Mat &frame,const cv::Rect &rect);
    cv::Mat CalWeight(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec);
    cv::Mat CalWeight_opt(const cv::Mat &frame, cv::Mat &target_model, cv::Mat &target_candidate, cv::Rect &rec);
    cv::Rect track(const cv::Mat &next_frame);
};

#endif // MEANSHIFT_H
