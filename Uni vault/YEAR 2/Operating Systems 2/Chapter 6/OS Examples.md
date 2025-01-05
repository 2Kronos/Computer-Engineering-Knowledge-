### Windows Scheduling Overview

- **Priority-Based Preemptive Scheduling**: Highest-priority thread is scheduled next.
- **Dispatcher (Scheduler)**: Manages thread execution.
  - Thread runs until it **blocks**, **uses up time slice**, or is **preempted by a higher-priority thread**.
- **Real-Time Threads**: Can preempt non-real-time threads.
- **32-Level Priority Scheme**:
  - **Variable Priority** (1-15) and **Real-Time Priority** (16-31).
  - **Priority 0** is reserved for the memory-management thread.
- **Priority Queues**: Separate queue for each priority; idle thread runs if no runnable threads.

### Windows Priority Classes (Win32 API)

- **Priority Classes**:
   REALTIME_PRIORITY_CLASS, 
   HIGH_PRIORITY_CLASS,
    ABOVE_NORMAL_PRIORITY_CLASS, 
    NORMAL_PRIORITY_CLASS,
     BELOW_NORMAL_PRIORITY_CLASS, 
     IDLE_PRIORITY_CLASS.
  - All are variable except REALTIME.
- **Relative Priorities**: TIME_CRITICAL, HIGHEST, ABOVE_NORMAL, NORMAL, BELOW_NORMAL, LOWEST, IDLE.
- **Combined Priority**: Base priority is NORMAL; boosted if a process waits, with a 3x boost for the foreground window.

### User-Mode Scheduling (UMS) in Windows 7

- Allows applications to manage threads independently of the kernel.
- **Efficient for Large Thread Counts**: Often used with frameworks like the C++ Concurrent Runtime (ConcRT).

---

### Solaris Scheduling Overview

- **Scheduling Type**: **Priority-based scheduling** with multi-level feedback.
- **Classes** (Each with its own scheduling algorithm):
  - **Time Sharing (TS)**: Default class, uses multi-level feedback queue.
  - **Interactive (IA)**: Prioritizes interactive tasks.
  - **Real-Time (RT)**: For time-sensitive tasks.
  - **System (SYS)**: Reserved for system processes.
  - **Fair Share (FSS)**: Distributes CPU time fairly among users.
  - **Fixed Priority (FP)**: Static priority, does not adjust dynamically.
- **Per-Thread Global Priority**:
  - Scheduler converts class-specific priorities to a global priority.
  - Highest-priority thread runs next.
  - Threads run until they **block**, **use up their time slice**, or are **preempted** by a higher-priority thread.
- **Round-Robin**: Used within the same priority level when multiple threads have equal priority.