section .data
    a db 5               ; Визначаємо a = 5
    b db 3               ; Визначаємо b = 3
    c db 2               ; Визначаємо c = 2
    resultMsg db 'Result: ', 0  ; Визначення рядка для виведення результату

section .bss
    result resb 1        ; Результат операцій

section .text
global _start

_start:
    mov al, [b]          ; Завантажуємо b в al
    sub al, [c]          ; Віднімаємо c від al
    add al, [a]          ; Додаємо a до al
    add al, 30h          ; Перетворюємо число в ASCII символ

    mov [result], al     ; Сохраняем результат

    ; Виведення рядка "Result: "
    mov rax, 1           ; syscall: write
    mov rdi, 1           ; фaйл дескриптор 1 (stdout)
    lea rsi, [resultMsg] ; адреса рядка для виведення
    mov rdx, 8           ; довжина рядка (включаючи нульовий символ)
    syscall

    ; Виведення результату
    mov rax, 1           ; syscall: write
    mov rdi, 1           ; фaйл дескриптор 1 (stdout)
    lea rsi, [result]    ; адреса символу результату
    mov rdx, 1           ; кількість байтів для виведення
    syscall

    ; Завершення програми
    mov rax, 60          ; syscall: exit
    xor rdi, rdi         ; статус завершення 0
    syscall