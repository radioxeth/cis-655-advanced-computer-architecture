# Week 4 Memory Hierarchy Design
## Table of Contents
- [Week 1 Fundamentals of Quantitative Design and Analysis](../week1/README.md)
- [Week 2 Processor Design](../week2/README.md)
- [Week 3 Advanced Pipelining and I/O](../week3/README.md)
- **&rarr;[Week 4 Memory Hierarchy Design](README.md)**
- [Week 5 Instruction-Level Parallelism (ILP)](../week5/README.md)
- [Week 6 Vector and GPU Architectures (DLP)](../week6/README.md)
- [Week 7 Multithreaded and Multicore Processors (Thread-Level Parallelism)](../week7/README.md)
- [Week 8 Shared-Memory Systems (Data-Level Parallelism)](../week8/README.md)
- [Week 9 Interconnection Networks](../week9/README.md)
- [Week 10 Request-Level Parallelism](../week10/README.md)

*At this point I am switching to rough notes and will instead rely on the lecture slides provided*

### Memory Hierarchy

- memory hierarchy Design
  - memory hierarchy
  - advanced optimizations
  - memory technology
  - virtual Memory
  - address translations

#### Introduction

- programmers want unlimited amounts of memory with low latency
- fast memory technology is more expensive per bit than slower memory
- solution: organize memory into a hierarchy
- temporal and spatial locality ensures that nearly all references can be found in smaller memories


#### memory hierarchy

- higher level memory is closest to CPU

- memory hierarchy design becomes more crucial with recent multiform processors

#### Performance and Power
- high-end microprocessor have > 10 MB on chip caces
  - consumes large amount of area and power

### Cache Memory

#### Memory Hierarchy Basics

- when a word is ont found in the cache, a miss occurs
  - fetch word from lower level in hierarchy, requiring a higher latency reference
  - lower level may be another cache or the main memory
  - also fetch the other words contained within the block
  - place block into cache in a ny location within its set, determined by address

- n sets -> n-way set associative
  - direct mapped cached - one block per set
  - fully associative - one set
- writing to cache
  - write-through: immediately update lower levels of hierarchy
  - write-back: only update lower levels of hierarchy when an updated block is replace
  - both strategies use write buffer to make writes asynchronous


- miss rate
- causes of misses
  - compulsory
  - capacity
  - conflict

> can execute instructions during a cache miss


#### cache design space

- dimensions
  - cache size
  - block size
  - associativity
  - replacement policy
  - write-through vs write-back
  - write allocation
- optimal choice is a compromise
- simplicity often wins

### Advanced Optimizations
- small and simple first-level cache
  - critical timing path
  - direct mapped
  - lower associativity

#### Way Prediction
- predict the way to present mux -> better hit time

#### Pipeline Cache
- pipeline cache access -> better bandwidth

- increase branch mispredictions penalty
- make it easier to increase associativity

#### nonblocking caches
- allow hits before previous misses complete

#### multibanked caches

- organize cache as independent banks to support simultaneous access
- interleave banks according to block address

#### Critical word first, early restart

- critical word first
  - request missed word from memory first
  - send it to the processor as soon as it arrives
- early restart
  - request words in normal order
  - send missed work to processor as soon as it arrives

- effectiveness depends on block size and likelihood that another part of the block isn't being accessed

#### compiler optimizations
- loop interchange
- blocking

#### hardware prefetching

#### compiler prefetching


### Memory Technology



### Main Memory

- SRAM
- DRAM
  - cmos transistors work with capacitors to store memory-
  - must be rewritten on every read
- Flash memory


### Locating an Object

- virtual address space

### Address Translations

## Live Session

### What is a cache?

- small fast storage used to improve average access time to slow memory
- exploits spatial and temporal locality

### Levels of Memory Hierarchy

- registers
  - small and fast
- cache
  - > only copy data from memory that you think you're going to use in the future
  - only helps performance if you use the cache well

- usually you will access an array of data's neighbors

### Word and Block

> !!!! based on the principle of locality, when we access a word, we do not get a word, we get a block !!!!

|word|block|
|-|-|
|w0|b0|
|w1|b0|
|w2|b0|
|w3|b0|
|w4|b1|
|w5|b1|
|w6|b1|
|w7|b1|

- multiple caches
  - upper level is closer to CPU
  s- lower level is slower/bigger, far from the CPU

  - .50 memory access/instruction
  - miss penalty is 25 clock cycles
  - miss rate is 2%
  - 
  .5 x 25 x .02 = .25

#### 4 questions to consider when designing caches

Q1. where can a block be placed in the upper level
- full mapped
- direct mapped
- 2-way assoc

Q2. How is a block found if it is in the upper level? (block identification)

Q3. Which block should be replaced on a miss? (block replacement)

- random
- LRU
  - overhead
- FIFO

Q4. What happens on a write? (Write strategy)

- only if you want to write

on a write hit: 
  - a. write through
  - b. write back*
on a write miss:
  - c. write allocate
  - d. no-write allocate

write no allocate
1. [] write miss
2. [] write miss
3. [200] read miss
4. [200] read hit
4. [200] write miss

write allocate
1. [100] write miss
2. [100] write hit
3. [100,200] read miss
4. [100,200] write hit
5. [100,200] write hit

#### cache performance

- AMAT - average memory access time
- > !!!! we always use the local miss rate !!!!

hw 3 q2, use the local miss rate