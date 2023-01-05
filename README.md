# Bare bone elf - A Linux ELF file in pure assembly that prints 'Hello world!'

## How to build
```console
$ nasm -o barebone -f bin barebone.nasm
$ ./barebone
$ hexdump -C barebone
```
## Refs
* ELF format https://upload.wikimedia.org/wikipedia/commons/e/e4/ELF_Executable_and_Linkable_Format_diagram_by_Ange_Albertini.png