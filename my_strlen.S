[BITS 64]
	
	global strlen:function
	section .text
	
strlen:
	push rbp
	mov rbp, rsp
	
	xor rax, rax
	cmp rdi, 0
	je strlen_end
	jmp test

loop:
	inc rax
	inc rdi

test:
	cmp byte[rdi],0
	jnz loop

	mov rsp, rbp
	pop rbp
	ret

strlen_end:
	mov rsp, rbp
	pop rbp
	ret
