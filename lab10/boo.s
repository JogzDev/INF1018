    .globl boo
boo:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp
    movq  %r12, -8(%rbp)
    movq  %r13, -16(%rbp)
    movq  %r14, -24(%rbp)
    movq  %rdi, %r12
    movl  %esi, %r13d
    movl  %edx, %r14d
.Lboo_loop:
    cmpl  $0, %r13d
    je    .Lboo_end
    subl  $1, %r13d
    movl  (%r12), %edi
    movl  %r14d, %esi
    call  f
    movl  %eax, 4(%r12)
    addq  $8, %r12
    jmp   .Lboo_loop
.Lboo_end:
    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    movq  -24(%rbp), %r14
    movq  %rbp, %rsp
    popq  %rbp
    ret
