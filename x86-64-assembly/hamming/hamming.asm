section .text
global distance

distance:
  mov rax, 0                   ; Initialize the counter to 0

  mov dl, byte [rdi]           ; Copy the first char at rdi to a temporary register
  mov dh, byte [rsi]           ; Copy the first char at rsi to a temporary register
  cmp dl, 0                    ; If the input is empty, return 0 immediately
  je end

compare_loop:
  cmp dl, dh                   ; Compare chars
  jne increment_counter        ; If they are different, increment rax

next_char:
  inc rsi
  inc rdi
  mov dl, byte [rdi]           ; Move to the next character in the loop
  mov dh, byte [rsi]
  cmp dl, 0                    ; Check if the end of the string is reached
  jne compare_loop             ; If not, continue the loop

end:
  cmp dh, 0
  jne fail
  ret

increment_counter:
  inc rax                       ; If they are different, increment rax
  jmp next_char                 ; Then go to the next char

fail:
  mov rax, -1
  ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
