// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mirror.h"

void mirror(char *s)
{
	int len=strlen(s);
	for(int i=0;i<len/2;i++){
		*(s+i)^=*(s+len-i-1);
		*(s+len-i-1)^=*(s+i);
		*(s+i)^=*(s+len-i-1);
	}
}
