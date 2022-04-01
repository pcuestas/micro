#include <stdio.h>

extern int OddPositive(int);
extern int DigitComputation(unsigned int , unsigned int );
extern unsigned int NextPrime(unsigned int);

void check_OddPositive()
{
    int n;
    int ret;

    printf("Check OddPositive...\n");

    printf("Input a number: ");
    scanf("%d", &n);
    ret = OddPositive(n);
    printf("The number %d is %s.\n\n", n, (ret ? "odd" : "even or negative"));
}

void check_DigitComputation()
{
    unsigned int num;
    unsigned int pos;
    int ret;
    
    printf("Check DigitComputation...\n");

    printf("Input a number: ");
    scanf("%u", &num);
    printf("Input a position: ");
    scanf("%u", &pos);
    ret = DigitComputation(num, pos);
    printf("The digit %u of the number %u is %d.\n\n", pos, num, ret);
}

void check_NextPrime()
{
    unsigned int n;
    unsigned int ret;

    printf("Check NextPrime...\n");

    printf("Input a number: ");
    scanf("%u", &n);
    ret = NextPrime(n);
    printf("The next prime after %u is %u.\n\n", n, ret);
}

int main()
{

    //check_OddPositive();
    //check_DigitComputation();
    check_NextPrime();

    return 0;
}