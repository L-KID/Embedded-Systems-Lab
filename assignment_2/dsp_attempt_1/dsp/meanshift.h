extern float bin_width;

extern struct config {
	int num_bins;
    int pixel_range;
    int MaxIter;
} cfg;

struct Rect {
	int height;
	int width;
	int x;
	int y;
};

struct Matrix {
	int rows;
	int cols;
	float* data;
};
