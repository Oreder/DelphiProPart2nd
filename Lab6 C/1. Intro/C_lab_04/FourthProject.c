#include <stdio.h>

void main ()
{
	int N;				// number elements of array D
	int D[25];			// array of integer (Nmax = 25)
	int i, ip, in;		// counting variables 
	int Imin;			// index of min element
	int Sum;			// Sum of positive numbers
	int Pro;			// Product of negative numbers

	printf("Input number elements: ");
	scanf("%d", &N);
	// input array
	printf("\nInput array: ");
	for (i=0; i<N; i++)
	{
		 scanf("%d", &D[i]);
		 if (D[i] > 0) 
			 Imin = i;					
	}

	printf("\n\nResult:\n   (1) Array:");			
	i = ip = in = 0;
	Sum = 0; Pro = 1;					// beginning values

	/* MAIN */
	do
	{
		printf("  %d", D[i]);			// print array
		if (D[i] > 0)
		{
			ip ++;						// count number positive
			Sum = Sum + D[i];			// calculate SUM
			if (D[i] < D[Imin])	
				Imin = i;				// Imin loop
		}
		else
			if (D[i] < 0)
			{
				Pro = Pro * D[i];		// calculate PRODUCT 
				in ++;					// identify number of negative	
			}
		i++;
	}
	while (i < N);
	
	/* Print results */
	if (ip > 0)							
	{
		printf("\n   (2) Minimum positive value  : %d", D[Imin]);
		printf("\n   (3) Sum of positive elements: %d", Sum);
		printf("\n   (4) Medium positive value   : %.2f", (float) Sum / ip);
	}
	else
		printf("\n   (!) Array has NO positive elements!");
						
	if (in > 0)							
		printf("\n   (5) Product of negative elements: %d", Pro);
	else
		printf("\n   (5) Array has NO negative elements!");

	getchar();
	getchar();
}					 /* Loop program (page 92) */