BITS 64

section .text
    global strstr

    strstr:
        cmp byte [rsi], 0    ; Compare le premier caractère de la sous-chaîne (rsi) avec 0
        jz found             ; Si c'est le cas (sous-chaîne vide), saute à l'étiquette 'found'
        cmp byte [rdi], 0    ; Compare le premier caractère de la chaîne principale (rdi) avec 0
        jz not_found         ; Si c'est le cas (chaîne principale vide), saute à l'étiquette 'not_found'

    loop:
        mov rcx, rsi         ; Initialise rcx avec l'adresse de la sous-chaîne (rsi)
        mov rdx, rdi         ; Initialise rdx avec l'adresse de la chaîne principale (rdi)

    search:
        cmp byte [rcx], 0    ; Compare l'octet à l'adresse rcx avec 0 (fin de la sous-chaîne)
        je found
        cmp byte [rdx], 0    ; Compare l'octet à l'adresse rdx avec 0 (fin de la chaîne principale)
        je not_found
        mov al, byte [rcx]   ; Charge l'octet de la sous-chaîne dans le registre al
        cmp al, byte [rdx]   ; Compare l'octet de la sous-chaîne avec l'octet correspondant de la chaîne principale
        jne next_char
        inc rcx
        inc rdx
        jmp search

    next_char:
        inc rdi
        mov rdx, rdi
        mov rcx, rsi
        jmp loop

    found:
        mov rax, rdi        ; Place l'adresse de la première occurrence de la sous-chaîne dans rax
        ret

    not_found:
        xor rax, rax        ; Affecte 0 à rax pour indiquer qu'aucune sous-chaîne n'a été trouvée
        ret
