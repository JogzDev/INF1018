#include <stdio.h>

int main (void) {
  unsigned int x = 0xffffffff;
  unsigned int y = 2;
  printf("x=%d, y=%d\n", x, y);
  printf("x e menor do que y? %s\n", (x<y)?"sim":"nao");
  return 0;
}
