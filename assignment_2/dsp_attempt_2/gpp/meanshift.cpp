/*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/

#include "meanshift.h"

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

    kernel = new cv::Mat(rect.height,rect.width,CV_32F,cv::Scalar(0));
    //kernel.create(rect.height, rect.width, CV_32F, cv::Scalar(0));
    normalized_C = 1.0 / Epanechnikov_kernel(kernel);

    for(int i=0;i<rect.height;i++)
    {
        for(int j=0;j<rect.width;j++)
        {
            kernel->at<float>(i,j) = kernel->at<float>(i,j)*normalized_C;
        }
    }

    target_model = pdf_representation(frame,target_Region);
}

float  MeanShift::Epanechnikov_kernel(cv::Mat* kernel)
{
    int h = kernel->rows;
    int w = kernel->cols;

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
            kernel->at<float>(i,j) = result;
            kernel_sum += result;
        }
    }
    return kernel_sum;
}

float  MeanShift::Epanechnikov_kernel_old(cv::Mat &kernel)
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

static const unsigned char lookup[256] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
                                           1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ,
                                           2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 ,
                                           3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 , 3 ,                                               
                                           4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 , 4 ,
                                           5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 , 5 ,
                                           6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 , 6 ,
                                           7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 , 7 ,
                                           8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 , 8 ,
                                           9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 , 9 ,
                                           10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
                                           11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
                                           12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 
                                           13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 
                                           14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 
                                           15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
                                         };

cv::Mat MeanShift::pdf_representation(const cv::Mat &frame, const cv::Rect &rect)
{
    // Completely original code
    
    //cv::Mat kernel(rect.height,rect.width,CV_32F,cv::Scalar(0));
    //float normalized_C = 1.0 / Epanechnikov_kernel_old(kernel);

    cv::Mat pdf_model(8,16,CV_32F,cv::Scalar(1e-10));

    cv::Vec3b curr_pixel_value;
    unsigned char bin_value[3];

    int row_index = rect.y;
    int clo_index = rect.x;

    for(int i=0;i<rect.height;i++)
    {
        clo_index = rect.x;
        for(int j=0;j<rect.width;j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(row_index,clo_index);
            bin_value[0] = lookup[curr_pixel_value[0]];
            bin_value[1] = lookup[curr_pixel_value[1]];
            bin_value[2] = lookup[curr_pixel_value[2]];

            float tmp = kernel->at<float>(i,j);

            pdf_model.at<float>(0,bin_value[0]) += tmp;
            pdf_model.at<float>(1,bin_value[1]) += tmp;
            pdf_model.at<float>(2,bin_value[2]) += tmp;
            clo_index++;
        }
        row_index++;
    }

    return pdf_model;


    // Original code almost
    /*
    cv::Mat kernel(rect.height,rect.width,CV_32F,cv::Scalar(0));
    float normalized_C = 1.0 / Epanechnikov_kernel_old(kernel);

    cv::Mat pdf_model(8,16,CV_32F,cv::Scalar(1e-10));

    cv::Vec3f curr_pixel_value;
    cv::Vec3f bin_value;

    for(int i=0;i<rect.height;i++)
    {
        for(int j=0;j<rect.width;j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(i,j);
            bin_value[0] = (curr_pixel_value[0]/bin_width);
            bin_value[1] = (curr_pixel_value[1]/bin_width);
            bin_value[2] = (curr_pixel_value[2]/bin_width);
            pdf_model.at<float>(0,bin_value[0]) += kernel.at<float>(i,j)*normalized_C;
            pdf_model.at<float>(1,bin_value[1]) += kernel.at<float>(i,j)*normalized_C;
            pdf_model.at<float>(2,bin_value[2]) += kernel.at<float>(i,j)*normalized_C;
        }
    }

    return pdf_model;
    */

    // Modified original code

    /*
    unsigned char* data = frame.data;

    cv::Mat pdf_model(8,16,CV_32F,cv::Scalar(1e-10));

    int bin_value[3];

    // Iterate over all BGR values
    for(int i = 0; i < rect.width * rect.height * 3; i+=3) {
        bin_value[0] = lookup[data[i]];
        bin_value[1] = lookup[data[i+1]];
        bin_value[2] = lookup[data[i+2]];

        float tmp = kernel->data[i];

        pdf_model.at<float>(0, bin_value[0]) += tmp;
        pdf_model.at<float>(1, bin_value[1]) += tmp;
        pdf_model.at<float>(2, bin_value[2]) += tmp;
    }*/

    /*
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
            pdf_model.at<float>(0,bin_value[0]) += kernel->at<float>(i,j)*normalized_C;
            pdf_model.at<float>(1,bin_value[1]) += kernel->at<float>(i,j)*normalized_C;
            pdf_model.at<float>(2,bin_value[2]) += kernel->at<float>(i,j)*normalized_C;
            clo_index++;
        }
        row_index++;
    }*/

    return pdf_model;




/*
cv::Mat pdf_model(8,16,CV_32F,cv::Scalar(1e-10));

    
    cv::Vec3f curr_pixel_value_A, curr_pixel_value_B, curr_pixel_value_C, curr_pixel_value_D;

    int row_index = rect.y;
    int col_index = rect.x;

    float32_t divbybinw = {1.0/bin_width};
    float32_t cp_values[12], bin_values[12], constants[12], temp_model[12];
    float32_t constant_A, constant_B, constant_C, constant_D;
    float32x4_t neon_cp_value_A, neon_cp_value_B, neon_cp_value_C;
    float32x4_t neon_b_value_A, neon_b_value_B, neon_b_value_C;
    float32x4_t neon_model_A, neon_model_B, neon_model_C;
    float32x4_t neon_constant_A, neon_constant_B, neon_constant_C;;
    float32x4_t neon_divbybinw;
    neon_divbybinw = vmovq_n_f32(divbybinw);

    for(int i=0;i<rect.height;i++)
    {
        col_index = rect.x;
        for(int j=0;j<rect.width;j+=4)
        {
            curr_pixel_value_A = frame.at<cv::Vec3b>(row_index,col_index);      // bgr values pixel A
            curr_pixel_value_B = frame.at<cv::Vec3b>(row_index,col_index+1);    // bgr values pixel B
            curr_pixel_value_C = frame.at<cv::Vec3b>(row_index,col_index+2);    // bgr values pixel C
            curr_pixel_value_D = frame.at<cv::Vec3b>(row_index,col_index+3);    // bgr values pixel D
            memcpy(&cp_values[0], &curr_pixel_value_A, 12);
            memcpy(&cp_values[3], &curr_pixel_value_B, 12);
            memcpy(&cp_values[6], &curr_pixel_value_C, 12);
            memcpy(&cp_values[9], &curr_pixel_value_D, 12);
            neon_cp_value_A = vld1q_f32(&cp_values[0]);         // bAgArAbB
            neon_cp_value_B = vld1q_f32(&cp_values[4]);         // gBrBbCgC
            neon_cp_value_C = vld1q_f32(&cp_values[8]);     // rCbDgDrD

            neon_b_value_A = vmulq_f32(neon_cp_value_A, neon_divbybinw);
            neon_b_value_B = vmulq_f32(neon_cp_value_B, neon_divbybinw);
            neon_b_value_C = vmulq_f32(neon_cp_value_C, neon_divbybinw);
            vst1q_f32(&bin_values[0], neon_b_value_A);
            vst1q_f32(&bin_values[4], neon_b_value_B);
            vst1q_f32(&bin_values[8], neon_b_value_C);

            constant_A = kernel->at<float>(i,j);         // multiplication by normalized_C is
            constant_B = kernel->at<float>(i,j+1);       // already included at this point
            constant_C = kernel->at<float>(i,j+2);
            constant_D = kernel->at<float>(i,j+3);
            constants[0] = constants[1] = constants[2] = constant_A;    // Pixel A constant
            constants[3] = constants[4] = constants[5] = constant_B;    // Pixel B constant
            constants[6] = constants[7] = constants[8] = constant_C;    // Pixel C constant
            constants[9] = constants[10] = constants[11] = constant_D;  // Pixel D constant
            neon_constant_A = vmovq_n_f32(constants[0]);
            neon_constant_B = vmovq_n_f32(constants[4]);
            neon_constant_C = vmovq_n_f32(constants[8]);

            temp_model[0] = pdf_model.at<float>(0,bin_values[0]);
            temp_model[1] = pdf_model.at<float>(1,bin_values[1]);
            temp_model[2] = pdf_model.at<float>(2,bin_values[2]);
            temp_model[3] = pdf_model.at<float>(0,bin_values[3]);
            temp_model[4] = pdf_model.at<float>(1,bin_values[4]);
            temp_model[5] = pdf_model.at<float>(2,bin_values[5]);
            temp_model[6] = pdf_model.at<float>(0,bin_values[6]);
            temp_model[7] = pdf_model.at<float>(1,bin_values[7]);
            temp_model[8] = pdf_model.at<float>(2,bin_values[8]);
            temp_model[9] = pdf_model.at<float>(0,bin_values[9]);
            temp_model[10] = pdf_model.at<float>(1,bin_values[10]);
            temp_model[11] = pdf_model.at<float>(2,bin_values[11]);
            neon_model_A = vld1q_f32(&temp_model[0]);
            neon_model_B = vld1q_f32(&temp_model[4]);
            neon_model_C = vld1q_f32(&temp_model[8]);

            neon_model_A = vaddq_f32(neon_model_A, neon_constant_A);
            neon_model_B = vaddq_f32(neon_model_B, neon_constant_B);
            neon_model_C = vaddq_f32(neon_model_C, neon_constant_C);
            pdf_model.at<float>(0,bin_values[0]) = vgetq_lane_f32(neon_model_A, 0);
            pdf_model.at<float>(1,bin_values[1]) = vgetq_lane_f32(neon_model_A, 1);
            pdf_model.at<float>(2,bin_values[2]) = vgetq_lane_f32(neon_model_A, 2);
            pdf_model.at<float>(0,bin_values[3]) = vgetq_lane_f32(neon_model_A, 3);
            pdf_model.at<float>(1,bin_values[4]) = vgetq_lane_f32(neon_model_B, 0);
            pdf_model.at<float>(2,bin_values[5]) = vgetq_lane_f32(neon_model_B, 1);
            pdf_model.at<float>(0,bin_values[6]) = vgetq_lane_f32(neon_model_B, 2);
            pdf_model.at<float>(1,bin_values[7]) = vgetq_lane_f32(neon_model_B, 3);
            pdf_model.at<float>(2,bin_values[8]) = vgetq_lane_f32(neon_model_C, 0);
            pdf_model.at<float>(0,bin_values[9]) = vgetq_lane_f32(neon_model_C, 1);
            pdf_model.at<float>(1,bin_values[10]) = vgetq_lane_f32(neon_model_C, 2);
            pdf_model.at<float>(2,bin_values[11]) = vgetq_lane_f32(neon_model_C, 3);

            col_index+=4;
        }
        row_index++;
    }

    return pdf_model;
*/

    /*
    cv::Mat pdf_model(8,16,CV_32F,cv::Scalar(1e-10));

    cv::Vec3f curr_pixel_value_A, curr_pixel_value_B, curr_pixel_value_C, curr_pixel_value_D;
    cv::Vec3f bin_value_A, bin_value_B, bin_value_C, bin_value_D;

    int row_index = rect.y;
    int col_index = rect.x;

    float32_t divbybinw = {1.0/bin_width};
    float32_t cp_value[12], temp_model[12], constants[12];
    float32_t constant_A, constant_B, constant_C, constant_D;
    float32x4_t neon_cp_value_A, neon_cp_value_B, neon_cp_value_C;
    float32x4_t neon_b_value_A, neon_b_value_B, neon_b_value_C;
    float32x4_t neon_model_A, neon_model_B, neon_model_C;
    float32x4_t neon_constant_A, neon_constant_B, neon_constant_C;;
    float32x4_t neon_divbybinw;
    neon_divbybinw = vmovq_n_f32(divbybinw);

    for(int i=0;i < rect.height;i++)
    {
        col_index = rect.x;
        for(int j=0;j < rect.width;j+=4)                                       // calculate four pixels/loop i.e. pixels A through D
        {
            curr_pixel_value_A = frame.at<cv::Vec3b>(row_index,col_index);      // bgr values pixel A
            curr_pixel_value_B = frame.at<cv::Vec3b>(row_index,col_index+1);    // bgr values pixel B
            curr_pixel_value_C = frame.at<cv::Vec3b>(row_index,col_index+2);    // bgr values pixel C
            curr_pixel_value_D = frame.at<cv::Vec3b>(row_index,col_index+3);    // bgr values pixel D

            cp_value[0] = curr_pixel_value_A[0];
            cp_value[1] = curr_pixel_value_A[1];
            cp_value[2] = curr_pixel_value_A[2];
            cp_value[3] = curr_pixel_value_B[0];
            cp_value[4] = curr_pixel_value_B[1];
            cp_value[5] = curr_pixel_value_B[2];
            cp_value[6] = curr_pixel_value_C[0];
            cp_value[7] = curr_pixel_value_C[1];
            cp_value[8] = curr_pixel_value_C[2];
            cp_value[9] = curr_pixel_value_D[0];
            cp_value[10] = curr_pixel_value_D[1];
            cp_value[11] = curr_pixel_value_D[2];
            neon_cp_value_A = vld1q_f32(&cp_value[0]);      // bAgArAbB
            neon_cp_value_B = vld1q_f32(&cp_value[4]);      // gBrBbCgC
            neon_cp_value_C = vld1q_f32(&cp_value[8]);      // rCbDgDrD

            neon_b_value_A = vmulq_f32(neon_cp_value_A, neon_divbybinw);    // bin values obtained by dividing
            neon_b_value_B = vmulq_f32(neon_cp_value_B, neon_divbybinw);    // curr_pixel_values by bin_width,
            neon_b_value_C = vmulq_f32(neon_cp_value_C, neon_divbybinw);    // implemented as multiplication by 1/bin_width
            bin_value_A[0] = vgetq_lane_f32(neon_b_value_A, 0);
            bin_value_A[1] = vgetq_lane_f32(neon_b_value_A, 1);
            bin_value_A[2] = vgetq_lane_f32(neon_b_value_A, 2);
            bin_value_B[0] = vgetq_lane_f32(neon_b_value_A, 3);
            bin_value_B[1] = vgetq_lane_f32(neon_b_value_B, 0);
            bin_value_B[2] = vgetq_lane_f32(neon_b_value_B, 1);
            bin_value_C[0] = vgetq_lane_f32(neon_b_value_B, 2);
            bin_value_C[1] = vgetq_lane_f32(neon_b_value_B, 3);
            bin_value_C[2] = vgetq_lane_f32(neon_b_value_C, 0);
            bin_value_D[0] = vgetq_lane_f32(neon_b_value_C, 1);
            bin_value_D[1] = vgetq_lane_f32(neon_b_value_C, 2);
            bin_value_D[2] = vgetq_lane_f32(neon_b_value_C, 3);

            constant_A = kernel->at<float>(i,j)*normalized_C;
            constant_B = kernel->at<float>(i,j+1)*normalized_C;
            constant_C = kernel->at<float>(i,j+2)*normalized_C;
            constant_D = kernel->at<float>(i,j+3)*normalized_C;
            constants[0] = constant_A;
            constants[1] = constant_A;
            constants[2] = constant_A;
            constants[3] = constant_B;
            constants[4] = constant_B;
            constants[5] = constant_B;
            constants[6] = constant_C;
            constants[7] = constant_C;
            constants[8] = constant_C;
            constants[9] = constant_D;
            constants[10] = constant_D;
            constants[11] = constant_D;
            neon_constant_A = vmovq_n_f32(constants[0]);
            neon_constant_B = vmovq_n_f32(constants[4]);
            neon_constant_C = vmovq_n_f32(constants[8]);

            temp_model[0] = pdf_model.at<float>(0,bin_value_A[0]);
            temp_model[1] = pdf_model.at<float>(1,bin_value_A[1]);
            temp_model[2] = pdf_model.at<float>(2,bin_value_A[2]);
            temp_model[3] = pdf_model.at<float>(0,bin_value_B[0]);
            temp_model[4] = pdf_model.at<float>(1,bin_value_B[1]);
            temp_model[5] = pdf_model.at<float>(2,bin_value_B[2]);
            temp_model[6] = pdf_model.at<float>(0,bin_value_C[0]);
            temp_model[7] = pdf_model.at<float>(1,bin_value_C[1]);
            temp_model[8] = pdf_model.at<float>(2,bin_value_C[2]);
            temp_model[9] = pdf_model.at<float>(0,bin_value_D[0]);
            temp_model[10] = pdf_model.at<float>(1,bin_value_D[1]);
            temp_model[11] = pdf_model.at<float>(2,bin_value_D[2]);
            neon_model_A = vld1q_f32(&temp_model[0]);
            neon_model_B = vld1q_f32(&temp_model[4]);
            neon_model_C = vld1q_f32(&temp_model[8]);

            neon_model_A = vaddq_f32(neon_model_A, neon_constant_A);
            neon_model_B = vaddq_f32(neon_model_B, neon_constant_B);
            neon_model_C = vaddq_f32(neon_model_C, neon_constant_C);
            pdf_model.at<float>(0,bin_value_A[0]) = vgetq_lane_f32(neon_model_A, 0);
            pdf_model.at<float>(1,bin_value_A[1]) = vgetq_lane_f32(neon_model_A, 1);
            pdf_model.at<float>(2,bin_value_A[2]) = vgetq_lane_f32(neon_model_A, 2);
            pdf_model.at<float>(0,bin_value_B[0]) = vgetq_lane_f32(neon_model_A, 3);
            pdf_model.at<float>(1,bin_value_B[1]) = vgetq_lane_f32(neon_model_B, 0);
            pdf_model.at<float>(2,bin_value_B[2]) = vgetq_lane_f32(neon_model_B, 1);
            pdf_model.at<float>(0,bin_value_C[0]) = vgetq_lane_f32(neon_model_B, 2);
            pdf_model.at<float>(1,bin_value_C[1]) = vgetq_lane_f32(neon_model_B, 3);
            pdf_model.at<float>(2,bin_value_C[2]) = vgetq_lane_f32(neon_model_C, 0);
            pdf_model.at<float>(0,bin_value_D[0]) = vgetq_lane_f32(neon_model_C, 1);
            pdf_model.at<float>(1,bin_value_D[1]) = vgetq_lane_f32(neon_model_C, 2);
            pdf_model.at<float>(2,bin_value_D[2]) = vgetq_lane_f32(neon_model_C, 3);

            col_index+=4;
        }
        row_index++;
    }

    return pdf_model;*/
    

    /*
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
            pdf_model.at<float>(0,bin_value[0]) += kernel->at<float>(i,j)*normalized_C;
            pdf_model.at<float>(1,bin_value[1]) += kernel->at<float>(i,j)*normalized_C;
            pdf_model.at<float>(2,bin_value[2]) += kernel->at<float>(i,j)*normalized_C;
            clo_index++;
        }
        row_index++;
    }

    return pdf_model;
    */
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
                float temp = static_cast<float>((sqrt(target_model.at<float>(k, bin_value)/target_candidate.at<float>(k, bin_value))));
                weight.at<float>(i,j) *= temp;
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
            float norm_i = static_cast<float>(i-centre)/centre;
            for(int j=0;j<weight.cols;j++)
            {
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
