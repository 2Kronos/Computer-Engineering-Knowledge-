
### Monitors

- **Definition**: A programming construct providing semaphore-like functionality, but easier to control.
- **Languages**: Implemented in languages like Concurrent Pascal, Pascal-Plus, Modula-2, Modula-3, and Java, and also as a program library.

---

### Monitor Characteristics
- **Exclusive Access**: Only one process can execute in the monitor at a time.
- **Procedure Access**: Processes enter the monitor by invoking its procedures.
- **Local Data**: Accessible only by the monitor’s procedures, not external ones.

### Synchronization
- **Condition Variables**: Used for synchronization, accessible only within the monitor.
- **Functions**:
  - `cwait(c)`: Suspends execution of the process on condition `c`.
  - `csignal(c)`: Resumes a process waiting on condition `c`.

---
### Message Passing

- **Purpose**: Provides synchronization (mutual exclusion) and communication (information exchange) between processes.
- **Applicable**: Works with distributed systems, shared memory multiprocessors, and uniprocessor systems.

### Message Passing Primitives
- **send(destination, message)**: Sends a message to the designated destination process.
- **receive(source, message)**: Receives a message from the specified source process.

---
### Synchronization in Message Systems

- **Send**:
  - **Blocking**: The sender waits until the message is received.
  - **Non-blocking**: The sender proceeds without waiting for the message to be received.

- **Receive**:
  - **Blocking**: The receiver waits until a message is received.
  - **Non-blocking**: The receiver proceeds without waiting for a message.
  - **Test for Arrival**: The receiver checks if a message has arrived without blocking.

---

### Addressing in Message Systems

- **Direct**:
  - **Explicit**: Sender and receiver are specified directly.
  - **Implicit**: The system determines the sender and receiver automatically.
  
- **Indirect**:
  - **Static**: The receiver is predetermined.
  - **Dynamic**: The receiver can change during execution.
  - **Ownership**: Determines which process owns the message.

---

### Message Format

- **Content**: The actual data being communicated.
- **Length**:
  - **Fixed**: The message size is constant.
  - **Variable**: The message size can vary.

---

### Queueing Discipline

- **FIFO**: Messages are processed in the order they are received.
- **Priority**: Messages are processed based on priority.

### Synchronization in Message Passing

1. **Message Communication & Synchronization**:
   - Communication between two processes requires synchronization, where the receiver waits for the message sent by the sender.

2. **Receive Primitive Behavior**:
   - **No Waiting Message**: The process is blocked until a message arrives or continues without receiving.
   - **Waiting Message**: The message is received, and execution continues.

3. **Message Already Sent**: 
   - If a message was sent but not yet received, it is received when the process continues, and execution proceeds.

---

### Types of Send and Receive Operations

- **Blocking Send, Blocking Receive**:
  - Both sender and receiver are blocked until the message is delivered.
  - Also known as a **rendezvous**.
  - Provides tight synchronization between processes.

- **Nonblocking Send**:
  - The sender continues execution while the receiver waits for the message.
  - Useful for sending multiple messages quickly, e.g., in service processes that provide resources to others.

- **Nonblocking Send, Blocking Receive**:
  - The sender does not wait, but the receiver is blocked until the message arrives.
  - Neither party is required to wait unnecessarily.


### Addressing in Message Passing

- **Direct Addressing**:
  - **Send**: Includes a specific identifier for the destination process.
  - **Receive**:
    - **Explicit**: The process explicitly designates the sending process (effective for cooperating processes).
    - **Implicit**: The source parameter of the receive primitive is filled with the value of the sender when the receive operation occurs.

- **Indirect Addressing**:
  - **Mailboxes**: Messages are sent to a shared queue (mailbox), allowing greater flexibility.
  - One process sends a message to the mailbox, and another picks it up, enabling indirect communication.

---

### Queueing Discipline

- **FIFO**: The simplest queueing method where messages are processed in the order they arrive.
- **Priority**: Messages are prioritized, either by type or sender's designation.
- **Receiver Selection**: The receiver can inspect the queue and select which message to process next, based on specific criteria.