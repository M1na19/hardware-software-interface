// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "delete_first.h"

char *delete_first(char *s, char *pattern)
{
	char * res=malloc(strlen(s)* sizeof(char));
	int i,k=0;
	for(i = 0;i<strlen(s)-strlen(pattern);i++){
		int isPattern=1;
		for(int j = 0;j<strlen(pattern) && isPattern;j++){
			if(s[i+j]!=pattern[j]){
				res[k++]=s[i];
				isPattern=0;
			}			
		}
		if(isPattern){
			i+=strlen(pattern);
			break;
		}
	}
	for(int j = i;j<strlen(s);j++){
		res[k++]=s[j];
	}
	return res;
}
