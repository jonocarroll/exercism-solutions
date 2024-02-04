section .text
global to_rna
to_rna:
  mov dl, byte[rdi]             ; copy the first char at rdi to a temporary register
  cmp dl, 0                     ; if the input is empty, return immediately
  je end
  cmp dl, 'C'                   ; if the char is 'C' set this element of rsi to 'G'
  je G
  cmp dl, 'G'
  je C
  cmp dl, 'A'
  je U
  cmp dl, 'T'
  je A
  mov byte[rsi], dl             ; by now, rsi and rdi have been incremented
  jmp next_char

C:
  mov byte[rsi],  'C'
  jmp next_char

G:
  mov byte[rsi], 'G'
  jmp next_char

U:
  mov byte[rsi], 'U'
  jmp next_char

A:
  mov byte[rsi], 'A'
  jmp next_char

next_char:
  inc rsi
  inc rdi
  jmp to_rna

end:
  mov byte[rsi], 0              ; append null terminator
  ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
