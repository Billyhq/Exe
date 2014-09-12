#include <stdio.h>
typedef struct {
	unsigned int a;
	unsigned int b;
	unsigned int *ptr;
}TestStrT;

void main()
{
    unsigned int table[5] = {0x00, 0x01, 0x02, 0x03, 0x04};
    TestStrT *TestStr = (TestStrT*)table;
    
    printf("a = %d, b = %d, ptr = %d\n", TestStr->a, TestStr->b, TestStr->ptr[0]);
    
    return;
}
