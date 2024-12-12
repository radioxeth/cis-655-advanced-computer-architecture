# midterm practice

## week1 q1

Amdahl’s Law example
• New CPU 10X faster
• I/O bound server, so 60% time waiting for I/O


1/(.6+(.4/10)) = 1.56


## week1 q2

Question
• Compute the cost per die using the following
information:
• Cost per wafer = 2.0
• Wafer area = 10 cm2
• Wafer diameter = 30 cm
• Die area = 0.8 cm2
• Defects per area = 0.12
• N = 12 is the process complexity factor
• Assume Yield is 100%

cost per die= cost per wafer/(dies per wafer &times; die yield)

dies per wafer = = ((&pi; &times;(30cm/2)^2)/.8cm^2)-((&pi; &times; 30cm)/(2 &times; 30cm))

## week2 q3

Unpipelined: 10ns cycle time
4 cycles for ALU (40%), 4 branch (20%)
5 cycles for mem (40%)
Pipelining: add 1 ns to clock overhead
Speedup in execution rate?

unpipelined
clocktime*average cpi = 4\*.4 + 4\*2 + 5\*.4
10(4\*.4 + 4\*.2 + 5\*.4)=44


pipelined
10+1=11

## week2 q4 

Example:
-- Machine 1: separate I, D (no structure hazards)
-- Machine 2: with structure hazard (unified I, D):
clock rate 1/1.05 of machine 1
-- 40% of instructions are data accesses
which is faster??? Assume pipeline stall overhead=1

avg inst time1=CPI\*cct=CPI\*cct
avg inst time2=(1+.4)\*(cct/1.05)=(CPI\)=1.3cct


## week3 q5

Impact on Performance
• Example assume we have a computer where CPI is 1.0 when all
memory accesses hit the cache. The only data accesses are loads and
stores, and these total 50% of the insts. If the miss penalty is 25 clock
cycles and the miss rate is 2%, How much fast the computer would be, and
what is that if all insts were cache hits?



### Traditional Four Questions for Memory Hierarchy Designers
• Q1: Where can a block be placed in the upper level? (Block placement)
– Fully Associative, Set Associative, Direct Mapped
• Q2: How is a block found if it is in the upper level?
(Block identification)
– Tag/Block
• Q3: Which block should be replaced on a miss?
(Block replacement)
– Random, LRU
• Q4: What happens on a write?
(Write strategy)
– Write Back or Write Through (with Write Buffer)

## week5 q6

[] write miss 100
[] write miss 100
[200] read miss 200
[200] read hit 200
[200] write miss 100

<hr>

[100] write miss 100
[100] write hit 100
[100, 200] read miss 200
[100, 200] write hit 200
[100, 200] write hit 100

## week4 q7

- Miss rate 16kb instruction

3.82/1000/1 = 0.004

- miss rate 16kb data

40.9/1000/.36 = 0.114

- miss rate 32kb unified

43.3/1000/(1+0.36)=0.0318

- miss rate 16kb total

(0.74 &times; 0.004) + (0.26 &times; 0.114) = 0.0326

AMAT = % instruction &times; (hit time + instruction miss rate &times; miss penalty)
     + % data &times; (hit time + data miss rate &times; penalty)

= 0.74 &times; (1 + 0.004 + 200)
+ 0.26 &times; (1 + 0.114 + 200)=7.52

= 0.74 &times; (1 + 1 + 200)
+ 0.26 &times; (1 + 0.114 + 200)=7.52


# hello







|forwarding               |1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|
|-                        |-|-|-|-|-|-|-|-|-|- |- |- |- |- |- |- |
|Add $S0, $0, $0          |F|D|X|M|W| | | | | | | | | | | | |
|Loop: beq  $S0, $S1, done| |F|D|X|M|W| | | | | | | | | | |
|Lw $t0, 0($S2)           | | |F|D|X|M|W| | | | | | | | | |
|Addi $S2, $S2, 4         | | | |F|D|X|M|W| | | | | | | | |
|Add $t0, $t0, 5          | | | | |F|D|X|M|W| | | | | | | |
|Sw $t0, 0 ($S4)          | | | | | |F|D|X|M|W| | | | | | |
|Addi $S4, $S4, 4         | | | | | | |F|D|X|M|W| | | | |
|Addi $S0, $S0, 1         | | | | | | | |F|D|X|M|W| | | |
|J Loop                   | | | | | | | | |F|D|X|M|W| | | |




|no forwarding            |1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|
|-                        |-|-|-|-|-|-|-|-|-|- |- |- |- |- |- |- |
|Add $S0, $0, $0          |F|D|X|M|W| | | | | | | | | | | | |
|Loop: beq  $S0, $S1, done| |F|S|S|D|X|M|W| | | | | | | | | | |
|Lw $t0, 0($S2)           | | | | |F|D|X|M|W| | | | | | | | | |
|Addi $S2, $S2, 4         | | | | | |F|D|X|M|W| | | | | | | | |
|Add $t0, $t0, 5          | | | | | | |F|D|S|X|M|W| | | | | | | |
|Sw $t0, 0 ($S4)          | | | | | | | |F|S|S|D|X|M|W| | | | | | |
|Addi $S4, $S4, 4         | | | | | | | | | | |F|D|X|M|W| | | | |
|Addi $S0, $S0, 1         | | | | | | | | | | | |F|D|X|M|W| | | |
|J Loop                   | | | | | | | | | | | | |F|D|X|M|W| |



```
add $s0, $0, $0 				# i = 0
loop: beq $s0, $s1, done 	    # Jump to done when $s0=$s1
lw $t0, 0($s2) 				 	# Load B[i+1]
lw $t6, -8($s2) 				 	# Load B[i+2]
lw $t10, -16($s2) 				 	# Load B[i+3]
lw $t14,-24($s2) 				 	# Load B[i+4]


add $t0, $t0, 5 				# B[i+1]+5
add $t6, $t6, 5 				# B[i+1]+5
add $t10, $t10, 5 				# B[i+1]+5
add $t14, $t14, 5 				# B[i+1]+5

sw $t0, 0($s4)	                # A[i]=B[i+1]+5
sw $t6, -8($s4)	                # A[i]=B[i+1]+5
sw $t10, -16($s4)	                # A[i]=B[i+1]+5
sw $t14, -24($s4)	                # A[i]=B[i+1]+5

subi $s2, $s2, 32 				# s2-=32
subi $s4, $s4, 4 				# s4-=32
addi $s0, $s0, 4 				# i+=4
j loop                          # repeat
done: ...                       # no instruction here
```