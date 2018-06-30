[BITS 64]

	global rindex:function
	global strrchr:function
	section .text

strrchr:
rindex:
	push rbp
	mov rbp, rsp
	
	xor rax, rax
	cmp rdi, 0
	je rindex_error
	jmp rindex_loop

rindex_return:
	mov rax, rdi
	cmp byte[rdi], 0
	je rindex_error
	inc rdi
	cmp byte[rdi], 0
	je rindex_error
	jmp rindex_loop

rindex_error:
	mov rsp, rbp
	pop rbp
	ret			

rindex_loop:
	cmp byte[rdi], sil
	je rindex_return
	
	cmp byte[rdi], 0
	je rindex_error
	
	inc rdi
	jmp rindex_loop
		
	ret
