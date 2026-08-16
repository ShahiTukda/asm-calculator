all: calculator

atoi.o: src/atoi.s
	as -o atoi.o src/atoi.s

itoa.o: src/itoa.s
	as -o itoa.o src/itoa.s

main.o: src/main.s
	as -o main.o src/main.s

calculator: atoi.o itoa.o main.o
	ld -o calculator atoi.o itoa.o main.o

clean:
	rm -f *.o calculator
