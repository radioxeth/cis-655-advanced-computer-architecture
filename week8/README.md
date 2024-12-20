# Week 8 Shared-Memory Systems (Data-Level Parallelism)
## Table of Contents
- [Week 1 Fundamentals of Quantitative Design and Analysis](../week1/README.md)
- [Week 2 Processor Design](../week2/README.md)
- [Week 3 Advanced Pipelining and I/O](../week3/README.md)
- [Week 4 Memory Hierarchy Design](../week4/README.md)
- [Week 5 Instruction-Level Parallelism (ILP)](../week5/README.md)
- [Week 6 Vector and GPU Architectures (DLP)](../week6/README.md)
- [Week 7 Multithreaded and Multicore Processors (Thread-Level Parallelism)](../week7/README.md)
- **&rarr;[Week 8 Shared-Memory Systems (Data-Level Parallelism)](README.md)**
- [Week 9 Interconnection Networks](../week9/README.md)
- [Week 10 Request-Level Parallelism](../week10/README.md)


## Live Session

### Thread level parallelism


### Snooping Protocol

I: invalidated
M: mine or modified
S: shared, okay to be shared, readonly


Local Read
- S observed by I
Local Write
- M writes to itself

```mermaid

flowchart TD
    I --> I
```