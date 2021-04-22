// LaToya McIntyre
// CS 270
// HW 5

#include <stdio.h>
#include <math.h>
#include <string.h>
#include "hex2dex.h"

int main(){

	int total = totalD("dab");
        printf("\nTest hexadecimal number: 'dab' ");
        printf("\nExpected result: 3499 ");
        printf("\nThe number in decimal: %d\n", total);

	
    	total = totalD("cab");
 	printf("\nTest hexadecimal number: 'cab' ");
        printf("\nExpected result: 3242");
        printf("\n The number in decimal: %d\n", total);

	total = totalD("cat");    
	printf("\nTest hexadecimal number: 'cat' ");
        printf("\nExpected result: Invalid Entry ");
       // printf("\n The number in decimal: %d\n", total);

	total = totalD("dabbb");    
	printf("\nTest hexadecimal number: 'dabbb' ");
        printf("\nExpected result: 895931");
        printf("\n The number in decimal: %d\n", totalD("dabbb"));
    
  return 0;
}
  
