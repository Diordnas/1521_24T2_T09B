#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x > 100 && x < 1000) {
        printf("medium\n");
        goto if_end
    } else {
        printf("small/big\n");
    }

if_end:
}