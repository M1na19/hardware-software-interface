// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <time.h>

#include "pixel.h"
#include "pixels.h"
#define GET_PIXEL(a, i ,j) (*(*((a) + (i)) + (j)))
#define GET_PIXEL_ROW(a,i) (*((a)+(i)))
void reverse_pic(struct picture *pic)
{
	for(int i=0;i<pic->height/2;i++){
		struct Pixel* aux=GET_PIXEL_ROW(pic->pix_array,i);
		GET_PIXEL_ROW(pic->pix_array,i)=GET_PIXEL_ROW(pic->pix_array,pic->height-i-1);
		GET_PIXEL_ROW(pic->pix_array,pic->height-i-1)=aux;
	}
}

void color_to_gray(struct picture *pic)
{
	for(int i=0;i<pic->height;i++){
		for(int j=0;j<pic->width;j++){
			GET_PIXEL(pic->pix_array,i,j).R=GET_PIXEL(pic->pix_array,i,j).R * 0.3;
			GET_PIXEL(pic->pix_array,i,j).G=GET_PIXEL(pic->pix_array,i,j).G * 0.59;
			GET_PIXEL(pic->pix_array,i,j).B=GET_PIXEL(pic->pix_array,i,j).B * 0.11;
		}
	}
}
