
rm -f app
gcc -Wall -O3 lab-11_clua_krivosheev.c -o app -llua5.3 -lm -I/usr/include/lua5.3
./app
