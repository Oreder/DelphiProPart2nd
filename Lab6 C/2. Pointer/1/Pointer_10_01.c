#include <stdio.h>

void main()
{
	int NA;			// number elements of array
	int A[20];		// array of integers (Nmax = 20)
	int i;			// loop's index
	int *Pa, *Pb;	/* pointers variable declaration */
	int B[20][20];	// matrix (max size 20x20)
	int M, N;		// size of matrix
	int s;			// sum elements, which can divide into 9 

	printf("(1)[ARRAY] Input number elements NA: ");
	scanf("%d", &NA);
	printf("\n Input array: ");
	Pa = (int *)A;  	/* Send pointer to beginning value of array
						   Another way: Pa = A;  */
	for (s = 0, i = 0; i < NA; ++i) 
	{	
		scanf("%d", Pa+i); 
		if (*(Pa+i) % 9 == 0)
			s += *(Pa+i);		// calculate SUM
	} 
	printf("\n--> Sum of elements (which can divide into 9): %d", s);
	getchar();
	getchar();

	printf("\n\n(2)[MATRIX] Input size of matrix (MxN): ");
	scanf("%d%d", &M, &N);
	printf("\n Input matrix (%dx%d) here:\n\n", M, N);
	Pb = (int *)B;		/* Access pointer into beginning of matrix */			
	for (s = 0, i = 0; i < M*N; ++i)
	{
		scanf("%d", Pb+i);
		if (*(Pb+i) % 9 == 0) 
			s += *(Pb+i);		// calculate SUM
	}
	printf("\n--> Sum of elements (which can divide into 9): %d", s);
	getchar();
	getchar();
}					/* Program I (variant 10) */