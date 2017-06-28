#include <stdio.h>

#define MM 12
#define NN 10

void main()
{
	int M, N;					// size of matrix
	int A[MM][NN];				// matrix MM x NN
	int i,j;					// loop's indexes
	int imin = 0, jmin = 0;		// position min-elements
	int Z[NN];					// new inserted array

	printf("Input size of matrix (MxN): ");
	scanf("%d%d", &M, &N);

	printf("\nInput matrix %dx%d:\n", M, N);
	for (i=0; i<M; i++)
		for (j=0; j<N; j++)
		{
			scanf("%d", &A[i][j]);			// read elements
			if (A[imin][jmin] > A[i][j])	
			{
				imin = i; jmin = j;			/* find minimum element */
			}
		}

	printf("\n Input new row (array %d elements): ", N);
	for (i=0; i<N; scanf("%d", &Z[i]), i++);

	printf("\n\n Matrix input:\n\n");
	for (i=0; i<M; i++)
	{						/* print begining matrix */
		for (j=0; j<N; printf("%3d", A[i][j]), j++);
		printf("\n\n");						
	}
							/* print out position of first minimum value */					
	printf(" Minimum element A[%d][%d] = %d, which AT FIRST appears in ROW [%d].", imin+1, jmin+1, A[imin][jmin], imin+1);
											
	imin++;
	for (j=0; j<N; j++)
		{					/* Change matrix */
			for (i=M; i>imin; A[i][j] = A[i-1][j], i--);
			A[imin][j] = Z[j];
		}

	printf("\n\n Matrix output:\n\n");
	for (i=0; i<=M; i++)
	{
		for (j=0; j<N; printf("%3d", A[i][j]), j++);
		printf("\n\n");
	}						/* print out matrix after changing */	

	getchar();
	getchar();
}							/* Program VI (variant 1) */