BITS 64

section .text
    global strlen

    strlen:
        xor rcx, rcx

    loop:
        cmp BYTE [rdi + rcx], 0
        je out
        inc rcx
        jmp loop

    out:
        ret
