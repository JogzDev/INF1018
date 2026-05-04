.data
Sf: .string "%d\n"

.text
.globl main
main:
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)

  movl $1, %ebx        /* i = 1 */

L1:
  cmpl $10, %ebx       /* if i > 10, termina */
  jg   L2

  movl  %ebx, %eax
  imull %eax, %eax     /* eax = i * i */

  movq  $Sf, %rdi
  movl  %eax, %esi
  movl  $0, %eax
  call  printf

  incl %ebx            /* i++ */
  jmp  L1

L2:
  movq    $0, %rax
  movq    -16(%rbp), %r12
  movq    -8(%rbp), %rbx
  leave
  ret
