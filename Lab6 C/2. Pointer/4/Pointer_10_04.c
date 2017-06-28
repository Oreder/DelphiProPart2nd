#include <stdio.h>
#include <stdlib.h>

#define NN 12

void main()
{
	int N;					// size of matrix
	int A[NN][NN];			// integer matrix NN x NN
	int i, j;				// loop's indexes
	int *ipr = &i;			/* store address of row-index in pointer variable */
	int P[NN];				// array of positives NN elements

	printf("Input size of matrix (NxN): ");
	scanf("%d", &N);
	
	printf("\n Matrix input:\n\n");
	for (i=0; i<N; i++)
	{
		for (j=0; j<N; j++)
		{
			A[*ipr][j] = rand() % 10 - 2;	// randomize element
			printf("%3d", A[*ipr][j]);		
		}
		printf("\n\n");						/* INPUT DONE */
	}
	
	for (j=0; j<N; j++)
		for (i=0; i<N; i++)					/* CREATE ARRAY P[n] */
			if (A[*ipr][j] > 0)
			{
				P[j] = A[*ipr][j];
				break;
			}
											
	printf("[OUTPUT] Array positive number:");
	for (i=0; i<N; printf("%3d", P[*ipr]), i++);
											/* OUTPUT */
	getchar();
	getchar();
}						/* Program IV (variant 10) */