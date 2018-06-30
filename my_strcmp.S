[BITS 64]
	
	global strcmp:function
	section .text

strcmp:
	push rbp
	mov rbp, rsp

	xor rax, rax
	cmp rdi, 0
	je strcmp_error
	cmp rsi, 0
	je strcmp_error
	jmp strcmp_loop
	
strcmp_loop:
	mov r8b, [rdi]
	
	cmp byte[rdi], 0
	je strcmp_end
	cmp byte[rsi], 0
	je strcmp_end
	
	cmp byte[rsi], r8b
	jne strcmp_end
	
	inc rdi
	inc rsi
	jmp strcmp_loop
	
strcmp_end:
	sub r8b, [rsi]
	movsx rax, r8b
	
	mov rsp, rbp
	pop rbp
	ret

strcmp_error:
	mov rsp, rbp
	pop rbp
	ret
