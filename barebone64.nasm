BITS 64
%define EI_NIDENT 16
%define SYSTEM_V_ABI 0
%define ET_EXEC 2
%define AMD_X64 0x3E
%define X86 3
%define ELF_64 2
%define ELF_32 1
%define LITTLE_ENDIAN 1
%define ELF_HEADER_SIZE 0x40
%define PROGRAM_HEADER_ENTRY_SIZE 0x38
%define PROGRAM_HEADER_ENTRIES 0x1
%define SECTION_HEADER_ENTRY_SIZE 0
;%define SECTION_HEADER_ENTRIES 0x4
%define SECTION_HEADER_ENTRIES 0
%define PT_LOAD 1
%define CODE_VADDR 0x8048000
%define PF_R 0x4
%define PF_X 0x1
%define SHF_ALLOC 0x2
%define SHF_EXECINSTR 0x4
;%define STR_TABLE_INDEX 0x3
%define STR_TABLE_INDEX 0
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
dq CODE_VADDR + code                 ; e_entry
dq programe_headers           ; e_phoff
;dq section_headers            ; e_shoff
dq 0                          ; e_shoff
dd 0                          ; e_flags
dw ELF_HEADER_SIZE            ; e_ehsize
dw PROGRAM_HEADER_ENTRY_SIZE  ; e_phentsize
dw PROGRAM_HEADER_ENTRIES     ; e_phnum
dw SECTION_HEADER_ENTRY_SIZE  ; e_shentsize
dw SECTION_HEADER_ENTRIES     ; e_shnum
dw STR_TABLE_INDEX            ; e_shstrndx
programe_headers:
    dd PT_LOAD                ; p_type
    dd PF_R | PF_X            ; p_flags
    dq 0                      ; p_offset
    dq CODE_VADDR             ; p_vaddr
    dq CODE_VADDR             ; p_paddr
    dq filesize               ; p_filesz
    dq filesize               ; p_memsz
    dq 0x1000                 ; p_align
code:
    mov edi,42       
    mov eax,60
    syscall
code_end:
filesize    equ     $ - $$