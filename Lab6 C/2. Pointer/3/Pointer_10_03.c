#include <stdio.h>
#include <stdlib.h>		/* (library) get randomize */

#define NN 12

void main()
{
	int N;				// size of matrix
	int A[NN][NN];		// square matrix NN x NN
	int i, j;			// loop's indexes
	int temp;			// temporary value 
	
	printf("Input size of matrix (NxN): ");
	scanf("%d", &N);
	
	printf("\n Matrix input:\n\n");
	for (i=0; i<N; i++)
	{
		for (j=0; j<N; j++)
		{
			A[i][j] = rand() % 9;		// randomize element
			printf("%3d", A[i][j]);		
		}
		printf("\n\n");
	}	
		/* OUTPUT */
	if (N % 2 == 0)		// N - even number
	{
		printf(" Matrix is changed:\n\n");
		for (i=0; i<N; i++)				/* format matrix */
		{
			for (j=0; j<N; j+=2)
			{
				temp = A[i][j];
				A[i][j] = A[i][j+1];	/* swap 2 elements */
				A[i][j+1] = temp;

				printf("%3d%3d", A[i][j], A[i][j+1]);
			}							// print out
			printf("\n\n");
		}
	}
	else				// N - odd number
		printf("\n Size of matrix is odd (N = %d). Matrix will NOT be changed!", N);

	getchar();
	getchar();
}						/* Program III (variant 10) */