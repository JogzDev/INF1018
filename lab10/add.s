    .globl add
add:
    pushq %rbp
    movq  %rsp, %rbp
    movl  $0, %eax
.Ladd_loop:
    cmpq  $0, %rdi
    je    .Ladd_end
    addl  (%rdi), %eax
    movq  8(%rdi), %rdi
    jmp   .Ladd_loop
.Ladd_end:
    movq  %rbp, %rsp
    popq  %rbp
    ret
