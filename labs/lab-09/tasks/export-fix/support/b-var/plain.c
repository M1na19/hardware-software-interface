// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

int age; // remove static

void print_age(void)
{
	printf("age: %d\n", age);
}
