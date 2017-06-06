/*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <arm_neon.h>
#include <string.h>


#include"meanshift.h"

MeanShift::MeanShift()
{
    cfg.MaxIter = 8;
    cfg.num_bins = 16;
    cfg.piexl_range = 256;
    bin_width = cfg.piexl_range / cfg.num_bins;
}

void  MeanShift::Init_target_frame(const cv::Mat &frame,const cv::Rect &rect)
{
    target_Region = rect;
    target_model = pdf_representation(frame,target_Region);
}

float  MeanShift::Epanechnikov_kernel(cv::Mat &kernel)  //Argument is of the cv::Mat type, which is defined in the OpenCV library and can therefore not be changed
{
    int h = kernel.rows;                                //Extract the height (= number of rows of pixels) from the kernel
    int w = kernel.cols;                                //Extract the width (= number of columns of pixels) from the kernel


    //int eff_w = (w%4) ? w+4-w%4 : w;                    //Make sure that the with used in the calculations is a multiple of 4 (for NEON 4-way SIMD calculations)
    //int eff_w = w;                 
    int index = 0;                                      //Index will be used to keep track of the progress within a row

    float32_t epanechnikov_cd = 0.1*PI*h*w;             //Constant value throughout the entire Epanechnikov kernel
    float kernel_sum = 0.0;                             //Will be used to accumulate the return value of the kernel

    float32_t x[h];                                     //Generate an x-value for each row of pixels
    for(int i=0;i<h;i++)
    {
        x[i] = static_cast<float32_t>(i - h/4);
    }
    float32_t y[w];    
    //float32_t y[w] = {1000000.0};                   //Generate a y-value for each (imaginary) column of pixels
    for(int j=0;j<w;j++)
    {
        y[j] = static_cast<float32_t>(j - w/4);
    }

    float32x4_t neon_h, neon_w;
    
    float32_t h_const, w_const;

    h_const = static_cast<float32_t>(1/(h*h/4));        //Pre-calculate the constant value (throughout the entire kernel)  related to h used in the x_norm calculation
    neon_h = vmovq_n_f32(h_const);                          //and store the result for usage in neon calculations
    w_const = static_cast<float32_t>(1/(w*w/4));        //Pre-calculate the constant value (throughout the entire kernel)  related to w used in the x_norm calculation
    neon_w = vmovq_n_f32(w_const);                          //and store the result for usage in neon calculations

    float32x4_t neon_compare, neon_epacd;
   
    neon_compare = vmovq_n_f32(1.0);                    //Prepare the value 1 for neon to compare against the neon_norm values
    neon_epacd = vmovq_n_f32(epanechnikov_cd);          //Prepare the epanechnikov_cd constant for usage in NEON calculations

    
    float32x4_t neon_x, neon_y, neon_norm, neon_result;
    uint32x4_t neon_mask, neon_norm_uint;
  

    for(int i=0;i<h;i++)
    {
        neon_x = vmovq_n_f32(x[i]);
        neon_x = vmulq_f32(neon_x, neon_x);                                 //x = x*x
        for(int j=0;j<(w/4);j++)
        {
            neon_y = vld1q_f32(&y[index]);
            neon_y = vmulq_f32(neon_y, neon_y);                             //y = y*y

            neon_norm = vmulq_f32(neon_x, neon_h);                          //norm = x*x/(h*h/4)
            neon_norm = vmlaq_f32(neon_norm, neon_y, neon_w);               //norm = x*x/(h*h/4) + y*y/(w*w/4)

            neon_mask = vcltq_f32(neon_norm, neon_compare);                 //mask = norm < compare
            neon_norm = vsubq_f32(neon_compare, neon_norm);                 //1 - norm
            neon_norm = vmulq_f32(neon_norm, neon_epacd);                   //(1 - norm)*epanechnikov_cd

            neon_norm_uint = vreinterpretq_u32_f32(neon_norm);              //If reinterpretation does not work, vcvtq_n_u32_f32 can be tried
            neon_norm_uint = vandq_u32(neon_norm_uint, neon_mask);
            neon_result = vreinterpretq_f32_u32(neon_norm_uint);            //result = norm < compare ? epanechnikov_cd*(1-norm) : 0

            //kernel_sum += <float>vaddvq_f32(neon_result);                   //Alternative would be to work with pairwise additions
            kernel_sum += vaddv_f32(neon_result);                   //Alternative would be to work with pairwise additions
            float32_t result[4];
            vst1q_f32(&result, neon_result);                                //Save each of the four generated results in their respective locations
            kernel.at<float>(i,j) = result[0];
            kernel.at<float>(i,j+1) = result[1];
            kernel.at<float>(i,j+2) = result[2];
            kernel.at<float>(i,j+3) = result[3];

            index += 4;                                                     //Progress to the next 4 elements in the current row
        }
    }
    return kernel_sum;
}

cv::Mat MeanShift::CalWeight(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec)
{
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));
    std::vector<cv::Mat> bgr_planes;
    cv::split(frame, bgr_planes);

    for(int k = 0; k < 3;  k++)
    {
        row_index = rec.y;
        for(int i=0;i<rows;i++)
        {
            col_index = rec.x;
            for(int j=0;j<cols;j++)
            {
                int curr_pixel = (bgr_planes[k].at<uchar>(row_index,col_index));
                int bin_value = curr_pixel/bin_width;
                weight.at<float>(i,j) *= static_cast<float>((sqrt(target_model.at<float>(k, bin_value)/target_candidate.at<float>(k, bin_value))));
                col_index++;
            }
            row_index++;
        }
    }

    return weight;
}

cv::Rect MeanShift::track(const cv::Mat &next_frame)
{
    cv::Rect next_rect;
    for(int iter=0;iter<cfg.MaxIter;iter++)
    {
        cv::Mat target_candidate = pdf_representation(next_frame,target_Region);
        cv::Mat weight = CalWeight(next_frame,target_model,target_candidate,target_Region);

        float delta_x = 0.0;
        float sum_wij = 0.0;
        float delta_y = 0.0;
        float centre = static_cast<float>((weight.rows-1)/2.0);
        double mult = 0.0;

        next_rect.x = target_Region.x;
        next_rect.y = target_Region.y;
        next_rect.width = target_Region.width;
        next_rect.height = target_Region.height;

        for(int i=0;i<weight.rows;i++)
        {
            for(int j=0;j<weight.cols;j++)
            {
                float norm_i = static_cast<float>(i-centre)/centre;
                float norm_j = static_cast<float>(j-centre)/centre;
                mult = pow(norm_i,2)+pow(norm_j,2)>1.0?0.0:1.0;
                delta_x += static_cast<float>(norm_j*weight.at<float>(i,j)*mult);
                delta_y += static_cast<float>(norm_i*weight.at<float>(i,j)*mult);
                sum_wij += static_cast<float>(weight.at<float>(i,j)*mult);
            }
        }

        next_rect.x += static_cast<int>((delta_x/sum_wij)*centre);
        next_rect.y += static_cast<int>((delta_y/sum_wij)*centre);

        if(abs(next_rect.x-target_Region.x)<1 && abs(next_rect.y-target_Region.y)<1)
        {
            break;
        }
        else
        {
            target_Region.x = next_rect.x;
            target_Region.y = next_rect.y;
        }
    }

    return next_rect;
}
