    .globl map2
map2:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp
    movq  %r12, -8(%rbp)
    movq  %r13, -16(%rbp)
    movq  %r14, -24(%rbp)
    movq  %rdi, %r12
    movq  %rsi, %r13
    movl  %edx, %r14d
.Lmap2_loop:
    cmpl  $0, %r14d
    jle   .Lmap2_end
    movl  (%r12), %edi
    call  f
    movl  %eax, (%r13)
    addq  $4, %r12
    addq  $4, %r13
    subl  $1, %r14d
    jmp   .Lmap2_loop
.Lmap2_end:
    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    movq  -24(%rbp), %r14
    movq  %rbp, %rsp
    popq  %rbp
    ret
