#include <stdio.h>

#define PI 3.14

/**
 * main - test for vimrc
 *
 * Return: 0 on success, or 1 on error
 */
int main(void)
{
	int i;

	for (i = 0; i < 10; i++)
	{
		printf("%d\n", i);
	}
	printf("PI = %f", PI);
	return (0);
}

