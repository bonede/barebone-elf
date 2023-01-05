barebone: barebone.nasm
	nasm -o barebone -f bin barebone.nasm
	chmod u+x barebone

32: barebone32.nasm
	nasm -o barebone32 -f bin barebone32.nasm
	chmod u+x barebone32

64: barebone64.nasm
	nasm -o barebone64 -f bin barebone64.nasm
	chmod u+x barebone64

clean:
	rm barebone

dump: barebone
	hexdump -C barebone

header: barebone
	readelf -h barebone