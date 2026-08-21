.intel_syntax noprefix
.global _start

_start:

xor rax, rax
xor r12, r12
xor r13, r13
mov rbx, [rsp+24]
cmp byte ptr [rbx], '+'
je addatoifunc
cmp byte ptr [rbx], '-'
je subatoifunc
cmp byte ptr [rbx], '*'
je mulatoifunc
cmp byte ptr [rbx], '^'
je xoratoifunc
cmp byte ptr [rbx], '|'
je oratoifunc
cmp byte ptr [rbx], '&'
je andatoifunc
cmp qword ptr [rsp], 3
je unary
mov rdi, 42
mov rax, 60
syscall

addatoifunc:

mov rdi, [rsp+16]
call atoi
add r12, rax
mov rdi, [rsp+32]
call atoi
add r12, rax
jmp additoafunc

additoafunc:

sub rsp, 0x80
mov rsi, rsp
mov rdi, r12
call itoa
jmp write

write:

mov rdi, 1
mov rsi, rsp
mov rdx, rax
mov rax, 1
syscall
mov rdi, 0
mov rax, 60
syscall

subatoifunc:

mov rdi, [rsp+16]
call atoi
add r12, rax
mov rdi, [rsp+32]
call atoi
sub r12, rax
jmp subitoafunc

subitoafunc:

sub rsp, 0x80
mov rsi, rsp
mov rdi, r12
call itoa
jmp write

mulatoifunc:

mov rdi, [rsp+16]
call atoi
add r12, rax
mov rdi, [rsp+32]
call atoi
imul r12, rax
jmp mulitoafunc

mulitoafunc:

sub rsp, 0x80
mov rsi, rsp
mov rdi, r12
call itoa
jmp write

xoratoifunc:

mov rdi, [rsp+16]
call atoi
add r12, rax
mov rdi, [rsp+32]
call atoi
xor r12, rax
jmp xoritoafunc

xoritoafunc:

sub rsp, 0x80
mov rsi, rsp
mov rdi, r12
call itoa
jmp write

oratoifunc:

mov rdi, [rsp+16]
call atoi
add r12, rax
mov rdi, [rsp+32]
call atoi
or r12, rax
jmp oritoafunc

oritoafunc:

sub rsp, 0x80
mov rsi, rsp
mov rdi, r12
call itoa
jmp write

andatoifunc:

mov rdi, [rsp+16]
call atoi
add r12, rax
mov rdi, [rsp+32]
call atoi
and r12, rax
jmp anditoafunc

anditoafunc:

sub rsp, 0x80
mov rsi, rsp
mov rdi, r12
call itoa
jmp write

unary:

mov rbx, [rsp+16]
cmp byte ptr [rbx], '-'
je negatoifunc
cmp byte ptr [rbx], '~'
je notatoifunc
mov rdi, 42
mov rax, 60
syscall

negatoifunc:

mov rdi, [rsp+24]
call atoi
add r12, rax
neg r12
jmp negitoafunc

negitoafunc:

sub rsp, 0x80
mov rsi, rsp
mov rdi, r12
call itoa
jmp write

notatoifunc:

mov rdi, [rsp+24]
call atoi
add r12, rax
not r12
jmp notitoafunc

notitoafunc:

sub rsp, 0x80
mov rsi, rsp
mov rdi, r12
call itoa
jmp write
