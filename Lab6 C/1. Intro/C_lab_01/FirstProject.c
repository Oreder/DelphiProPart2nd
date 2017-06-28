#include <stdio.h>

void main()
{
	int X, Y, Z1, Z2;			// X, Y: input value
	printf("Input value X and Y: ");
	scanf("%d %d", &X, &Y);
	
	Z1 = X*X * Y*Y + 3 * X * Y*Y - 5 * X*X * Y + X*X - 2 * Y*Y + 4 * X*Y - X + Y; // value Z without sorting

	Z2 = X*Y * (X*Y + 3*Y - 5*X + 4) + X*(X-1) + Y*(1-2*Y);  // value Z in sorting

	printf("\nResult:\n\n");		// print out result
	printf("    Without sorting Z1 = %d\n\n", Z1);
	printf("    If sorting Z2 = %d", Z2);
	getchar();
	getchar();  // getch();
}					/* Calculation program (page 36) */