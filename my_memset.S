[BITS 64]
	
	global memset:function
	section .text
	
memset:
		push rbp
	        mov rbp, rsp
	
	        mov r8, rdi
		xor r9, r9

	        jmp memset_loop

memset_loop:
	        cmp rdx, r9
	        je memset_end
	        mov [r8], sil
 	        inc r9
		inc r8
		jmp memset_loop

memset_end:
		mov rax, rdi
	
		mov rsp, rbp
		pop rbp
		ret
