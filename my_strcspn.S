[BITS 64]
	
	global strcspn:function
	section .text

strcspn:
	push rbp
	mov rbp, rsp

	xor rax, rax
	jmp strcspn_loop
	
strcspn_loop:
	mov r8b, [rdi]
	
	cmp byte[rdi], 0
	je strcspn_end
	
	mov r11, rsi
	mov r10, rdi
	
	mov r9b, [r10]
	cmp byte[r11], r9b
	je strcspn_end

	inc rax
	jmp strcspn_test

	inc rdi
	jmp strcspn_loop

strcspn_end:

	mov rsp, rbp
	pop rbp
	ret
	
strcspn_test:
	cmp byte[r10], 0
	je strcspn_end

	mov r9b, [r10]
	cmp byte[r11], r9b
	je strcspn_end2

	cmp byte[r11], 0
	je strcspn_before_loop

	inc r11
	jmp strcspn_test

strcspn_before_loop:
	inc rdi
	jmp strcspn_loop
	
strcspn_end2:
	dec rax
	
	mov rsp, rbp
	pop rbp
	ret
