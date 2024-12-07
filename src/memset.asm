BITS 64

section .text
    global memset

    memset:
        mov rdi, rdi    ; Place l'adresse de destination
        mov rax, rsi    ; Place la valeur à écrire
        mov rcx, rdx    ; Place la longueur
        rep stosb       ; stosb (stockage d'un octet) rcx fois
        ret
