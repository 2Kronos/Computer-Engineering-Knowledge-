# Basic concepts

- Maximum CPU utilization obtained with multiprogramming

- CPU–I/O Burst Cycle – Process execution consists of a cycle of CPU execution and I/O wait
	-  CPU burst followed by I/O burst 
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
