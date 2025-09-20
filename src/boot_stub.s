[org 0x7c00]

start:
  call load_kernel
  jmp $

load_kernel:
  mov ah, 0x02
  mov al, 1
  mov ch, 0
  mov cl, 2 ; read kernel sector
  mov dh, 0
  mov dl, 0x00
  mov bx, 0x7e00
  ;mov ax, 0
  ;mov es, ax
  int 0x13
  jmp 0x0000:0x7e00

setup_pm:
  cli
  lgdt [gdtr]

times 510-($-$$) db 0
dw 0xaa55
