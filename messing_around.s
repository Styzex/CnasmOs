start:
  [org 0x7c00]
  mov ah, 0x0e ; function number = 0Eh : Write/Display character in TTY mode (provided by the video service interrupt)
  mov al, 'H'
  int 0x10 ; int - is the interrupt instruction (calls the interrupt handler)
  ; int basically tells the cpu to stop whatever it's doing and do a different
  ; specified thing instead based off of the number in this case 0x10 and after
  ; that it returns back to what it was doing before
  mov al, 'e'
  int 0x10
  mov al, 'l'
  int 0x10
  int 0x10
  mov al, 'o'
  int 0x10
  mov al, ' '
  int 0x10
  mov al, ''


  ; !!!
  ; you tell the pc the literal location of where the value of data is
  ; in the compiled version of this file which is everything you see rn
  ; but in a format that the pc can read
  ; !!!
  mov bx, data  ; stores the pointer to where data is in this file into bx
  add bx, 0x7c00  ; adds bios offset to bx (the pointer stored in bx)
  mov al, [bx]  ; put the value of the bx register into the al register
  int 0x10  ; tells the bios to print out the data that's stored inside of al


hang:
  jmp $

data:
  db ":"

times 510-($-$$) db 0
dw 0xaa55 
