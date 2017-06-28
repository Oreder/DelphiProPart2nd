#include <stdio.h>

void main()
{
	float A, B, C, D, E, F, x, y;	/* system's variables */
	float D0, Dx, Dy;				/* determinants */
	
	printf("Solution for system 2 equations\n");
	printf("        (1) Ax + By + C = 0\n");
	printf("        (2) Dx + Ey + F = 0\n\n");	/* problem form */
	
	printf("Input A, B, C: ");		/* input coefficients of system */
	scanf("%f %f %f", &A, &B, &C);
	printf("\nInput D, E, F: "); 
	scanf("%f %f %f", &D, &E, &F);
	
	D0 = A*E - B*D;			/* identify determinants */
	Dx = B*F - C*E;
	Dy = C*D - A*F;

	if (D0 == 0)
	{
		if (Dx = Dy = 0)
			printf("\nSystem has countless roots!");
		else
			printf("\nSystem has NO roots!");
	}
	else
	{
		x = Dx / D0;		/* Print out solution */
		y = Dy / D0;
		printf("\nSystem has 1 root: X = %.2f; Y = %.2f", x, y);
	}

	if (A*x + B*y + C == 0 && D*x + E*y + F == 0)
		printf("\n\n Result was checked correctly! ");

	getchar();
	getchar();
}							/* System program (page 39) */