// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "iterate.h"
#include "array.h"

void print_chars(void)
{
	unsigned char* it=&v;
	for(int i=0;i<sizeof(v)/sizeof(unsigned char);i++){
		printf("%p -> 0x%x\n", it + i, *(it+i));
	}
	printf("-------------------------------\n");

}

void print_shorts(void)
{
	unsigned short* it=&v;
	for(int i=0;i<sizeof(v)/sizeof(unsigned short);i++){
		printf("%p -> 0x%x\n", it+i,*(it+i));
	}
	printf("-------------------------------\n");
}

void print_ints(void)
{
	unsigned int* it=&v;
	for(int i=0;i<sizeof(v)/sizeof(unsigned int);i++){
		printf("%p -> 0x%x\n", it+i, *(it+i));
	}

	printf("-------------------------------\n");
}
