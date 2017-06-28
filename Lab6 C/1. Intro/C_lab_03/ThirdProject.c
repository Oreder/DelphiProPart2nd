#include <stdio.h>	 // use scanf() and printf()	
#include <math.h>
// #include <conio.h>  ---> use getchar();

void main()
{
	int x, y;				// Point's coordinates
	float z1, z2;			// counting variables
	
	printf("Input coordinates (X, Y): ");
	scanf("%d %d", &x, &y);
	
	z1 = y * sqrt(3.0) - x;	// first line 
	z2 = y * sqrt(3.0) + x;	// second line

	if (z1 > 0 && z2 < 0 && x < 0)
	{
		printf("\nPoint (%d, %d) is in part IV", x, y);
	}
	else
		if (z1 < 0 && z2 > 0)
		{
			if (x > 2)
			{
				printf("\nPoint (%d, %d) is in part III", x, y);
			}
			else
				printf("\nPoint (%d, %d) is in part I", x, y);
		}
		else
			printf("\nAnswer: Point (%d, %d) is in part II", x, y);

	getchar();
	getchar();
}					/* Zone program (page 51) */