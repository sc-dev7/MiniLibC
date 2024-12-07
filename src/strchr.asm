BITS 64

section .text
    global strchr

    strchr:
        mov rcx, 0

    loop:
        cmp BYTE [rdi + rcx], 0      ; Compare l'octet à l'adresse (rdi + rcx) avec 0 (fin de la chaîne)
        je out
        cmp BYTE [rdi + rcx], sil    ; Compare l'octet à l'adresse (rdi + rcx) avec le caractère recherché (sil
        je out
        inc rcx
        jmp loop

    out:
        lea rax, [rdi + rcx]         ; Charge l'adresse de l'octet trouvé dans rax
        ret
