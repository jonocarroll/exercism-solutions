section .text
global reverse
reverse:
  mov rsi, rdi                  ; save the start address

  xor al, al                    ; lowest 8 bits of rax, zeroed
  mov ecx, -1
  repnz scasb                   ; scan string until ZF=1 (end)
  dec rdi                       ; decrement rdi twice to get to the address of the last char
  dec rdi                       ; (not including null terminator)

loop:
                                ; consider example: "birds"
  mov al, [rsi]                 ; move char at start into al (al=b)
  mov ah, [rdi]                 ; move char at end into ah (ah=s)
  mov [rdi], al                 ; move char in al into end (birdb)
  mov [rsi], ah                 ; move char in ah into start (sirdb)
  dec rdi                       ; decrement address of end
  inc rsi                       ; increment address of start
  cmp rdi, rsi                  ; compare end vs start
  jg loop                       ; continue to loop if not past middle letter
                                ; iteration 2: al=i, ah=d; sirib, sdrib
                                ; iteration 3: al=r, ah=r; sdrib, sdirb
                                ; iteration 4: rdi < rsi so end
end:
  ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
