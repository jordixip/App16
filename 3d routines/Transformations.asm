section .data
    ; Constantes para las matrices de transformación
    pi dq 3.14159265358979323846

section .text
global RotateX
global RotateY
global RotateZ
global Scale
global Translate

; Rotación alrededor del eje X
; void RotateX(float angle, float* matrix)
RotateX:
    ; Guardar registros
    push rbx
    push rsi
    push rdi

    ; Cargar los parámetros
    movss xmm0, [rcx]        ; angle
    mov rdi, rdx             ; matrix

    ; Calcular el seno y coseno del ángulo
    movaps xmm1, xmm0
    mulss xmm1, [pi]
    divss xmm1, [pi]
    call sin
    movss xmm2, xmm0
    call cos

    ; Construir la matriz de rotación
    movss [rdi], dword 1.0
    movss [rdi + 4], dword 0.0
    movss [rdi + 8], dword 0.0
    movss [rdi + 12], dword 0.0
    movss [rdi + 16], xmm2
    movss [rdi + 20], xmm1
    movss [rdi + 24], dword 0.0
    movss [rdi + 28], dword 0.0
    movss [rdi + 32], xmm1
    movss [rdi + 36], xmm2
    movss [rdi + 40], dword 0.0
    movss [rdi + 44], dword 0.0
    movss [rdi + 48], dword 0.0
    movss [rdi + 52], dword 0.0
    movss [rdi + 56], dword 1.0

    ; Restaurar registros y retornar
    pop rdi
    pop rsi
    pop rbx
    ret

; Rotación alrededor del eje Y
; void RotateY(float angle, float* matrix)
RotateY:
    ; Guardar registros
    push rbx
    push rsi
    push rdi

    ; Cargar los parámetros
    movss xmm0, [rcx]        ; angle
    mov rdi, rdx             ; matrix

    ; Calcular el seno y coseno del ángulo
    movaps xmm1, xmm0
    mulss xmm1, [pi]
    divss xmm1, [pi]
    call sin
    movss xmm2, xmm0
    call cos

    ; Construir la matriz de rotación
    movss [rdi], xmm2
    movss [rdi + 4], dword 0.0
    movss [rdi + 8], xmm1
    movss [rdi + 12], dword 0.0
    movss [rdi + 16], dword 0.0
    movss [rdi + 20], dword 1.0
    movss [rdi + 24], dword 0.0
    movss [rdi + 28], dword 0.0
    movss [rdi + 32], xmm1
    movss [rdi + 36], dword 0.0
    movss [rdi + 40], xmm2
    movss [rdi + 44], dword 0.0
    movss [rdi + 48], dword 0.0
    movss [rdi + 52], dword 0.0
    movss [rdi + 56], dword 1.0

    ; Restaurar registros y retornar
    pop rdi
    pop rsi
    pop rbx
    ret

; Rotación alrededor del eje Z
; void RotateZ(float angle, float* matrix)
RotateZ:
    ; Guardar registros
    push rbx
    push rsi
    push rdi

    ; Cargar los parámetros
    movss xmm0, [rcx]        ; angle
    mov rdi, rdx             ; matrix

    ; Calcular el seno y coseno del ángulo
    movaps xmm1, xmm0
    mulss xmm1, [pi]
    divss xmm1, [pi]
    call sin
    movss xmm2, xmm0
    call cos

    ; Construir la matriz de rotación
    movss [rdi], xmm2
    movss [rdi + 4], xmm1
    movss [rdi + 8], dword 0.0
    movss [rdi + 12], dword 0.0
    movss [rdi + 16], xmm1
    movss [rdi + 20], xmm2
    movss [rdi + 24], dword 0.0
    movss [rdi + 28], dword 0.0
    movss [rdi + 32], dword 0.0
    movss [rdi + 36], dword 0.0
    movss [rdi + 40], dword 1.0
    movss [rdi + 44], dword 0.0
    movss [rdi + 48], dword 0.0
    movss [rdi + 52], dword 0.0
    movss [rdi + 56], dword 1.0

    ; Restaurar registros y retornar
    pop rdi
    pop rsi
    pop rbx
    ret

; Escalado
; void Scale(float x, float y, float z, float* matrix)
Scale:
    ; Guardar registros
    push rbx
    push rsi
    push rdi

    ; Cargar los parámetros
    movss xmm0, [rcx]        ; x
    movss xmm1, [rcx + 4]    ; y
    movss xmm2, [rcx + 8]    ; z
    mov rdi, rdx             ; matrix

    ; Construir la matriz de escalado
    movss [rdi], xmm0
    movss [rdi + 4], dword 0.0
    movss [rdi + 8], dword 0.0
    movss [rdi + 12], dword 0.0
    movss [rdi + 16], dword 0.0
    movss [rdi + 20], xmm1
    movss [rdi + 24], dword 0.0
    movss [rdi + 28], dword 0.0
    movss [rdi + 32], dword 0.0
    movss [rdi + 36], dword 0.0
    movss [rdi + 40], xmm2
    movss [rdi + 44], dword 0.0
    movss [rdi + 48], dword 0.0
    movss [rdi + 52], dword 0.0
    movss [rdi + 56], dword 1.0

    ; Restaurar registros y retornar
    pop rdi
    pop rsi
    pop rbx
    ret

; Traslación
; void Translate(float x, float y, float z, float* matrix)
Translate:
    ; Guardar registros
    push rbx
    push rsi
    push rdi

    ; Cargar los parámetros
    movss xmm0, [rcx]        ; x
    movss xmm1, [rcx + 4]    ; y
    movss xmm2, [rcx + 8]    ; z
    mov rdi, rdx             ; matrix

    ; Construir la matriz de traslación
    movss [rdi], dword 1.0
    movss [rdi + 4], dword 0.0
    movss [rdi + 8], dword 0.0
    movss [rdi + 12], xmm0
    movss [rdi + 16], dword 0.0
    movss [rdi + 20], dword 1.0
    movss [rdi + 24], dword 0.0
    movss [rdi + 28], xmm1
    movss [rdi + 32], dword 0.0
    movss [rdi + 36], dword 0.0
    movss [rdi + 40], dword 1.0
    movss [rdi + 44], xmm2
    movss [rdi + 48], dword 0.0
    movss [rdi + 52], dword 0.0
    movss [rdi + 56], dword 0.0
    movss [rdi + 60], dword 1.0

    ; Restaurar registros y retornar
    pop rdi
    pop rsi
    pop rbx
    ret
