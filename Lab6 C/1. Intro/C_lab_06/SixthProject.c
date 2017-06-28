#include <stdio.h>

#define MM 10
#define NN 12

void main()
{
	int M, N;					// matrix size 
	int A[MM][NN];				// matrix MM x NN
	int i, j;					// indexes counting loop
	int temp;					// changing variable
	int imin = 0, jmin = 0;		// begining min-index  
	int imax = 0, jmax = 0;     // begining max index

	printf("Input size of matrix (M,N): ");			// input size
	scanf("%d %d", &M, &N);					
	
	printf("\nInput matrix A[%d,%d]:\n", M, N);		// input elements
	for (i = 0; i < M; i++)
		for (j = 0; j < N; j++)
			scanf("%d", &A[i][j]);					/* INPUT DONE */
					
	printf("\n\n Matrix Input:\n\n");				/* MAIN OUTPUT */
	for (i = 0; i < M; i++)
	{
		for (j = 0; j < N; j++)
		{
			printf("%3d", A[i][j]);					// print elements
			if (A[i][j] < A[imin][jmin])
			{
				imin = i; jmin = j;					/* identify MIN */
			}
			if (A[i][j] > A[imax][jmax])
			{
				imax = i; jmax = j;					/* identify MAX */
			}
		}
		printf("\n\n");
	}
		/* print out min and max position */
	printf("Minimum position A[%d,%d] = %d\n", imin+1, jmin+1, A[imin][jmin]);
	printf("Maximum position A[%d,%d] = %d\n", imax+1, jmax+1, A[imax][jmax]);

	if (imin != imax)
		for (j = 0; j < N; j++)
		{
			temp = A[imin][j];
			A[imin][j] = A[imax][j];
			A[imax][j] = temp;						/* create new matrix */
		}
	else
		for (i = 0; i < M; i++)
		{
			temp = A[i][jmin];
			A[i][jmin] = A[i][jmax];
			A[i][jmax] = temp;
		} 
		
	printf("\n Matrix Output:\n\n");				/* print out new matrix */
	for (i = 0; i < M; i++)
	{
		for (j = 0; j < N; printf("%3d", A[i][j]), j++);
		printf("\n\n");
	}

	getchar();
	getchar();
}						/* Matrix program (page 158) */