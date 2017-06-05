 /*
 * Based on paper "Kernel-Based Object Tracking"
 * you can find all the formula in the paper
*/

#include"meanshift.h"

// 
const int scale = 16; // 1/2^16
//const int FractionMask = 0xffffffff >> (32-scale);
#define FloatToFixed(x) (x* (float)(1<<scale))
#define FixedToFloat(x) ((float)x/(float)(1<<scale))
#define IntToFixed(x) ((x) << scale)
#define FixedToInt(x) ((x) >> scale)
#define MUL(x, y)  ((((x) >> 8)*((y) >> 8)) >> 0)
#define DIV(x, y) (((x)<<7)/(y)<<9)

int k = 0;
float normalized_C; // fixed point number

int SquareRootRounded(int x)
{
    // input a fixed number
    uint32_t op  = x;
    uint32_t res = 0;
    uint32_t one = 1uL << 30; // The second-to-top bit is set: use 1u << 14 for uint16_t type; use 1uL<<30 for uint32_t type
    
    
    // "one" starts at the highest power of four <= than the argument.
    while (one > op)
    {
        one >>= 2;
    }
    
    while (one != 0)
    {
        if (op >= res + one)
        {
            op = op - (res + one);
            res = res +  2 * one;
        }
        res >>= 1;
        one >>= 2;
    }
    
    /* Do arithmetic rounding to nearest integer */
    if (op > res)
    {
        res++;
    }
    
    res = res*(float)(1<<4);
    
    return res; // fixed number
}

MeanShift::MeanShift()
{
    cfg.MaxIter = 8;
    cfg.num_bins = 16;
    cfg.piexl_range = 256;
    //bin_width = IntToFixed(cfg.piexl_range / cfg.num_bins);
    bin_width = 16;
}

void  MeanShift::Init_target_frame(const cv::Mat &frame,const cv::Rect &rect)
{
    target_Region = rect;
    target_model = pdf_representation(frame,target_Region);
}

int  MeanShift::Epanechnikov_kernel(cv::Mat &kernel)
{
    int h = kernel.rows;
    //int h_fix = IntToFixed(h);
    //std::cout << "Kernel.rows: " << h << "  " << h_fix << std::endl;
    int w = kernel.cols;
    //int w_fix = IntToFixed(w);
    //std::cout << "Kernel.cols: " << w << "  " << w_fix << std::endl;

    float epanechnikov_cd = 0.1*PI*h*w;
    //int epanechnikov_cd = MUL(MUL(MUL((int)FloatToFixed(0.1), (int)FloatToFixed(PI)), h_fix),w_fix);
    //std::cout << "0.1*PI: " << MUL((int)FloatToFixed(0.1), (int)FloatToFixed(PI)) << std::endl;
    //std::cout << "epanechnikov_cd: " << epanechnikov_cd << std::endl;
    float kernel_sum = 0.0;
    //int kernel_sum = FloatToFixed(0.0);
    for(int i=0;i<h;i++)
    {
        for(int j=0;j<w;j++)
        {
            
            float x = static_cast<float>(i - h/2);
            float  y = static_cast<float> (j - w/2);
            //int x = IntToFixed(i) - DIV(h_fix, (int)IntToFixed(2));
            //int y = IntToFixed(j) - DIV(w_fix, (int)IntToFixed(2));
            float norm_x = x*x/(h*h/4)+y*y/(w*w/4);
            //int norm_x = DIV(MUL(x,x), DIV(MUL(h_fix,h_fix), (int)IntToFixed(4))) + DIV(MUL(y, y), DIV(MUL(w_fix,w_fix), (int)IntToFixed(4)));
            
            float result =norm_x<1?(epanechnikov_cd*(1.0-norm_x)):0;
            //int result = norm_x<IntToFixed(1)? (MUL(epanechnikov_cd, (int)(IntToFixed(1)-norm_x))):(int)IntToFixed(0);
            kernel.at<float>(i,j) = result;
            //kernel.at<int>(i,j) = result;
            kernel_sum += result;
        }
    }
    k = 1;
    //std::cout << "Epanechnikov_kernel result: " << kernel_sum << std::endl;
    return kernel_sum; // kernel_sum in fixed number
}

cv::Mat MeanShift::pdf_representation(const cv::Mat &frame, const cv::Rect &rect)
{
    cv::Mat kernel(rect.height,rect.width,CV_32F,cv::Scalar(0));
    //cv::Mat kernel(rect.height,rect.width,CV_32S,cv::Scalar(0));
    if (k == 0){
        normalized_C = 1.0 / Epanechnikov_kernel(kernel);
        //int ek = FloatToFixed(Epanechnikov_kernel(kernel));
        //std::cout << "ek: " << ek << std::endl;
        //normalized_C = DIV(IntToFixed(1), ek);
        //int normalized_C = FloatToFixed((1.0 / Epanechnikov_kernel(kernel)));
        //std::cout << "normalized_C: " << normalized_C << std::endl;
        //int normalized_C = DIV(IntToFixed(1), Epanechnikov_kernel(kernel));
    }

    cv::Mat pdf_model(8,16,CV_32F,cv::Scalar(1e-10));
    //cv::Mat pdf_model(8,16,CV_32S,cv::Scalar(1));

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
            /*std::cout << kernel.at<float>(i,j) << " " << (int)FloatToFixed(kernel.at<float>(i,j)) << std::endl;
            pdf_model.at<int>(0,bin_value[0]) += MUL((int)FloatToFixed(kernel.at<float>(i,j)), normalized_C);
            pdf_model.at<int>(1,bin_value[1]) += MUL((int)FloatToFixed(kernel.at<float>(i,j)), normalized_C);
            pdf_model.at<int>(2,bin_value[2]) += MUL((int)FloatToFixed(kernel.at<float>(i,j)), normalized_C);
            std::cout << pdf_model.at<int>(0,bin_value[0]) << " " << pdf_model.at<int>(1,bin_value[1]) << " " << pdf_model.at<int>(2,bin_value[2]) << std::endl;*/
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
    //cv::Mat weight(rows,cols,CV_32S,cv::Scalar(1));
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
                // Change weight to fixed point number
                int tm = FloatToFixed(target_model.at<float>(k, bin_value));
                //std::cout << "model "<<target_model.at<float>(k, bin_value) << "  " << tm << std::endl;
                int tc = FloatToFixed(target_candidate.at<float>(k, bin_value));
                //std::cout << "candidate "<<target_candidate.at<float>(k, bin_value) << "   " << tc << std::endl;
                if(tc==0)
                    tc = 1;
                int w = DIV(tm, tc);
                weight.at<float>(i,j) = static_cast<float>(FixedToFloat(MUL((int)FloatToFixed(weight.at<float>(i,j)), (int)SquareRootRounded(w))));
                //weight.at<float>(i,j) *= static_cast<float>((sqrt(DIV(target_model.at<int>(k, bin_value), target_candidate.at<int>(k, bin_value)))));
                //std::cout << "" << weight.at<int>(i,j) << std::endl;
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

        float delta_x = 0;
        float sum_wij = 0;
        float delta_y = 0;
        float centre = static_cast<float>((weight.rows-1)/2.0);
        double mult = 0.0;
        
/*        int delta_x = IntToFixed(0);
        int sum_wij = IntToFixed(0);
        int delta_y = IntToFixed(0);
        int centre = DIV((IntToFixed(weight.rows)-IntToFixed(1)), IntToFixed(2));
        int mult = IntToFixed(0);
 */

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
                //int norm_i = DIV((IntToFixed(i)-centre), centre);
                //int norm_j = DIV((IntToFixed(j)-centre), centre);
                mult = pow(norm_i,2)+pow(norm_j,2)>1.0?0.0:1.0;
                //mult = (MUL(norm_i, norm_i) + MUL(norm_j, norm_j))> IntToFixed(1)? IntToFixed(0):IntToFixed(1);
                delta_x += static_cast<float>(norm_j*weight.at<float>(i,j)*mult);
                delta_y += static_cast<float>(norm_i*weight.at<float>(i,j)*mult);
                sum_wij += static_cast<float>(weight.at<float>(i,j)*mult);
                //delta_x += MUL(MUL(norm_j, weight.at<int>(i,j)), mult);
                //delta_y += MUL(MUL(norm_i, weight.at<int>(i,j)), mult);
                //sum_wij += MUL(weight.at<int>(i,j), mult);
                
            }
        }

        next_rect.x += static_cast<int>((delta_x/sum_wij)*centre);
        next_rect.y += static_cast<int>((delta_y/sum_wij)*centre);
        //if (sum_wij==0)
            //sum_wij = 1;
        
        //next_rect.x += FixedToInt(MUL(DIV(delta_x, sum_wij), centre));
        //next_rect.x += FixedToInt(MUL(DIV(delta_y, sum_wij), centre));

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
