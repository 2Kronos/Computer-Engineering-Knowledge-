
# Multithreading

- `Concurency` perform one task at a time via threads(execution path with in s process)
- Program
	- Multiple threads of execution
	- Each thread own method call stack
	- Program counter
	- All of theese help it to execute concurently with other threads 

## Process vs Thread program

- Process is an actively running program
	- Program is a set of instructions along with the data and set or collection algorithms
- Process imbodies the algorithm of the programs 
- Thread is a sub process 
	- Method call stack3

## Concurrent programming

- Concurrent programs is essesntial a multithread programming
	- Has two or more threads to execute concurrently to work togther to perform a task
### Challenges of multithreading/ Concurrent programming
<u> Issues</u>
- Synchronization
- Race conditions
- Deadlock handling
	- Tie, impulse 
	- prevention of further progress 
- <u>Deadlock</u>
- A deadlock in programming occurs when two or more processes are unable to proceed because each is waiting for the other to release a resource. This creates a situation where none of the processes can move forward, effectively “locking” them in place.

<u>Race conditions</u>
- This is where multiple process get the same resource
- order of execution outcome depends on a specific task
	- Example where a big task is split into little task inorder to achiecve effeceincy so that the entire thread will execute as if it was executed by 1 thread.
	- The order of execution plays a role hear because there is a specific order in which the programs will run 

---
# Thread states: Life cycle 

- Thread pool
	- Collection of threads

- When we have a program it will create a program via the thread pool 
- Thread have any of the one states
	- runnable
	- waiting
	- time waiting
	- blocked terminated

<u> Runnnable</u>

- two substates ready as
- ==Ready== state can be seen as the entry to runnable state (intermediate state before the thread can actually get to run
- A ready thread enters the ==running state== (i.e. begins executing) when the operating system assigns it to a processor- also known as dispatching the thread



<u> Example</iu>
 - 3 threads
 - Only one acces the resourse
 - Two of the threads will be blocked this is an example of a blocked thread

- We cant go from waiting to terminad that will be due to errors
- Runnable is the central state where the transitions to other states will occur 

## Runnable state

- Each thread will be moving from the ready state to the running state until the thread is executed and then it can go to the terminated state
## Thread scheduling

- determines which threads runst next
- Most OS support time slicing

- ==Pr emptive scheduling== 
	- When a higher priority thread is sent to the scheduler it will be in the running state while the lower priority thread will be in the ready state
	- If a higher priority thread goes from waiting state to the running state the lower priority thread will let go of the process and give it to the higher priority thread
- Indefinite postponement/starvation: could occur when higher-priority threads keep postponing the execution of lower-priority threads
- Ageing to prevent starvation
- Platform dependant

---
# Creating and executing threads with executor framework

### Interface runnable

- Class implements runnable interface to execute task concurrently with other task
- Declares the run() methods (has the code to complete the task)
-  thread executing a Runnable object is created and started, the thread calls the Runnable object’s run method, which executes the task in the new thread
- [[Definition#Interface and class]]
## Executor
- Creating and managing group of threads
- Recommended to use this framework rather than the raw code 
<u>In multithread programming</u>
 - Each thread execute its task in a special method called ==run()==

---
# Thread synchronization
```SN
 Memory access
	- Read access
	- Write access/modif
 If we state clearly that only one part of the code will modify which is more effeceint than having multiple parts of the code modifying/writing
```

```SN
Producer/Consumer approach
Allow the consumer to read only when there is something to read i.e something has been produced

We cant produce more than the consumer can consume
```

- Coordinated access to shared data
- One thread exclusive access to modify
- Prevent indeterminate results
- Multi exclusion the thread acces shared object will block other threads aswell


# Synchronization via motors

- Each object has a monitor and monitor lock that will be given to a thread to block other threads to gain exclusive acces 
- Modification is only viable the lock

<u>Synchronization statement</u>

---

# Unsynchronized data sharing

---
- One of the challenges of multithreaded programming is the spotting of errors – they may occur so infrequently that a ‘broken’ program does not produce incorrect results during testing, creating the illusion that the program is correct

```
I
```
---

# Synchronized data sharing

## Thread safety
- Object is thread safe it can be accessd by multiple threads concurrently without any errors
```SN
Thread safety can either be by default by the system or it can be designed 
Thread safety refer to an object which we can write to which is usally a buffer

If thread safety is availabe having synchronization will not be needed

Multithread program desgner need not to worry about synchronizatiion
```

- Atomic operation(Cant break down operations into sub-operations) are placed in schronized statement to make them atomic

