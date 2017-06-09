/*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/

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

    kernel = new cv::Mat(rect.height,rect.width,CV_32F,cv::Scalar(0));
    normalized_C = 1.0 / Epanechnikov_kernel(kernel);

    for(int i=0;i<rect.height;i++)
    {
        for(int j=0;j<rect.width;j++)
        {
            kernel->at<float>(i,j) = kernel->at<float>(i,j)*normalized_C;
        }
    }

    target_model = pdf_representation(frame,target_Region); 

    centre = static_cast<float>((target_Region.height-1)/2.0);

    int norms_length = rect.height > rect.width ? rect.height : rect.width;
    norms = new float[norms_length];
    normsPow = new float[norms_length];

    for(int i = 0; i < norms_length; i++) {
        norms[i] = static_cast<float>(i - centre)/centre;
        normsPow[i] = norms[i]*norms[i];
    }

    next_rect.width = rect.width;
    next_rect.height = rect.height;
}

float  MeanShift::Epanechnikov_kernel(cv::Mat *kernel)
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

static const unsigned char lookup[256] = { 
  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
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
    cv::Mat pdf_model(3,16,CV_32F,cv::Scalar(0));

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

}

cv::Mat MeanShift::CalWeight(const cv::Mat &frame, cv::Mat &target_model, 
                    cv::Mat &target_candidate, cv::Rect &rec)
{

    int rows = rec.height;
    int cols = rec.width;
    int row_index = rec.y;
    int col_index = rec.x;

    cv::Mat weight(rows,cols,CV_32F,cv::Scalar(1.0000));

    float* tm_div_tc = new float[target_model.cols * target_model.rows];

    // Divide target model and target candidate
    for(int r = 0; r < 3; r++) {
        for(int c = 0; c < 16; c++) {
            tm_div_tc[r*target_model.cols + c] = static_cast<float>((sqrt(target_model.at<float>(r, c)/target_candidate.at<float>(r, c))));
        }
    }

    row_index = rec.y;
    for(int i=0;i<rows;i++)
    {
        col_index = rec.x;
        for(int j=0;j<cols;j++)
        {
            int curr_pixel = frame.data[row_index * frame.cols*3 + col_index*3];
            int bin_value = lookup[curr_pixel];
            weight.at<float>(i,j) *= tm_div_tc[bin_value];

            curr_pixel = frame.data[row_index * frame.cols*3 + col_index*3 + 1];
            bin_value = lookup[curr_pixel];
            weight.at<float>(i,j) *= tm_div_tc[target_model.cols + bin_value];

            curr_pixel = frame.data[row_index * frame.cols*3 + col_index*3 + 2];
            bin_value = lookup[curr_pixel];
            weight.at<float>(i,j) *= tm_div_tc[2*target_model.cols + bin_value];

            col_index++;
        }
        row_index++;
    }

    delete[] tm_div_tc;

    return weight;
}

cv::Rect MeanShift::track(const cv::Mat &next_frame)
{
    for(int iter=0;iter<cfg.MaxIter;iter++)
    {
        cv::Mat target_candidate = pdf_representation(next_frame,target_Region);
        cv::Mat weight = CalWeight(next_frame,target_model,target_candidate,target_Region);

        float delta_x = 0.0;
        float sum_wij = 0.0;
        float delta_y = 0.0;
        double mult = 0.0;

        next_rect.x = target_Region.x;
        next_rect.y = target_Region.y;

        for(int i = 0; i < target_Region.height; i++)
        {
            for(int j = 0; j < target_Region.width ; j++)
            {
                mult = normsPow[i] + normsPow[j] > 1.0 ? false : true;
                if(!mult){
                  if(norms[j] > 0) {
                    break;
                  }
                  continue;
                }
                
                float tmp = weight.at<float>(i,j);
                delta_x += norms[j]*tmp;
                delta_y += norms[i]*tmp;
                sum_wij += tmp;
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
