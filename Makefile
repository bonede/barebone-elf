barebone: barebone.nasm
	nasm -o barebone -f bin barebone.nasm
	chmod u+x barebone

32: barebone32.nasm
	nasm -o barebone32 -f bin barebone32.nasm
	chmod u+x barebone32

64: barebone64.nasm
	nasm -o barebone64 -f bin barebone64.nasm
	chmod u+x barebone64

min64: min64.nasm
	nasm -o min64 -f bin min64.nasm
	chmod u+x min64

raw: raw.dump makeraw.sh
	./makeraw.sh

clean:
	rm barebone barebone32 barebone64 raw min64 sample 64
sample: sample.c
	gcc -no-pie -o sample sample.c