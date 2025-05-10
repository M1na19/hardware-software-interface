// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>

#include "odd_even.h"

int main(void)
{
	int x[5]= {1, 2, 3, 4, 5};
	check_parity(x, 5);
	return 0;
}
