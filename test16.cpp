//
//  test.cpp
//  
//
//  Created by 刘璐 on 2017/5/26.
//
//

#include <stdio.h>
#include <iostream>

using  namespace std;

const int scale = 8; // 1/2^16
//const int FractionMask = 0xffffffff >> (32-scale);
#define FloatToFixed(x) (x* (float)(1<<scale))
#define FixedToFloat(x) ((float)x/(float)(1<<scale))
#define IntToFixed(x) ((x) << scale)
#define Shift8(x) ((x) << 4)
#define FixedToInt(x) ((x) >> scale)
#define MUL(x, y) ((((x)>>4)*((y)>>4))>>0)
#define DIV(x, y) (((x)<<3)/(y) << 5)

//long sqrtL2L( long X ) {
//    
//    unsigned long t, q, b, r;
//    
//    r = X;
//    b = 0x40000000;
//    q = 0;
//    
//    while( b >= 256 ) {
//        t = q + b;
//        q = q / 2;     /* shift right 1 bit */
//        if( r >= t ) {
//            r = r - t;
//            q = q + b;
//        }
//        b = b / 4;     /* shift right 2 bits */
//    }
//    
//    return( q );
//}

int SquareRootRounded(uint16_t x) // wrong with uint16_t DO NOT USE
{
    uint16_t op  = x;
    uint16_t res = 0;
    uint16_t one = 1uL << 14; // The second-to-top bit is set: use 1u << 14 for uint16_t type; use 1uL<<30 for uint32_t type
    
    
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
    //(int)res/(1<<8);
    //int s = IntToFixed(res);
    uint16_t s = Shift8(res);
    return s; // fixed number needs : (float)res/(float)(1<<8);
}

int main ()
{
//    float x = 45;
//    int y = FloatToFixed(x);
//    int s = SquareRootRounded(y);
//    std::cout << "Result: " << s << std::endl;
//    
//    int r = (s)<<8; // fixed result
//    std::cout << "fixed result: " << r << std::endl;
//    
//    float res = (float)s/(float)(1<<8);
//    std::cout << "float: " << res << std::endl;
//    
//    int test = FloatToFixed(res);
//    std::cout << "test: " << test << std::endl;
    
    float x1 = 3.14;
    uint16_t y1 = FloatToFixed(x1);
    std::cout << "x1:" << x1 << "   " << y1 << "    " << FixedToFloat(y1) << std::endl;
    
    float x2 = 2.0;
    uint16_t y2 = FloatToFixed(x2);
    std::cout << "3.14 + 2.0 = " << x1+x2 << " " << y1+y2 << " " << FixedToFloat((y1+y2)) <<std::endl;
    
    std::cout << "3.14*2.0 = " << x1*x2 << "    " << MUL(y1, y2) << "   " << FixedToFloat(MUL(y1, y2)) << std::endl;
    
    std::cout << "3.14/2.0 = " << x1/x2 << "    " << DIV(y1, y2) << "   " << FixedToFloat(DIV(y1, y2)) << std::endl;
    
    int large = 400;
    uint16_t large_fix = IntToFixed(large);
    
    //std::cout << "large: " << large << "    " << large_fix << " " << FixedToInt(large_fix) << std::endl;
    
    
    uint16_t s = SquareRootRounded(large_fix);
    std::cout << "sqrt 400: " << s << " " << FixedToFloat(s) << "   " << IntToFixed(20) << std::endl;
    
    
    
    
    return 0;
}
