BITS 64
%define EI_NIDENT 16
%define SYSTEM_V_ABI 0
%define ET_EXEC 2
%define AMD_X64 0x3E
%define ELF_64 2
%define LITTLE_ENDIAN 1
%define ELF_HEADER_SIZE 0x40
%define PROGRAM_HEADER_ENTRY_SIZE 0x38
%define PROGRAM_HEADER_ENTRIES 0x1
%define SECTION_HEADER_ENTRY_SIZE 0x40
%define SECTION_HEADER_ENTRIES 0x4
%define PT_LOAD 1
%define CODE_VADDR_2 0x08048054
%define CODE_VADDR 0x401020
%define RODATA_VADDR 0x402000
%define PF_R 0x4
%define PF_X 0x1
%define SHF_ALLOC 0x2
%define SHF_EXECINSTR 0x4
%define STR_TABLE_INDEX 0x3
%define SHT_STRTAB 0x3
%define SHT_PROGBITS 0x1
%define SHT_NULL 0


db 0x7F, "ELF"                ; e_ident_MAGIC        
db ELF_64                     ; e_ident_EI_CLASS
db LITTLE_ENDIAN              ; e_ident_EI_DATA
db 1                          ; e_ident_EI_VERSION
db SYSTEM_V_ABI               ; e_ident_EI_OSABI
db 0                          ; e_ident_EI_ABIVERSION
times EI_NIDENT - ($-$$) db 0 ; padding
dw ET_EXEC                    ; e_type
dw AMD_X64                    ; e_machine
dd 1                          ; e_version
dq CODE_VADDR_2               ; e_entry
dq programe_headers           ; e_phoff
dq section_headers            ; e_shoff
dd 0                          ; e_flags
dw ELF_HEADER_SIZE            ; e_ehsize
dw PROGRAM_HEADER_ENTRY_SIZE  ; e_phentsize
dw PROGRAM_HEADER_ENTRIES     ; e_phnum
dw SECTION_HEADER_ENTRY_SIZE  ; e_shentsize
dw SECTION_HEADER_ENTRIES     ; e_shnum
dw STR_TABLE_INDEX            ; e_shstrndx
programe_headers:
    p_type:
    dd PT_LOAD
    p_flags:
    dd PF_R | PF_X
    p_offset:
    dq code
    p_vaddr:
    dq CODE_VADDR_2
    p_paddr:
    dq 0
    p_filesz:
    dq rodata - code
    p_memsz:
    dq rodata - code
    p_align:
    dq 0x1000
code:
    mov     eax, 0x3c
    xor     edi, edi
    syscall
rodata:
    db "Hello world!", 0
section_names:
    db 0,
str_shstrtab:
    db ".shstrtab", 0,
str_text:
    db ".text", 0, 
str_rodata:
    db ".rodata", 0
section_headers:
    ; null section
    dd SHT_NULL
    dd 0
    times SECTION_HEADER_ENTRY_SIZE - 0x8 db 0
    ; .text
    dd str_text - section_names   ;sh_name
    dd SHT_PROGBITS               ;sh_type
    dq SHF_ALLOC | SHF_EXECINSTR  ;sh_flags
    dq CODE_VADDR                 ;sh_addr
    dq code                       ;sh_offset
    dq rodata - code              ;sh_size
    dd 0                          ;sh_link
    dd 0                          ;sh_info
    dq 0x10                       ;sh_addralign
    dq 0                          ;sh_entsize
    ; .rodata
    dd str_rodata - section_names ;sh_name
    dd SHT_PROGBITS               ;sh_type
    dq SHF_ALLOC                  ;sh_flags
    dq RODATA_VADDR               ;sh_addr
    dq rodata                     ;sh_offset
    dq section_names - rodata     ;sh_size
    dd 0                          ;sh_link
    dd 0                          ;sh_info
    dq 0x8                        ;sh_addralign
    dq section_names - rodata     ;sh_entsize
    ; .shstrtab
    dd str_shstrtab - section_names
    dd SHT_STRTAB
    dq 0
    dq 0
    dq section_names
    dq section_headers - section_names
    dd 0                          ;sh_link
    dd 0                          ;sh_info
    dq 0x1                        ;sh_addralign
    dq 0                          ;sh_entsize



