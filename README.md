# Bare bone elf - A 64-bit Linux linker free ELF file in pure assembly that prints 'Hello world!'

## How to build
```console
$ make helloworld && ./helloworld
# other goodies
$ make 64 && ./barebone64  # exit with 42
$ echo $?
$ make 32 && ./barebone32  # exit with 42 (32-bit version)
$ echo $?
$ make min64 && ./min64    # exit with 42 (64-bit minimal version)
$ echo $?
$ make raw && ./raw        # exit with 42 (hardcore binary version)
$ echo $?

```
## Refs
* ELF format https://upload.wikimedia.org/wikipedia/commons/e/e4/ELF_Executable_and_Linkable_Format_diagram_by_Ange_Albertini.png