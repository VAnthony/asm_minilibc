[BITS 64]
	
	global strcasecmp:function
	section .text
	
strcasecmp:
	push rbp
	mov rbp, rsp

	jmp strcasecmp_loop

decrement1:
	add r8b, 32
	jmp cmp1

decrement2:
	add r9b, 32
	jmp cmp_loop

strcasecmp_loop:
	mov r9b, [rsi]
	mov r8b, [rdi]

	cmp r8b, 'A'
	jl cmp1

	cmp r8b, 'Z'
	jl decrement1

cmp1:
	cmp r9b, 'A'
	jl cmp_loop
	cmp r9b, 'Z'
	jl decrement2
			
cmp_loop:
	cmp byte[rdi], 0
	je strcasecmp_end
	cmp byte[rsi], 0
	je strcasecmp_end
	
	cmp r9b, r8b
	jne strcasecmp_end
	
	inc rdi
	inc rsi
	jmp strcasecmp_loop

strcasecmp_end:
	sub r8b, r9b
	movsx rax, r8b

	mov rsp, rbp
	pop rbp
	ret
