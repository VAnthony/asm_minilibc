[BITS 64]
	
	global strncmp:function
	section .text

strncmp:
	push rbp
	mov rbp, rsp

	xor rax, rax
	cmp rdi, 0
	je strncmp_error
	cmp rsi, 0
	je strncmp_error
	mov r9, 1
	jmp strncmp_loop

strncmp_loop:
	mov r8b, [rdi]

	cmp r9, rdx
	jge strncmp_end
	cmp byte[rdi], 0
	je strncmp_end
	cmp byte[rsi], 0
	je strncmp_end

	cmp byte[rsi], r8b
	jne strncmp_end

	inc rdi
	inc rsi
	inc r9
	jmp strncmp_loop

strncmp_end:
	
	sub r8b, [rsi]
	movsx rax, r8b

	mov rsp, rbp
        pop rbp
        ret

strncmp_error:	
	mov rsp, rbp
        pop rbp
	ret
