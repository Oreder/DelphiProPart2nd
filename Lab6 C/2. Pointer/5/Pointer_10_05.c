#include <stdio.h>

void main()
{
	int N;				// number element of array
	int A[20];			// array of integer
	int i, ip;			// loop's indexes
	int New;			// new element
	int *iPtr = &i;		// access pointer into index

	printf("Input number element of array: ");
	scanf("%d", &N);
	printf("\n Input begining array:\n");
	for (i=0; i<N; printf("  A[%d] = ", i+1), scanf("%d", &A[*iPtr]), ++i);
			// read array elements
	printf("\nInput new element A[%d]: ", N+1);
	scanf("%d", &New);
			
	for (i=N-1; i>=0; --i)
	{
		if (A[*iPtr] % (*iPtr+1) == 0) 
			break;
	}		/* Find last element which can divide into it's index */
	
	ip = *iPtr+1;
	for (i=N; i>ip; A[*iPtr] = A[*iPtr-1], --i);
	A[*iPtr] = New;		// Change array

	printf("\n ARRAY OUTPUT: ");
	for (i=0; i<N+1; printf("%d ", A[*iPtr]), ++i);	
	getchar();
	getchar();
}						/* Program V (variant 10) */