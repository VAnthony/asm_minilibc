[BITS 64]
	
	global memmove:function
	section .text

memmove:
	push rbp
	mov rbp, rsp
	
	xor rax, rax
	xor r10, r10
	mov r11, rdx
	
	mov r9, rdi
	sub r9, rsi
	
	cmp r9, 0	
	je memmove_end
	jg memmove_loop
	
memmove_loop2:
	cmp rdx, r10
	jge memmove_end

	mov r8b, [rsi + r10]
	mov [rdi + r10], r8b
	inc r10
	jmp memmove_loop2
	
memmove_loop:
	cmp r11, 0
	jle memmove_end

	mov r8b, [rsi + r11 - 1]
	mov [rdi + r11 - 1], r8b
	dec r11
	jmp memmove_loop
	
memmove_end:
	mov rax, rdi
	
	mov rsp, rbp
	pop rbp
	ret
