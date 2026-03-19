#include <ctype.h>
#include <stdio.h>

int string2num(char *s, int base) {

    int a = 0;
    int digit;

    for (; *s; s++) {

        if (isdigit(*s))
            digit = *s - '0';
        else
            digit = *s - 'a' + 10;

        a = a * base + digit;
    }

    return a;
}

int main(void) {

    printf("%d\n", string2num("1a", 16));
    printf("%d\n", string2num("a09b", 16));
    printf("%d\n", string2num("z09b", 36));

    return 0;
}