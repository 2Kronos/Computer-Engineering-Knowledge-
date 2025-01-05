### Concurrency
- **Definition**: When multiple processes or threads execute at the same time, potentially interacting with shared resources.
- **Prevention**: Managed with synchronization tools like locks, semaphores, and monitors to ensure safe access to resources.

### Starvation
- **Definition**: When a process waits indefinitely for resources due to other processes constantly gaining access first.
- **Prevention**: Priority adjustments or fair scheduling methods ensure all processes eventually get access.

### Deadlock
- **Definition**: When two or more processes are stuck waiting for each other to release resources, preventing further progress.
- **Prevention**: Deadlock avoidance methods, resource allocation ordering, or using timeouts.

### Race Condition
- **Definition**: Occurs when multiple processes or threads access shared data at the same time, leading to unpredictable outcomes.
- **Prevention**: Synchronization techniques like locks, semaphores, or monitors prevent simultaneous access to critical sections of code.
