section .text
global reverse
; rdi: str (char *)
reverse:
    mov rsi, rdi

    ; Find the end of the null-terminated string
    xor al, al
    mov ecx, -1 ; or xor ecx, ecx ; not ecx
    repnz scasb
    sub rdi, 2

    .loop:
        ; Swap memories
        mov cl, byte [rsi]
        mov dl, byte [rdi]
        mov byte [rdi], cl
        mov byte [rsi], dl

        ; Swap memories (but slower than the variant with 4 mov because of implicit LOCK with xchg)
        ; mov  cl, byte [rsi]
        ; xchg cl, byte [rdi]
        ; mov  byte [rsi], cl

        ; Move both pointers closer to eachother
        inc rsi
        dec rdi

        ; Did we reach the middle?
        cmp rdi, rsi
            jg .loop

    .end:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
