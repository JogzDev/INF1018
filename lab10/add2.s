    .globl add2
add2:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp
    movq  %rbx, -8(%rbp)
    cmpq  $0, %rdi
    jne   .Ladd2_rec
    movl  $0, %eax
    jmp   .Ladd2_ret
.Ladd2_rec:
    movl  (%rdi), %ebx
    movq  8(%rdi), %rdi
    call  add2
    addl  %ebx, %eax
.Ladd2_ret:
    movq  -8(%rbp), %rbx
    movq  %rbp, %rsp
    popq  %rbp
    ret
