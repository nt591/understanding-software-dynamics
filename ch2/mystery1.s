	.file	"mystery1.cc"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"%d iterations, %lu cycles, %4.2f cycles/iteration\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%lu %lu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5566:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	time@PLT
	movq	%rax, %r12
	movzbl	%al, %ecx
	rdtsc
	movq	%rax, %rsi
	movl	_ZL11kIterations(%rip), %eax
	salq	$32, %rdx
	orq	%rdx, %rsi
	testl	%eax, %eax
	jle	.L4
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	_ZL11kIterations(%rip), %edx
	addl	$1, %eax
	addq	%rcx, %rbx
	cmpl	%eax, %edx
	jg	.L3
.L2:
	rdtsc
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	stdout(%rip), %rdi
	salq	$32, %rdx
	orq	%rdx, %rax
	leaq	.LC0(%rip), %rdx
	subq	%rsi, %rax
	movl	$1, %esi
	movq	%rax, %r8
	movl	_ZL11kIterations(%rip), %eax
	movl	_ZL11kIterations(%rip), %ecx
	cvtsi2sdq	%r8, %xmm0
	cvtsi2sdl	%eax, %xmm1
	movl	$1, %eax
	divsd	%xmm1, %xmm0
	call	__fprintf_chk@PLT
	movq	%rbx, %r8
	movq	%r12, %rcx
	movl	$1, %esi
	movq	stdout(%rip), %rdi
	leaq	.LC1(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L2
	.cfi_endproc
.LFE5566:
	.size	main, .-main
	.data
	.align 4
	.type	_ZL11kIterations, @object
	.size	_ZL11kIterations, 4
_ZL11kIterations:
	.long	1000000000
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
