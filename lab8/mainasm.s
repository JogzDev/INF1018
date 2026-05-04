.data
nums: .int 3, -5, 7, 8, -2
s1:   .string "%d\n"

.text
.globl main
main:
  pushq %rbp
  movq  %rsp, %rbp
  subq  $16, %rsp
  movq  %rbx, -8(%rbp)
  movq  %r12, -16(%rbp)

  movq  $nums, %r12    /* r12 = p = &nums[0] */
  movl  $0, %ebx       /* ebx = i = 0 */

L1:
  cmpl  $5, %ebx
  jge   L2

  movl  (%r12), %edi   /* primeiro param de filtro: *p */
  movl  $1, %esi       /* segundo param de filtro: LIM */
  call  filtro

  movq  $s1, %rdi      /* primeiro param de printf */
  movl  %eax, %esi     /* segundo param: retorno de filtro */
  movl  $0, %eax
  call  printf

  addq  $4, %r12       /* p++ */
  incl  %ebx           /* i++ */
  jmp   L1

L2:
  movl  $0, %eax
  movq  -16(%rbp), %r12
  movq  -8(%rbp), %rbx
  leave
  ret
