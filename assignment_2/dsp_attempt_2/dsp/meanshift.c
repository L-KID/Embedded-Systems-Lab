/*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/

#include <stdlib.h>
#include <math.h>
#include "meanshift.h"

//float bin_width;
//struct config cfg;

float bin_width;
struct config {
    int num_bins;
    int pixel_range;
    int MaxIter;
} cfg;

void MeanShift_Init() {
    cfg.MaxIter = 8;
    cfg.num_bins = 16;
    cfg.pixel_range = 256;
    bin_width = (float)cfg.pixel_range / (float)cfg.num_bins;
}

/*
void  MeanShift::Init_target_frame(const cv::Mat &frame,const cv::Rect &rect)
{
    target_Region = rect;
    target_model = pdf_representation(frame,target_Region);
}

float  MeanShift::Epanechnikov_kernel(cv::Mat &kernel)
{
    int h = kernel.rows;
    int w = kernel.cols;

    float epanechnikov_cd = 0.1*PI*h*w;
    float kernel_sum = 0.0;
    for(int i=0;i<h;i++)
    {
        for(int j=0;j<w;j++)
        {
            float x = static_cast<float>(i - h/2);
            float  y = static_cast<float> (j - w/2);
            float norm_x = x*x/(h*h/4)+y*y/(w*w/4);
            float result =norm_x<1?(epanechnikov_cd*(1.0-norm_x)):0;
            kernel.at<float>(i,j) = result;
            kernel_sum += result;
        }
    }
    return kernel_sum;
}
cv::Mat MeanShift::pdf_representation(const cv::Mat &frame, const cv::Rect &rect)
{
    cv::Mat kernel(rect.height,rect.width,CV_32F,cv::Scalar(0));
    float normalized_C = 1.0 / Epanechnikov_kernel(kernel);

    cv::Mat pdf_model(8,16,CV_32F,cv::Scalar(1e-10));

    cv::Vec3f curr_pixel_value;
    cv::Vec3f bin_value;

    int row_index = rect.y;
    int clo_index = rect.x;

    for(int i=0;i<rect.height;i++)
    {
        clo_index = rect.x;
        for(int j=0;j<rect.width;j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(row_index,clo_index);
            bin_value[0] = (curr_pixel_value[0]/bin_width);
            bin_value[1] = (curr_pixel_value[1]/bin_width);
            bin_value[2] = (curr_pixel_value[2]/bin_width);
            pdf_model.at<float>(0,bin_value[0]) += kernel.at<float>(i,j)*normalized_C;
            pdf_model.at<float>(1,bin_value[1]) += kernel.at<float>(i,j)*normalized_C;
            pdf_model.at<float>(2,bin_value[2]) += kernel.at<float>(i,j)*normalized_C;
            clo_index++;
        }
        row_index++;
    }

    return pdf_model;

}*/

/*cv::Mat MeanShift::CalWeight(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec)

*/
struct Matrix CalWeight(unsigned char** bgr_planes, unsigned char *target_model,
                            struct Matrix target_candidate, struct Rect rec)
{
    int k, i, j;
    struct Matrix weight;
    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    //cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));
    float *data = (float*)malloc(rows*cols*sizeof(float));
    // Remember to FREE this one once it is no longer needed in main 
    
    for(k = 0; k < 3;  k++)
    {
        row_index = rec.y;
        for(i = 0; i < rows; i++)
        {
            col_index = rec.x;
            for(j = 0; j < cols; j++)
            {
                int curr_pixel = (bgr_planes[k][row_index*rows + col_index]);
                int bin_value = curr_pixel/bin_width;
                data[i*rows + j] *= (float)((sqrt(target_model[k*rows + bin_value]/target_candidate.data[k*rows + bin_value])));
                col_index++;
            }
            row_index++;
        }
    }

    weight.rows = rows;
    weight.cols = cols;
    weight.data = data;

    return weight;
}


//cv::Rect MeanShift::track(const cv::Mat &next_frame)
struct Rect MeanShift_Track(unsigned char* bgr_planes[3], unsigned char* target_model, struct Rect target_region)
{
    
    struct Rect next_rect;
    int iter, i, j;

    for ( iter = 0; iter < cfg.MaxIter; iter++ )
    {
        //target_candidate = pdf_representation(next_frame,target_Region);
        
        //TO DO: calculate target_candidate
        struct Matrix target_candidate;
        struct Matrix weight = CalWeight(bgr_planes, target_model, target_candidate, target_region);

        float delta_x = 0.0;
        float sum_wij = 0.0;
        float delta_y = 0.0;
        float centre = (float)((weight.rows - 1)/2.0);
        double mult = 0.0;

        next_rect.x = target_region.x;
        next_rect.y = target_region.y;
        next_rect.width = target_region.width;
        next_rect.height = target_region.height;

        for(i = 0; i < weight.rows; i++)
        {
            for(j = 0; j < weight.cols; j++)
            {
                float norm_i = (float)(i - centre)/centre;
                float norm_j = (float)(j - centre)/centre;
                mult = pow(norm_i,2) + pow(norm_j,2) > 1.0 ? 0.0 : 1.0;
                delta_x += (float)(norm_j * weight.data[i*weight.rows + j] * mult);
                delta_y += (float)(norm_i * weight.data[i*weight.rows + j] * mult);
                sum_wij += (float)(weight.data[i*weight.rows + j] * mult);
            }
        }

        free(weight.data);

        next_rect.x += (int)((delta_x/sum_wij)*centre);
        next_rect.y += (int)((delta_y/sum_wij)*centre);

        if(abs(next_rect.x-target_region.x)<1 && abs(next_rect.y-target_region.y)<1)
        {
            break;
        }
        else
        {
            target_region.x = next_rect.x;
            target_region.y = next_rect.y;
        }
    }

    return next_rect;
}
