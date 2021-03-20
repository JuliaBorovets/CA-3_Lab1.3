.syntax unified
.cpu cortex-m4
.thumb

// Global memory locations.
.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
	.word __stack_start 
	.word __kernel_reset__+1
	.size vtable_kernel, .-vtable_kernel

.section .rodata
	start: .asciz "kernel started!\n"
	finish: .asciz "Value in register #3: "
.section .text
__kernel_reset__:
	ldr r0, =start
	bl dbgput_line
// calculate 

lab2:

	mov r0, #2
	mov r1, #4
	mov r2, #3
	add r0, r1       
	lsr r0, r0, #1   
	mov r3, #1
	
	factorial:
		cmp r2, #1
		beq sum
		mul r3, r2
		sub r2, #1
		bne factorial
	sum:
		add r0, r3
		mov r3, r0
		
ldr r0, =finish
bl dbgput
mov r0,r3
bl dbgput_num

end:
	b end