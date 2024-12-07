BITS 64

section .text
    global strpbrk

    strpbrk:
        mov rcx, rsi         ; Initialise rcx avec l'adresse de la chaîne de caractères donnée
        cmp byte [rdi], 0    ; Compare le premier caractère de la chaîne principale (rdi) avec 0
        je out               ; Saute à l'étiquette 'out' si c'est le cas (chaîne vide)

    loop:
        mov al, byte [rdi]   ; Charge l'octet à l'adresse rdi dans le registre al
        test al, al          
        jz out
        mov rcx, rsi         ; Réinitialise rcx avec l'adresse de la chaîne donnée (rsi)

    inner_loop:
        mov dl, byte [rcx]   ; Charge l'octet à l'adresse rcx dans le registre dl
        test dl, dl
        jz next_char
        cmp al, dl           ; Compare l'octet de la chaîne principale avec l'octet de la chaîne donnée
        je found
        inc rcx
        jmp inner_loop

    found:
        mov rax, rdi
        ret

    next_char:
        inc rdi
        jmp loop

    out:
        xor rax, rax
        ret
