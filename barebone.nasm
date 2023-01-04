%define EI_NIDENT 16
%define SYSTEM_V_ABI 0
%define ET_EXEC 2
%define AMD_X64 0x3E
%define ELF_64 2
%define LITTLE_ENDIAN 1
e_ident_MAGIC:
db 0x7F, "ELF"
e_ident_EI_CLASS:
db ELF_64
e_ident_EI_DATA:
db LITTLE_ENDIAN
e_ident_EI_VERSION:
db 1
e_ident_EI_OSABI:
db SYSTEM_V_ABI
e_ident_EI_ABIVERSION:
db 0
e_id_EI_PAD:
times EI_NIDENT - ($-$$) db 0
e_type:
dw ET_EXEC
e_machine:
dw AMD_X64
e_version:
dd 1
e_entry:
dq 2
e_phoff:
dq 0
e_shoff:
dq 0
e_flags:
dd 0
e_ehsize:
dw 0
e_phentsize:
dw 0
e_phnum:
dw 0
e_shentsize:
dw 0
e_shnum:
dw 0
e_shstrndx:
dw 0


