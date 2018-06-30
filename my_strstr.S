[BITS 64]
	
	global strstr:function
	section .text

strstr:
	push rbp
	mov rbp, rsp

	xor rax, rax
	cmp rdi, 0
	je strstr_end
	cmp rsi, 0
	je strstr_end
	jmp strstr_loop
	
strstr_loop:
	mov r8b, [rdi]

	mov rax, 0

	cmp byte[rdi], 0
	je strstr_end
	
	mov r10, rdi
	mov r11, rsi
	mov rax, rdi
	cmp byte[rsi], r8b
	je strstr_test
	
	inc rdi
	jmp strstr_loop

strstr_end:
	mov rsp, rbp
	pop rbp
	ret
	
strstr_test:
	mov r9b, [r10]

	mov rax, rdi
	cmp byte[r11], 0
	je strstr_end
	
	cmp byte[r10], 0
	je strstr_before_loop

	cmp byte[r11], r9b
	jne strstr_before_loop

	inc r10
	inc r11
	jmp strstr_test

strstr_before_loop:
	inc rdi
	jmp strstr_loop
	
