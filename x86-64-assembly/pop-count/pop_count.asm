default rel

section .text
global egg_count
egg_count:
  mov rax, 0                  ; set counter to 0

loop:
  cmp rdi, 0                    ; rdi = first argument, compare with 0
  jz end                        ; if the input is 0, end with whatever value of rax is current
  shr rdi, 1                    ; right shift the input (divide by 2, effectively shifting the bits to the right). Carry Flag CF contains the last bit shifted out
  jae loop                      ; jump short if CF = 0
  inc rax                       ; if CF is not 0, we shifted out a 1, so increment counter
  jmp loop                      ; restart loop

end:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
