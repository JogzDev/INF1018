#include <stdio.h>

unsigned char switch_byte(unsigned char x) {
    return ((x & 0x0F) << 4) | ((x & 0xF0) >> 4);
}

unsigned char rotate_left(unsigned char x, int n) {
    return (x << n) | (x >> (8 - n));
}

int main(void) {
    printf("switch_byte(0xAB) = 0x%02X\n", switch_byte(0xAB));

    printf("rotate_left(0x61, 1) = 0x%02X\n", rotate_left(0x61, 1));
    printf("rotate_left(0x61, 2) = 0x%02X\n", rotate_left(0x61, 2));
    printf("rotate_left(0x61, 7) = 0x%02X\n", rotate_left(0x61, 7));
    return 0;
}