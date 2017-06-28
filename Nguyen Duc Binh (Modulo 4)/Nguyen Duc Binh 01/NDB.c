#include <stdio.h>
#include <math.h>

#define max_size 13

float result(float X, float epsilon)
{
	float sum, r;
	int k;
	for (k = 0, sum = 0, r = X; fabs(r) > epsilon; ++k)
	{
		sum += r;
		r *= - X*X*(2*k+1)/((2*k+2)*(2*k+3)*(2*k+3));
	}
	return sum;
}


void sum_Compare(int size, float real_array[max_size], float R)
{
	int i;
	int count = 0;
	for (i = 0; i < size; ++i)
		if (real_array[i] > R)
			count++;
	if (count > 0) 
	{
		printf("\n Elements, which have value bigger than sum R: ");
		for (i = 0; i < size; ++i)
			if (real_array[i] > R)
				printf("%.2lf  ", real_array[i]);
	}
	else
		printf("\n This array does NOT have elements, which have bigger value than sum R!");
}



void sort(int size, float (*real_array)[max_size])
{
	int left = 0, right = size-1;
	int i, temp;
	do
	{
		for (i = left; i < size-1; ++i)
			if ((*real_array)[i] > (*real_array)[i+1])
			{
				temp = (*real_array)[i];
				(*real_array)[i] = (*real_array)[i+1];
				(*real_array)[i+1] = temp;
			}
		for (i = right; i > 0; --i)
			if ((*real_array)[i] < (*real_array)[i-1])
			{
				temp = (*real_array)[i];
				(*real_array)[i] = (*real_array)[i-1];
				(*real_array)[i-1] = temp;
			}
		left++; right--;
	}
	while (left < right);
}



void DATA_out(int size, float real_array[max_size])
{
	int i;
	for (i = 0; i < size; printf("%.2lf  ", real_array[i]), ++i);
}


void main()
{
	float X, eps;
	float R;

	int i;
	int N;
	float D[max_size];
		
		/* Part 1: CALCULATE sum R */
	printf("Part 1: CALCULATE sum R\n\n Input X and Epsilon: ");
	scanf("%f %f", &X, &eps);
	R = result(X, eps);
	printf("\n [Output] Sum R = %.5lf\n\n\n", R);

		/* part 2: ARRAY */
	printf("Part 2: ARRAY\n\n Input number elements of array: ");
	scanf("%d", &N);
	printf("\n Input array: ");
	for (i = 0; i < N; scanf("%f", &D[i]), ++i);
	sum_Compare(N, D, R);

		/* part 3: Sort array (Shecker) */
	printf("\n\n\nPart 3: SORT\n\n Array (input) : ");
	DATA_out(N, D);
	sort(N, &D);
	printf("\n\n Array (output): ");
	DATA_out(N, D);

	getchar();
	getchar();
}						  /* PROGRAM_variant_7 */