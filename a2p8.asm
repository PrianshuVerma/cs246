
lis $4
.word 0 ; holds the current node of the tree

lis $5
.word 1

lis $6
.word 4

lis $7
.word -1

lis $8
.word 3

lis $10
.word 2

lis $20
.word 0xFFFF000c

lis $21
.word 48

tree: 
sw $31, -4($30)
sw $11, -8($30)
lis $31
.word 8
sub $30, $30, $31 ; store $31 on the stack

lis $11
.word 0

lis $3
.word 1

mult $4, $8
mflo $15
mult $15, $6
mflo $22
add $22, $22, $1
lw $22, 0($22)
add $22, $21, $4
sw $22, 0($20)
; recurse left
add $9, $15, $5
mult $9, $6
mflo $9
add $9, $9, $1
lw $9, 0($9) 
beq $9, $7,9 ; skip intructions to go left
mult $4, $10
mflo $4
add $4, $4, $5
lis $3
.word tree
jalr $3
add $11, $5, $3
div $4, $10
mflo $4 ; restore our node


mult $4, $8
mflo $15
; right
add $9, $15, $10
mult $9, $6
mflo $9
add $9, $9, $1
lw $9, 0($9)
beq $9, $7,10 ; skip intructions to go right if $9 is -1
mult $4, $10
mflo $4
add $4, $4, $10
lis $3
.word tree
jalr $3
add $3, $5, $3
div $4, $10
mflo $4
add $4, $4, $7

;compare register 11 and 3 and put max in 3

slt $12, $3, $11
beq $12, $0, 1
add $3, $11, $0

beq $0, $0, end

end:
lis $31
.word 8
add $30, $30, $31
lw $31, -4($30)
lw $11, -8($30)
jr $31

