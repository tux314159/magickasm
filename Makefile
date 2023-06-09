all : vmagick/vmagick test

test : $(patsubst %.ma,%.mao,$(shell find -name '*\.ma'))

%.mao : %.ma vmagick/vmagick
	magicc/magicc.py -o $@ $<

vmagick/vmagick : vmagick/vmagick.c vmagick/dynstr.c
	gcc -march=native -mtune=native -flto -fno-unroll-loops -O3 -Wall -o $@ -g $^
