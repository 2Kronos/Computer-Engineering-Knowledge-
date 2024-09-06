# Basic concepts

- Maximum CPU utilization obtained with multiprogramming

- CPU–I/O Burst Cycle – Process execution consists of a cycle of CPU execution and I/O wait
	- CPU burst followed by I/O burst 
	- CPU burst distribution is of main concern

## CPU Shedular 

- Whenever the CPU becomes idle, the operating system must select one of the proccess in the ready ques to be executed 
- Short-term scheduler selects from among the processes in ready queue, and allocates the CPU to one of them

<u> CPU scheduling decisions may take place when a process: </u>

1. Switches from running to waiting state 
2. Switches from running to ready state 
3. Switches from waiting to ready 
4. Terminates
   
 <u> Nonpreemptive [1 and 4] </u> 

- In non-pre-emptive scheduling the CPU stays allocated to a process until it completes or is blocked

 <u> Preemptive [2 and 3] </u> 
- With pre-emptive scheduling, context switching to other processes can occur for various reasons and at any time Winsows Macos, linux use this
- **Concerns** 

	1. Race Conditions in Preemptive Scheduling:
    
	    - **Data Corruption**: Occurs if a process is manipulating data and gets preempted.
	    - **Data Invalidation**: Happens if a process depends on another to update a value, but the updating process is preempted before completing the update.
	1. System Deadlock:
    
    - Can occur if a process depends on an updated value to continue, but the process updating the value is preempted and cannot be resumed.

### Dispather(Component involoving sccheduling)

- Dispatcher module gives control of the CPU to the process selected by the short-term scheduler; this involves:

	-  Switching context from one process to another 
	- Switching to user mode 
	- jumping to the proper location in the user program to restart that program
- Dispatch latency – time it takes for the dispatcher to stop one process and start another running

## Scheduling Critewria

- `CPU utilization` – keep the CPU as busy as possible
- `Throughput` –Number  of processes that complete their execution per time unit 
- Turnaround time – amount of time to execute a particular process 
- Waiting time – amount of time a process has been waiting in the ready queue 
- Response time – amount of time it takes from when a request was submitted until the first response is produced, not output (for time-sharing environment)
  
<u> Scheduling algorithem optimization criteria </u>

- Max CPU utilization -
- Max throughput 
- Min turnaround time 
- Min waiting time 
- Min response time

# First- Come , First-Served Scheduling

  
- **Order of Allocation**: The process that requests the CPU first is allocated the CPU first.
- **Implementation**: Managed with a FIFO (First-In, First-Out) queue.
  
    - When a process enters the ready queue, its PCB (Process Control Block) is linked to the tail of the queue.
    - When the CPU is free, it is allocated to the process at the head of the queue.
    - The running process is then removed from the queue
      .
- **Drawback**: The average waiting time under the FCFS policy is often quite long.

- Convoy effect - short process  wait behind long process
	- Effects are lower CPU utilization that could be fast if shorter process goes first 

## Shortest Job firts(SJF) Scheduling Algorithm

  
- **Process Length**: Associates each process with the length of its next CPU burst.
  
- Use these lengths to schedule the process with the shortest time.
  
- **Tie-Breaking**: If two processes have the same next CPU burst length, FCFS scheduling is used to break the tie.
  
- **Terminology**: A more accurate term would be the shortest-next-CPU-burst algorithm, as it depends on the next CPU burst length rather than the total length of the process.
- Optimal
- Smallets avverage waiting time
- **Abstacle** Knowing the next CPU request


## Priority scheduling 

- A priority number (integer) is associated with each process
- The CPU is allocated to the process with the highest priority (smallest integer ≡ highest priority)
	- Preemptive  
	- Nonpreemptive
- Problem ≡ Starvation – low priority processes may never execute 
- Solution ≡ Aging – as time progresses increase the priority of the process


## Round Robin

- Each process gets a small unit of CPU time (time quantum q), usually 10-100 milliseconds. 
- After this time has elapsed, the process is preempted and added to the end of the ready queue.
- Timer interrupts every quantum to schedule next process
- Performance  
	- q large ⇒ FIFO  
	- q small ⇒ q must be large with respect to context switch, otherwise overhead is too high
- Typically, higher average turnaround than SJF, but better response

### Time quatum and context switching

- So the average  turnaround time for a set of process does not necessarily improve as the time quatum

## Multilevel que

look in the notes

## Thread Scheduling


- **User-level threads** are scheduled by the thread library using **process contention scope (PCS)**, where threads within the same process compete for CPU time.
  
- **Kernel-level threads** are scheduled by the operating system using **system contention scope (SCS)**, where all threads in the system compete for CPU time.
  
- In **many-to-one** and **many-to-many** models, user-level threads are mapped to kernel-level threads (LWPs) by the thread library.
- In the **one-to-one** model, like in Windows and Linux, only SCS is used.
  
- PCS scheduling is typically priority-based, with higher-priority threads preempting lower-priority ones, but there is no guarantee of time slicing among threads of equal priority.
### Pthread Scheduling

- API allows specifying either PCS or SCS during thread creation 
	- PTHREAD_SCOPE_PROCESS schedules threads using PCS scheduling 
	- PTHREAD_SCOPE_SYSTEM schedules threads using SCS scheduling

## Multi-Processor Scheduling

multiprocessor now applies to the following system architectures: 
- Multicore CPUs 
- Multithreaded cores 
-  NUMA systems
-  Heterogeneous multiprocessing

### Load balancing

- Load balancing attempts to keep workload evenly distributed
  
- Push migration – periodic task checks load on each processor, and if found pushes task from overloaded CPU to other CPUs

- Pull migration – idle processors pulls waiting task from busy processor

- Affinity - Scheduling related tasks or threads on the same processor to improve cache coherence and reduce inter-processor communication.

- Synchronization - Ensuring proper synchronization between threads or processes that share data to prevent race conditions and other concurrency issues.

- NUMA Awareness - If the system has a Non-Uniform Memory Access (NUMA) architecture, the scheduler must also consider memory access patterns to optimize performance