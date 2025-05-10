// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "vector_max.h"

int vector_max(int *v, int len)
{
	int max = v[0];
	unsigned int i = 1;
loop_start:
	if (v[i] > max)
		goto change_max;
increase:
	i++;
	if (i < len)
		goto loop_start;
	goto end_loop;
change_max:
	max = v[i];
	goto increase;
end_loop:
	return max;
}
