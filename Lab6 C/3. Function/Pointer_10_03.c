#include <stdio.h>
#include <stdlib.h>		/* (library) get randomize */

#define Max_Size 12

void DATA_In(int size, int (*matrix)[][Max_Size])  /* input matrix by random */
{
	int i, j;
	for (i = 0; i < size; ++i)
		for (j = 0; j < size; ++j)
			(*matrix)[i][j] = rand() % 9;
}


void ReNew(int size, int (*matrix)[][Max_Size])		/* format matrix */
{
	int i, j;
	if (size % 2 == 0) 
	{
		printf(" Matrix is changed:\n\n");
		for (i = 0; i < size; ++i)				
			for (j = 0; j < size; j+=2)
			{
				int temp = (*matrix)[i][j];
				(*matrix)[i][j] = (*matrix)[i][j+1];	/* swap 2 elements */
				(*matrix)[i][j+1] = temp;
			}
	}
	else
		printf("\n Size of matrix is odd (N = %d). Matrix will NOT be changed!\n\n", size);
}


void DATA_Out(int size, int matrix[][Max_Size])			/* Print OUTPUT */
{
	int i, j;
	for (i = 0; i < size; ++i)
	{
		for (j = 0; j < size; ++j)
			printf("%3d", matrix[i][j]);
		printf("\n\n");
	}
}



void main()
{
	int N;							// matrix size
	int A[Max_Size][Max_Size];		// square matrix
	
	printf("Input size of matrix (NxN): ");
	scanf("%d", &N);

	printf("\n\n Matrix input:\n\n");
	DATA_In(N, &A);		/* INPUT */
	DATA_Out(N, A);

	ReNew(N, &A);		/* Nenew matrix */
	
	DATA_Out(N, A);     /* OUTPUT */
	getchar();
	getchar();
}						/* Program III (variant 10) */