BITS 64

section .text
    global strcmp

    strcmp:
        xor rax, rax
        
    loop:
        mov al, byte [rdi]    ; Charge l'octet à l'adresse rdi dans le registre al
        mov dl, byte [rsi]    ; Charge l'octet à l'adresse rsi dans le registre dl
        cmp al, dl
        jne out
        test al, al           ; Teste si al est nul (fin de chaîne)
        jz out
        inc rdi
        inc rsi
        jmp loop

    out:
        sub rax, rdx
        ret
