    .globl fat
fat:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp
    movq  %rbx, -8(%rbp)
    movl  %edi, %ebx
    cmpl  $0, %ebx
    jne   .Lfat_rec
    movl  $1, %eax
    jmp   .Lfat_ret
.Lfat_rec:
    leal  -1(%rbx), %edi
    call  fat
    imull %ebx, %eax
.Lfat_ret:
    movq  -8(%rbp), %rbx
    movq  %rbp, %rsp
    popq  %rbp
    ret
