    .globl foo
foo:
    pushq %rbp
    movq  %rsp, %rbp
    movl  $0, %ecx
    movl  $0, %edx
.Lfoo_loop:
    cmpl  %esi, %ecx
    jge   .Lfoo_end
    movl  (%rdi,%rcx,4), %eax
    addl  %eax, %edx
    cmpl  $0, %eax
    jne   .Lfoo_next
    movl  %edx, (%rdi,%rcx,4)
    movl  $0, %edx
.Lfoo_next:
    addl  $1, %ecx
    jmp   .Lfoo_loop
.Lfoo_end:
    movq  %rbp, %rsp
    popq  %rbp
    ret
