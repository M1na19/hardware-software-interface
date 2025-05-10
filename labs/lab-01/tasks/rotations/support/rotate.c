// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "rotate.h"

void rotate_left(unsigned int *number, int bits)
{
	unsigned int mask= (1<<bits) - 1;
	mask <<= (sizeof(*number)*8 - bits);
	unsigned int saved_bits= (*number & mask) >> (sizeof(*number)*8 - bits);
	*number= (*number << bits) | saved_bits;
}

void rotate_right(unsigned int *number, int bits)
{
	unsigned int mask= (1<<bits) - 1;
	unsigned int saved_bits= *number & mask;
	*number= (*number >> bits) | (saved_bits << (sizeof(*number)*8-bits));
}
