barebone: barebone.nasm
	nasm -o barebone -f bin barebone.nasm
	chmod u+x barebone

clean:
	rm barebone

dump: barebone
	hexdump -C barebone

header: barebone
	readelf -h barebone