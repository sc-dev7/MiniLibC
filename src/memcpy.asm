BITS 64

section .text
    global memcpy

    memcpy:
        mov rdi, rdi    ; Déplace l'adresse de la source dans le registre
        mov rsi, rsi    ; Déplace l'adresse de destination
        mov rdx, rdx    ; Déplace la longueur de la zone mémoire à copier
        test rdx, rdx   ; Teste si la longueur à copier est nulle
        jz out
        mov rcx, rdx    ; Déplace la longueur dans le registre rcx (utilisé pour le comptage lors de la répétition)
        rep movsb       ; movsb copie octet par octet de rsi vers rdi rcx fois

    out:
        ret
