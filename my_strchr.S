[BITS 64]
	
	global strchr:function
	global index:function
	section .text

index:
strchr:
	                push rbp
	                mov rbp, rsp

			xor rax, rax
			cmp rdi, 0
			je strchr_error
	                jmp strchr_loop

strchr_return:
			mov rax, rdi
		        mov rsp, rbp
	                pop rbp
			ret

strchr_error:
			mov rax, 0
		        mov rsp, rbp
	                pop rbp
			ret			

strchr_loop:
			cmp byte[rdi], sil
			je strchr_return
	
	                cmp byte[rdi],0
	                je strchr_error
	
			inc rdi
			jmp strchr_loop
	
	                ret
