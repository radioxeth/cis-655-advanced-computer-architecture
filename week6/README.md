# Week 6 Vector and GPU Architectures (DLP)
## Table of Contents
- [Week 1 Fundamentals of Quantitative Design and Analysis](../week1/README.md)
- [Week 2 Processor Design](../week2/README.md)
- [Week 3 Advanced Pipelining and I/O](../week3/README.md)
- [Week 4 Memory Hierarchy Design](../week4/README.md)
- [Week 5 Instruction-Level Parallelism (ILP)](../week5/README.md)
- **&rarr;[Week 6 Vector and GPU Architectures (DLP)](README.md)**
- [Week 7 Multithreaded and Multicore Processors (Thread-Level Parallelism)](../week7/README.md)
- [Week 8 Shared-Memory Systems (Data-Level Parallelism)](../week8/README.md)
- [Week 9 Interconnection Networks](../week9/README.md)
- [Week 10 Request-Level Parallelism](../week10/README.md)

### Data-level parallelism
- DLP
- DLP architectures
- vector architectures
- challenges
- supercomputers
- SIMD extensions for multimedia
- GPU
- NVIDIA

### Types of Parallelism

### DLP Architecture

### Vector Architectures


## Live Session

### Data Parallelism

- assume large amounts of data
- SIMD is more energy efficient than MIMD

- Instruction Clock Cycles

no forwarding unit:

```
LD R1, 0(R2)      |FDXMW
DADDI R1, R1, #1  | FSSDXMW
SD 0(R2), R1      |    FSSDXMW
DADDI R2, R2, #4  |       FDXMW
DSUB R4, R3, R2   |        FSSDXMW
BNEZ R4, Loop     |           FSSDXMW
```

```
no forwarding unit:
LD R1, 0(R2)      |FDXMW
DADDI R1, R1, #1  | FDSXMW
SD 0(R2), R1      |  FSDXMW
DADDI R2, R2, #4  |    FDXMW
DSUB R4, R3, R2   |     FDXMW
BNEZ R4, Loop     |      FDXMW
```


A. Assume no forwarding unit