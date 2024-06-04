#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto x_is_not_medium;
    if (x >= 1000) goto x_is_not_medium;
x_is_medium:
        printf("medium\n");
        goto x_end_if;
x_is_not_medium:
        printf("small/big\n");
x_end_if:
}