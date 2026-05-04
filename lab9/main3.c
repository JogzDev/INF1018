#include <stdio.h>
void foo(int a[], int n);
int main(void) {
    int v[] = {1, 2, 0, 3, 4, 0, 5};
    int n = 7;
    foo(v, n);
    for (int i = 0; i < n; i++) {
        printf("%d ", v[i]);
    }
    printf("\n");
    return 0;
}
