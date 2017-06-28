#include <stdio.h>

void main()
{
	int N;				// number elements of array
	double A[20];		// array of real number
	int i;				// loop's index
	double *PA;			// pointer shows element's index 
	int imax;			// index of maximum element

	printf("Input number elements N: ");
	scanf("%d", &N);
	printf("\n Input array: ");
	PA = (double *)A;		/* access beginning value using the pointer */
					
	for (imax = 0, i = 0; i < N; ++i)
	{
		scanf("%lf", PA+i);	// read elements
		if (PA[imax] < *(PA+i)) 
			imax = i;		// find index of maximum element
	}
	
	printf("\nFirst position of maximum elements: %d (where max = %.2lf)", imax+1, PA[imax]);
	getchar();
	getchar();
}						/* Program II (variant 10) */