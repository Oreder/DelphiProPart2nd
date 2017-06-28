#include <stdio.h>
#include <math.h>

void main()
{
	int i;				// begining loop's index
	float Eps;			// Epsilon
	float X;			// input-variable
	float S, Sn;		// sum of series, which contains member Sn
	float S0;			// absolute value of function
	float abs, rel;		// absolute and relative errors

	printf("Input epsilon: ");
	scanf("%f", &Eps);
	printf("Input value X: ");
	scanf("%f", &X);
	
	S0 = log(1+X)/X;				// identify absolute value
	S = 0; Sn = 1;
	
	// calculating sum series
	for (i=1; fabs(Sn) > Eps; S+=Sn, Sn *= -X*i/(i+1), i++);
	
	abs = fabs(S0 - S);
	rel = abs / S0;
	printf("\nSum of series : %.9f\n", S);
	printf("Real value    : %.9f\n", S0);
	printf("Absolute error: %.9f\n", abs);
	printf("Relative error: %.9f", rel);
	
	//printf("Time ending: %d\n", i-1);
	//printf("Break value: %.9f", Sn);
	getchar();
	getchar();
}					/* Series program (page 105) */