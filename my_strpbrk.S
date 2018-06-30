[BITS 64]
	
	global strpbrk:function
	section .text

strpbrk:
	push rbp
	mov rbp, rsp

	xor rax, rax
	cmp rsi, 0
	je strpbrk_end
	cmp rdi, 0
	je strpbrk_end	
	jmp strpbrk_loop
	
strpbrk_loop:
	mov r8b, [rdi]

	mov rax, 0
	
	cmp byte[rdi], 0
	je strpbrk_end
	
	mov r11, rsi
	jmp strpbrk_test

	inc rdi
	jmp strpbrk_loop

strpbrk_end:
	mov rsp, rbp
	pop rbp
	ret
	
strpbrk_test:
	mov rax, rdi
	
	cmp byte[rdi], 0
	je strpbrk_end

	cmp byte[r11], 0
	je strpbrk_before_loop

	mov r9b, [rdi]
	cmp byte[r11], r9b
	je strpbrk_end

	inc r11
	jmp strpbrk_test

strpbrk_before_loop:
	inc rdi
	jmp strpbrk_loop
	
