BITS 32

%define EI_NIDENT 16
%define SYSTEM_V_ABI 0
%define ET_EXEC 2
%define AMD_X64 0x3E
%define X86 3
%define ELF_64 2
%define ELF_32 1
%define LITTLE_ENDIAN 1
%define ELF_HEADER_SIZE 0x34
%define PROGRAM_HEADER_ENTRY_SIZE 0x20
%define PROGRAM_HEADER_ENTRIES 0x1
%define SECTION_HEADER_ENTRY_SIZE 0x28
%define SECTION_HEADER_ENTRIES 0
%define PT_LOAD 1
%define PF_R 0x4
%define PF_X 0x1
%define SHF_ALLOC 0x2
%define SHF_EXECINSTR 0x4
%define STR_TABLE_INDEX 0
%define SHT_STRTAB 0x3
%define SHT_PROGBITS 0x1
%define SHT_NULL 0


%define BASE_ADDR 0x08048000

db 0x7F, "ELF"                ; e_ident_MAGIC        
db ELF_32                     ; e_ident_EI_CLASS
db LITTLE_ENDIAN              ; e_ident_EI_DATA
db 1                          ; e_ident_EI_VERSION
db SYSTEM_V_ABI               ; e_ident_EI_OSABI
db 0                          ; e_ident_EI_ABIVERSION
times EI_NIDENT - ($-$$) db 0 ; padding to 16 bytes
dw ET_EXEC                    ; e_type
dw X86                        ; e_machine
dd 1                          ; e_version
dd BASE_ADDR + code           ; e_entry
dd programe_headers           ; e_phoff
dd 0                          ; e_shoff
dd 0                          ; e_flags
dw ELF_HEADER_SIZE            ; e_ehsize
dw PROGRAM_HEADER_ENTRY_SIZE  ; e_phentsize
dw PROGRAM_HEADER_ENTRIES     ; e_phnum
dw SECTION_HEADER_ENTRY_SIZE  ; e_shentsize
dw SECTION_HEADER_ENTRIES     ; e_shnum
dw STR_TABLE_INDEX            ; e_shstrndx

programe_headers:
    dd PT_LOAD                ; p_type
    dd code                   ; p_offset
    dd BASE_ADDR + code       ; p_vaddr. Add `code` address to meet kernel requires:
                              ; (offset % pagesize) == (addr % pagesize). Fail to do this,
                              ; kernel will reject to load this elf file.
    dd 0                      ; p_paddr
    dd code_size              ; p_filesz
    dd code_size              ; p_memsz
    dd PF_R | PF_X            ; p_flags
    dd 0x1000                 ; p_align

code:
    mov eax, 1                ; exit
    mov ebx, 42               ; 42
    int 0x80                  ; interupt

code_size equ $ - code