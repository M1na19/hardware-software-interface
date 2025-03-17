// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "binary_search.h"

int binary_search(int *v, int len, int dest)
{
	int start = 0;
	int end = len - 1;
bsearch:
	if (start > end)
		goto exit;
	int middle = (start + end) / 2;
	if (v[middle] == dest)
		goto found;
	if (v[middle] > dest)
		goto to_left;
	if (v[middle] <= dest)
		goto to_right;
to_left:
	end = middle - 1;
	goto bsearch;
to_right:
	start = middle + 1;
	goto bsearch;
found:
	return middle;
exit:
	return -1;
}
