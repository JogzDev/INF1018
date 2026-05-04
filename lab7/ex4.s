.data
nums: .long 65, -105, 111, 34
Sf:   .string "soma = %d\n"

.text
.globl main
main:
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)

  movl $0, %ebx     /* i = 0 */
  movl $0, %r12d    /* s = 0 */

L1:
  cmpl $4, %ebx
  jge  L2

  movslq %ebx, %rcx    /* rcx = i (64 bits) */
  imulq  $4, %rcx      /* rcx = i * 4       */
  addq   $nums, %rcx   /* rcx = &nums + i*4 */
  movl   (%rcx), %eax  /* eax = nums[i]     */
  addl   %eax, %r12d   /* s += nums[i]      */

  incl %ebx
  jmp  L1

L2:
  movq  $Sf, %rdi
  movl  %r12d, %esi
  movl  $0, %eax
  call  printf

  movq    $0, %rax
  movq    -16(%rbp), %r12
  movq    -8(%rbp), %rbx
  leave
  ret
