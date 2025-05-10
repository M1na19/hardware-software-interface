// SPDX-License-Identifier: BSD-3-Clause

#include <stddef.h>

#include "pointers.h"

int my_strcmp(const char *s1, const char *s2)
{
	for(int i=0;i<=strlen(s1) && i<=strlen(s2);i++){
		if(*(s1+i)!=*(s2+i)){
			return *(s1+i) - *(s2+i) > 0? 1:-1;
		}
	}
	return 0;
}

void *my_memcpy(void *dest, const void *src, size_t n)
{
	char* buffer= malloc(n * sizeof(char));
	for(int i=0;i<n;i++){
		*(buffer+i)=*((char*)src+i);
	}
	for(int i=0;i<n;i++){
		char* d= ((char*)dest + i);
		*d=*(buffer+i);
	}
	return dest;
}

char *my_strcpy(char *dest, const char *src)
{
	int i;
	for(i=0;*(src+i)!='\0';i++){
		*(dest+i)=*(src+i);
	}
	*(dest+i)='\0';
	return dest;
}
