sound-test:
	rm -f *.o
	rm -f apu-tests.gb
	rgbasm -o main.o main.asm
	rgblink -o apu-tests.gb main.o
	rgbfix -v -p 0 apu-tests.gb