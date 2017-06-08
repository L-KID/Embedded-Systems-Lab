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

void  MeanShift::Init_target_frame(const cv::Mat &frame, const cv::Rect &rect)
{
    target_Region = rect;
    target_model = pdf_representation(frame, target_Region);
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
            float y = static_cast<float> (j - w/2);
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
    static int k = 0;

    cv::Mat kernel(rect.height,rect.width,CV_32F,cv::Scalar(0));
    if(k == 0) {
        normalized_C = 1.0 / Epanechnikov_kernel(kernel);
	
	for(int i=0;i<rect.height;i++)
   	{
	    for(int j=0;j<rect.width;j++)
            {
		kernel.at<float>(i,j) = kernel.at<float>(i,j)*normalized_C;
	    }
	}

	k++;
    }

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
            neon_cp_value_A = vld1q_f32(&cp_values[0]);      	// bAgArAbB
            neon_cp_value_B = vld1q_f32(&cp_values[4]);      	// gBrBbCgC
            neon_cp_value_C = vld1q_f32(&cp_values[8]);		// rCbDgDrD

	    neon_b_value_A = vmulq_f32(neon_cp_value_A, neon_divbybinw);
	    neon_b_value_B = vmulq_f32(neon_cp_value_B, neon_divbybinw);
	    neon_b_value_C = vmulq_f32(neon_cp_value_C, neon_divbybinw);
	    vst1q_f32(&bin_values[0], neon_b_value_A);
	    vst1q_f32(&bin_values[4], neon_b_value_B);
	    vst1q_f32(&bin_values[8], neon_b_value_C);

	    constant_A = kernel.at<float>(i,j);			// multiplication by normalized_C is
	    constant_B = kernel.at<float>(i,j+1);		// already included at this point
	    constant_C = kernel.at<float>(i,j+2);
	    constant_D = kernel.at<float>(i,j+3);
	    constants[0] = constants[1] = constants[2] = constant_A;	// Pixel A constant
	    constants[3] = constants[4] = constants[5] = constant_B;	// Pixel B constant
	    constants[6] = constants[7] = constants[8] = constant_C;	// Pixel C constant
	    constants[9] = constants[10] = constants[11] = constant_D;	// Pixel D constant
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
