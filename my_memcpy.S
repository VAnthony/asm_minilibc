[BITS 64]
	
	global memcpy:function
	section .text

memcpy:
	                push rbp
	                mov rbp, rsp

	                xor rax, rax
	                jmp memcpy_loop

memcpy_loop:
	                cmp rdx, rax
	                je memcpy_end

			mov r8b, [rsi + rax]
	                mov [rdi + rax], r8b
	                inc rax
	                jmp memcpy_loop

memcpy_end:
	                mov rax, rdi

	                mov rsp, rbp
	                pop rbp
	                ret
