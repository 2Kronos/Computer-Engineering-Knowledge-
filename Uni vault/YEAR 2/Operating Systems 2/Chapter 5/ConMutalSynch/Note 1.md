

### Multiple Processes and Operating System Design
- **Operating System Design**: Focuses on managing processes and threads to ensure efficient execution and resource utilization.

- **Multiprogramming**:
  - Manages multiple processes within a single *uniprocessor system*.
  - Ensures CPU always has a process to execute, increasing utilization.

- **Multiprocessing**:
  - Manages multiple processes on a *multiprocessor system* with more than one CPU.
  - Enhances performance by allowing true parallel execution.

- **Distributed Processing**:
  - Manages processes across multiple, distributed systems (different computers).
  - Clusters are a common example, where multiple computers work together as a single unit to run processes.

### Concurrency

- **Three Contexts Where Concurrency Arises**:
  - **Multiple Applications**: Allows sharing of processing time among multiple active applications.
  - **Structured Applications**: Based on modular design and structured programming to manage tasks.
  - **Operating System Structure**: OS itself is implemented as multiple processes or threads.

- **Examples of Concurrency**:
  - Railway networks (shared track sections)
  - Gardening (different tasks like raking, sweeping)
  - Factory machines

# Definitions 

- **Atomic Operation**: 
  Appears indivisible; 
  executes fully or not at all,
   ensuring isolation from other processes.
   
- **Critical Section**: 
	  Code that requires exclusive access to shared resources;
	  must not be executed by multiple processes simultaneously.
	  
- **Deadlock**: 
	  Processes are unable to proceed, each waiting for the other to act.
	  
- **Livelock**: 
  Processes continuously respond to each other without progressing.
  
- **Mutual Exclusion**: Ensures only one process at a time accesses shared resources in critical sections.
  
- **Race Condition**: Final outcome depends on timing of concurrent access to shared data.
  
- **Starvation**: 
  A runnable process is indefinitely overlooked by the scheduler.
  Able to proceed not chosen


### Mutual Exclusion: Software Approaches

- **Implementation**:
  - Designed for concurrent processes on single-processor or multiprocessor machines with shared memory.
  - Assumes basic mutual exclusion at the memory access level.

- **Memory Access**:
  - Simultaneous read/write access 

- **No Additional Support**:

- **Historical Algorithm**:
  - Dijkstra introduced an algorithm based on Dekker's work for achieving mutual exclusion with two processes.

- **Development Stages**:
  - Solution is developed in stages to highlight common concurrency issues and bugs encountered in concurrent programming.


Here’s a brief comparison of **Peterson’s Algorithm** and **Dekker’s Algorithm**, focusing on why Peterson’s is simpler:

---

### Dekker’s Algorithm
- **Description**:
	  - First known software-based solution to the mutual exclusion problem for two processes.
	  - Uses a combination of flags and a turn variable to control access to the critical section.
	  - Processes check each other’s flags to ensure that only one enters the critical section at a time.
	  - If both want to enter, one process waits by checking and alternating turns, which can be complex and slow.
- **Complexity**:
  - Dekker’s solution is more intricate due to multiple checks and turn alternation, leading to a complicated and sometimes slower process.

### Peterson’s Algorithm
- **Description**:
	  - A simpler algorithm for two-process mutual exclusion.
	  - Uses two variables: `flag` (indicating a process’s intent to enter) and `turn` (allowing priority between the two processes).
	  - Each process sets its flag and checks the turn variable. If both want to enter, the turn variable decides priority, minimizing busy-waiting.
- **Simplicity**:
  - Peterson’s algorithm is more straightforward, as it uses fewer checks and a simpler mechanism for priority, making it easier to understand and implement.

**Why Peterson’s Algorithm is Simpler**:
- Fewer steps and checks are required to manage access.
- More efficient in terms of busy waiting and handling priority between processes.

---
## Principles of Concurrency

- **Interleaving and Overlapping**:
  - Both involve concurrent processing:
    - **Interleaving**: Processes take turns executing in small time slices.
    - **Overlapping**: Multiple processes execute simultaneously (e.g., on a multiprocessor system).

- **Common Issues**:
  - Both methods lead to problems such as resource contention, synchronization issues, and race conditions.

- **Uniprocessor Systems**:
		- Relative execution speed of processes is unpredictable.
- Depends on:
    - Activities of other processes.
    - OS handling of interrupts.
    - OS scheduling policies.
- **Factors Influencing Execution**:
  - OS interrupt handling and scheduling policies impact process interleaving in uniprocessor systems.

### Difficulties of Concurrency
- **Sharing of Global Resources**:
  - Challenging for the OS to allocate resources optimally.
  - Risks of race conditions and inefficient resource management.

- **Debugging Issues**:
  - Hard to locate programming errors.
  - Results are non-deterministic, making bugs hard to reproduce and fix.

---

## Race Condition Explanation:

- Occurs when multiple processes access shared data concurrently.
- Leads to unpredictable or incorrect results due to interference between processes.

### Solution:

- **Mutexes**: Only one thread can access a resource at a time.
- **Semaphores**: Control access, limiting the number of threads accessing a resource.
- **Critical Sections**: Restrict access to shared resources by one thread at a time.
- **Monitors**: High-level synchronization handling locking automatically


### Examples:

1. **Example 1**:  
   - Processes: P1 and P2 share global variable `a`.
   - P1 updates `a` to `1`, and P2 updates `a` to `2`.
   - **Result**: The final value of `a` depends on which process executes its update last. The "loser" (the last process to write) determines the final value.

2. **Example 2**:  
   - Processes: P3 and P4 share global variables `b = 1` and `c = 2`.
   - P3 executes `b = b + c` and P4 executes `c = b + c`.
   - **Result**:
     - If P3 runs first: `b = 3`, `c = 5`.
     - If P4 runs first: `b = 4`, `c = 3`.
   - The final values of `b` and `c` depend on the order of execution.

--- 
