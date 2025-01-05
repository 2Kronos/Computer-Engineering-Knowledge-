### Operating System Concerns

- **Design and Management Issues**:
  - **Process Tracking**: The OS must keep track of various processes in the system.
    
  - **Resource Allocation**: Allocate and de-allocate resources (memory, files, I/O devices) for each active process.
    
  - **Data Protection**: Protect each process's data and physical resources from unintended interference by other processes.

- **Process Independence**:
  - A process's functionality and output should be independent of the relative execution speed between it and other concurrent processes.

---
### Techniques for Process Management
- **Process Control Blocks (PCBs)**: 
  - Used to store the status and resource allocation information of each process.
  
- **Processor Time**: 
  - OS must manage and allocate CPU time to ensure fair execution.

- **Memory Management**: 
  - OS must ensure that each process has its allocated memory and prevents unauthorized access by other processes.

- **Files**: 
  - File systems must be managed to ensure processes have access to their needed files, while preventing unauthorized access or modification.

- **I/O Devices**: 
  - I/O devices must be allocated properly to processes, ensuring mutual exclusion and correct resource sharing.

### Table 5.2: Process Interaction

| **Degree of Awareness**                                                          | **Relationship**             | **Influence that One Process Has on the Other**                                       | **Potential Control Problems**                                              |
| -------------------------------------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| Processes unaware of each other                                                  | Competition                  | Results of one process are independent of the others' actions; Timing may be affected | Mutual exclusion; Deadlock (renewable resource); Starvation                 |
| Processes indirectly aware of each other (e.g., shared object)                   | Cooperation by sharing       | Results may depend on information from other processes; Timing may be affected        | Mutual exclusion; Deadlock (renewable resource); Starvation; Data coherence |
| Processes directly aware of each other (have communication primitives available) | Cooperation by communication | Results depend on information from other processes; Timing may be affected            | Deadlock (consumable resource); Starvation                                  |

---
### Types of Processes

- **Processes Unaware of Each Other**:
  - Independent processes that are not designed to work together.
  - Example: Multiprogramming with batch jobs or interactive sessions.
  - **OS Concern**: The OS must manage resource competition, such as access to disks, files, or printers, among independent processes.

- **Processes Indirectly Aware of Each Other**:
  - Processes that share access to a common object (e.g., an I/O buffer) but are not directly aware of each other by process ID.
  - **Cooperation**: These processes work together by sharing the common object.

- **Processes Directly Aware of Each Other**:
  - Processes that can communicate via process IDs and are designed to work jointly on tasks.
  - **Cooperation**: These processes exhibit direct cooperation.

### OS Implications:
- **Competition**: The OS must regulate resource access between processes, even when they are unaware of each other.
- **Cooperation**: The OS must manage shared resources and ensure correct synchronization when processes cooperate, either indirectly or directly.

---
### Conflicts in Concurrent Processes/ Resource competion
- **Conflict** arises when concurrent processes compete for shared resources like I/O devices, memory, processor time, and the clock.

### Three Control Problems:
1. **Mutual Exclusion**:
   - **Definition**: Only one process can access a resource (e.g., printer) at a time to avoid interference.
   - **Example**: If two processes share a printer, only one should access it at a time to prevent data from being mixed.
   - **Critical Section**: The part of the program that accesses the critical resource must be protected to ensure mutual exclusion.

2. **Deadlock**:
   - **Definition**: A situation where processes are waiting for resources held by each other, preventing both from proceeding.
   - **Example**: 
     - Process P1 holds resource R1 and waits for R2.
     - Process P2 holds resource R2 and waits for R1.
     - Both processes are deadlocked, unable to proceed.
  
3. **Starvation**:
   - **Definition**: A process is indefinitely delayed from accessing a resource because other processes keep getting priority.
   - **Example**: 
     - Processes P1, P2, and P3 need access to resource R.
     - If P1 continuously gets the resource, P2 might never get access, even though it’s not deadlocked.

These problems require effective OS management to ensure fair and efficient access to resources in concurrent environments.

---
### Cooperation Among Processes by Sharing
- **Interaction**: Processes may interact with other processes without being explicitly aware of them.
- **Shared Data**: Processes may use and update shared data without direct reference to each other, but are aware that other processes can access the same data.
- **Cooperation**: Processes must cooperate to manage shared data correctly and avoid conflicts.
  
### Control Mechanisms:
- **Integrity**: Control mechanisms ensure the integrity of shared data, preventing incorrect updates.
  
### Control Problems:
- **Mutual Exclusion, Deadlock, and Starvation**:
  - These issues are present again due to shared resources (devices, memory).
  
### Key Difference:
- **Reading and Writing**: Data can be accessed in two modes — reading and writing.
  - **Writing** operations must be mutually exclusive to prevent conflicts between processes, while reading does not require such restrictions.

---
### Cooperation Among Processes by Communication
- **Common Effort**: Processes work together in a coordinated manner, participating in a shared goal.
- **Synchronization**: Communication allows processes to synchronize and coordinate their activities.
- **Message-Based Communication**: Communication is typically done through messages (e.g., message passing).
- **Primitives**: Primitives for sending and receiving messages can be provided by the programming language or the OS kernel.
  
### Control Requirements:
- **Mutual Exclusion**: Not required for cooperation by communication, as processes communicate directly without needing exclusive access to resources.
  
### Remaining Issues:
- **Deadlock and Starvation**: These problems are still present and must be managed in systems using communication for process coordination.

---
