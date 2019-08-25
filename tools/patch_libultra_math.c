#include <stdio.h>

int main(int argc, char **argv)
{
    FILE *f = fopen(argv[1], "r+");
    fseek(f, 0x24, SEEK_SET);
    char byte = 0x10;
    fwrite(&byte, sizeof(char), 1, f);
    fclose(f);
}
