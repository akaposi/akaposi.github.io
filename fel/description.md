Az alábbi programot szedd szét 4 fájlra: egy `main.c`-re, amiben csak
a `main` függvény van, egy `square.h`-ra, amiben a `square` függvény
deklarációja van, `square.c`-re, amiben a `square` függvény
implementációja van, és `cube.h`-ra, amiben a `cube` előfordítói
direktíva van. A `main.c`-nek include-olnia kell majd két fájlt is.

~~~~~
#include <stdio.h>

#define cube(x) (x*x*x)

int square(int x) {
  return x*x;
}

int main(void) {
  int i;
  for (i = 0; i <= 30; ++i)
    printf("%4d %10d %10d\n", i, square(i), cube(i));
  return 0;
}
~~~~~

Az így kapott programot le kell tudnod fordítani az alábbi parancsokkal error és warning nélkül:

~~~~
gcc -ansi -pedantic -Wall -W -c main.c
gcc -ansi -pedantic -Wall -W -c square.c
gcc -ansi -pedantic -Wall -W main.o square.o
~~~~

A kapott `a.out` futtatható állománynak pontosan ugyanazt a kimenetet kell adnia, mint a fenti programnak.

A megoldásodat egy zip (nem gz, nem 7z vagy hasonló) fájlban töltsd
fel, a zip fájlban legyenek bent a `main.c`, `fib.h` és egy `fib.c`
fájlok a gyökérben (ne legyenek alkönyvtárak a zip fájlban). Linuxban
a következő paranccsal tudod tömöríteni a megoldásodat:

~~~~
zip megoldas main.c square.h square.c cube.h
~~~~

A megoldásod automatikusan tesztelve lesz.
