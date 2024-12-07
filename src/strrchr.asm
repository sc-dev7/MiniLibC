BITS 64

section .text
    global strrchr

    strrchr:
        mov rcx, 0
        mov rax, 0

    loop:
        cmp BYTE [rdi + rcx], 0      ; Compare l'octet à l'adresse (rdi + rcx) avec 0 (fin de la chaîne)
        je loop_set
        inc rcx
        jmp loop

    loop_set:
        cmp BYTE [rdi + rcx], sil    ; Compare l'octet à l'adresse (rdi + rcx) avec le caractère recherché (sil)
        je out
        dec rcx
        jmp loop_set

    out:
        lea rax, [rdi + rcx]          ; Charge l'adresse de l'octet trouvé dans rax
        ret
