BITS 64

section .text
    global strncmp

    strncmp:
        xor rax, rax
        mov rcx, rdx    ; Initialise rcx avec la longueur de la comparaison

    loop:
        cmp rcx, 0
        je out
        mov al, byte [rdi]    ; Charge l'octet à l'adresse rdi dans le registre al
        mov dl, byte [rsi]    ; Charge l'octet à l'adresse rsi dans le registre dl
        cmp al, dl            ; Compare les octets chargés
        jne not_equal         ; Saute à l'étiquette 'not_equal' si les octets sont différents
        test al, al
        jz out
        inc rdi
        inc rsi
        dec rcx 
        jmp loop  

    not_equal:
        mov rax, 1        
        ret

    out:
        xor rax, rax
        ret
