section .text
global square
square:
  cmp rdi, 0
  jle fail
  mov rax, 1                    ; start with 1 grain
  dec rdi                       ; take 1 less than the input number
  cmp rdi, 0
  je end
  mov rcx, rdi

shift_loop:
  shl rax, 1                    ; additional shifts
  dec rcx
  jnz shift_loop                ; repeat until rcx is zero

end:
  ret

fail:
  mov rax, 0
  ret

global total
total:
  mov rax, 1                    ; grains - start with 1
  mov rcx, 0                    ; squares

square_loop:
  mov r8, 2                     ; base of the exponent
  shl r8, cl                    ; compute 2^rcx
  add rax, r8                   ; add to grains
  inc rcx
  cmp rcx, 64                   ; loop if not up to 64 squares yet
  jne square_loop
  ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
