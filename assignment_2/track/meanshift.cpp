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
    cv::Mat kernel(rect.height,rect.width,CV_32F,cv::Scalar(0));
    float32_t normalized_C = 1.0 / Epanechnikov_kernel(kernel);

    cv::Mat pdf_model(8,16,CV_32F,cv::Scalar(1e-10));

    cv::Vec3f curr_pixel_value;
    cv::Vec3f bin_value;

    int row_index = rect.y;
    int col_index = rect.x;

    float32_t cp_value[4] = {0};
    float32_t temp_model[4] = {0};
    float32_t divbybinw = {1.0/bin_width};
    float32x4_t neon_cp_value, neon_b_value, neon_divbybinw, neon_constant, neon_model;
    neon_divbybinw = vmovq_n_f32(divbybinw);

    for(int i=0;i<rect.height;i++)
    {
        col_index = rect.x;
        for(int j=0;j<rect.width;j++)
        {
            curr_pixel_value = frame.at<cv::Vec3b>(row_index,col_index);
	    cp_value[0] = curr_pixel_value[0];
	    cp_value[1] = curr_pixel_value[1];
	    cp_value[2] = curr_pixel_value[2];
	    neon_cp_value = vld1q_f32(&cp_value[0]);

	    neon_b_value = vmulq_f32(neon_cp_value, neon_divbybinw);
            bin_value[0] = vgetq_lane_f32(neon_b_value, 0);
            bin_value[1] = vgetq_lane_f32(neon_b_value, 1);
            bin_value[2] = vgetq_lane_f32(neon_b_value, 2);

	    float32_t constant = kernel.at<float>(i,j)*normalized_C;
	    neon_constant = vmovq_n_f32(constant);
	    temp_model[0] = pdf_model.at<float>(0,bin_value[0]);
	    temp_model[1] = pdf_model.at<float>(1,bin_value[1]);
	    temp_model[2] = pdf_model.at<float>(2,bin_value[2]);
	    neon_model = vld1q_f32(&temp_model[0]);

	    neon_model = vaddq_f32(neon_model, neon_constant);
            pdf_model.at<float>(0,bin_value[0]) = vgetq_lane_f32(neon_model, 0);
            pdf_model.at<float>(1,bin_value[1]) = vgetq_lane_f32(neon_model, 1);
            pdf_model.at<float>(2,bin_value[2]) = vgetq_lane_f32(neon_model, 2);

            col_index++;
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

        float32x4_t neon_ni,neon_nj,neon_power1,neon_power2,neon_a,neon_b,neon_comp1;
        float32x4_t neon_mult, neon_weight_ij, neon_temp_dx,neon_temp_dy,neon_temp2_dx,neon_temp2_dy, neon_dx, neon_dy, neon_temp_sum, neon_sum;
        neon_sum = vdupq_n_f32(0);
        neon_dx = vdupq_n_f32(0);
        neon_dy = vdupq_n_f32(0);

        next_rect.x = target_Region.x;
        next_rect.y = target_Region.y;
        next_rect.width = target_Region.width;
        next_rect.height = target_Region.height;

        for (int i = 0; i < weight.rows; i++)
        {
            for (int j = 0; j < weight.cols/4; j++)
            {
                float32_t norm_i = static_cast<float>(i-centre)/centre;
                neon_ni = vmovq_n_f32(norm_i);  //Load all lanes of vector to the same literal value. vmovq_n_f32(float32_t value);

                float32_t norm_j[4] = {0};
                for (int k = 0; k < 4; k++)
                {
                    norm_j[k] = static_cast<float>(j-centre+k)/centre;
                }

                neon_nj = vld1q_f32(&norm_j[0]);

                float32_t a = 0.0;
                float32_t b = 1.0; // 4 bits
                neon_a = vmovq_n_f32 (a);
                neon_b = vmovq_n_f32 (b);

                neon_power1 = vmulq_f32 (neon_nj, neon_nj);
                neon_power2 = vmulq_f32 (neon_ni, neon_ni);
                neon_comp1 = vaddq_f32 (neon_power1, neon_power2);

                float32_t comp1[4] = {0};
                for (int q = 0; q < 4; q++ )
                {
                    comp1[q] = vgetq_lane_f32(neon_comp1, q);
                }                

                float32_t comp2 = 1.0;
                //neon_comp2 = vmovq_n_f32(comp2);
                float32_t mult[4] = {0};

                for (int w = 0; w < 4; w++)
                {
                    if (comp1[w] > comp2)
                    {
                        mult[w] = 1.0;
                    }
                    else
                        mult[w] = 0.0;
                }

                neon_mult = vld1q_f32 (&mult[0]);

                float32_t weight_ij[4] = {0};
                for (int n = 0; n < 4; n++ )
                {
                weight_ij[n] = weight.at<float>(i,j+n);
                }

                neon_weight_ij = vld1q_f32 (&weight_ij[0]);

                neon_temp_dx = vmulq_f32(neon_nj,neon_weight_ij);
                neon_temp_dy = vmulq_f32(neon_ni,neon_weight_ij);
                neon_temp2_dx = vmulq_f32(neon_temp_dx, neon_mult);
                neon_temp2_dy = vmulq_f32(neon_temp_dy, neon_mult);

                //neon_dx = vdupq_n_f32(0); // same as vmovq_n_f32.
                neon_dx = vaddq_f32(neon_dx,neon_temp2_dx);// 加一个0 的初始化

                //neon_dy = vdupq_n_f32(0);
                neon_dy = vaddq_f32(neon_dy,neon_temp2_dy);// 加一个0 的初始化

                neon_temp_sum = vmulq_f32(neon_weight_ij,neon_mult);

                //neon_sum = vdupq_n_f32(0);
                neon_sum = vaddq_f32(neon_sum,neon_temp_sum);

            }
        }

        float32_t value_sum_wij[4] = {0};
        value_sum_wij[0] = vgetq_lane_f32(neon_sum, 0);
        value_sum_wij[1] = vgetq_lane_f32(neon_sum, 1);
        value_sum_wij[2] = vgetq_lane_f32(neon_sum, 2);
        value_sum_wij[3] = vgetq_lane_f32(neon_sum, 3);
        sum_wij = value_sum_wij[0]+value_sum_wij[1]+value_sum_wij[2]+value_sum_wij[3];

        float32_t value_dx[4] = {0};
        value_dx[0] = vgetq_lane_f32(neon_dx, 0);
        value_dx[1] = vgetq_lane_f32(neon_dx, 1);
        value_dx[2] = vgetq_lane_f32(neon_dx, 2);
        value_dx[3] = vgetq_lane_f32(neon_dx, 3);
        delta_x = value_dx[0]+value_dx[1]+value_dx[2]+value_dx[3];


        float32_t value_dy[4] = {0};
        value_dy[0] = vgetq_lane_f32(neon_dy, 0);
        value_dy[1] = vgetq_lane_f32(neon_dy, 1);
        value_dy[2] = vgetq_lane_f32(neon_dy, 2);
        value_dy[3] = vgetq_lane_f32(neon_dy, 3);
        delta_y = value_dy[0]+value_dy[1]+value_dy[2]+value_dy[3];

        next_rect.x += static_cast<int>((delta_x/sum_wij)*centre); // 还需要用neon运算
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
