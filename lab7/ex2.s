.data
S2:  .byte 65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf:  .string "%c"
Sf2: .string "\n"

.text
.globl main
main:
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)

  movq $S2, %r12

L1:
  cmpb $0, (%r12)
  je   L2

  movsbl (%r12), %eax

  /* curto-circuito: pula printf se *pc == '{' (123) OU *pc == '}' (125) */
  cmpl $123, %eax
  je   L_skip
  cmpl $125, %eax
  je   L_skip

  movq  $Sf, %rdi
  movl  %eax, %esi
  movl  $0, %eax
  call  printf

L_skip:
  addq $1, %r12
  jmp  L1

L2:
  movq  $Sf2, %rdi
  movl  $0, %eax
  call  printf

  movq    $0, %rax
  movq    -16(%rbp), %r12
  movq    -8(%rbp), %rbx
  leave
  ret
