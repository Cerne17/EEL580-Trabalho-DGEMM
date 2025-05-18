vmovsd (%r10),%xmm0              # Load 1 element of C into %xmm0
mov     %rsi,%rcx                # register %rcx = %rsi
xor     %eax,%eax                # register %eax = 0
vmovsd (%rcx),%xmm1              # Load 1 element of B into %xmm1
add     %r9,%rcx                 # %rcx = %rcx + %r9
vmulsd (%r8,%rax,8),%xmm1,%xmm1  # Multiply %xmm1, element of A
add     $0x1,%rax                 # %rax = %rax + 1
cmp     %eax,%edi                # compare %eax to %edi
vaddsd  %xmm1,%xmm0,%xmm0        # Add %xmm1, %xmm0
jg      30 <dgemm+0x30>         # jump if %eax > %edi
add     $0x1,%r11                 # register %r11 = %r11 + 1
vmovsd  %xmm0,(%r10)             # Store %xmm0 into C element