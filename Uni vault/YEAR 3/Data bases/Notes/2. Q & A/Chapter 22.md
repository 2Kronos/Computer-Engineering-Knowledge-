

---

### **22.1** Why might data inconsistency and data loss occur? Why manage concurrent transactions?
- **Data inconsistency/loss causes**:
  - Lost update problem
  - Dirty reads
  - Inconsistent analysis
- **Why manage concurrency**:
  - Ensure correctness
  - Maintain database consistency
  - Prevent interference between transactions

---

### **22.2** Discuss ACID properties and their relation to concurrency control and recovery.
- **Atomicity**:
  - All or nothing execution
  - Managed by recovery (rollback)
- **Consistency**:
  - Valid state transitions
  - Enforced by DBMS and application
- **Isolation**:
  - Concurrent transactions don’t interfere
  - Enforced by concurrency control (locking/timestamping)
- **Durability**:
  - Committed changes persist
  - Ensured by recovery mechanisms

---

### **22.3** Problems in multi-user environment with concurrent access.
- **Lost update**
- **Uncommitted dependency (dirty read)**
- **Inconsistent analysis**
- **Nonrepeatable reads**
- **Phantom reads**

---

### **22.4** Concurrency control mechanism to prevent these problems.
- **Two-Phase Locking (2PL)**:
  - Growing phase (acquire locks)
  - Shrinking phase (release locks)
  - Prevents lost updates, dirty reads
- **Interaction with transactions**:
  - Locks acquired before operations
  - Released after commit/abort

---

### **22.5** Serial, nonserial, and serializable schedules.
- **Serial**: One transaction at a time
- **Nonserial**: Interleaved operations
- **Serializable**: Nonserial but equivalent to a serial schedule
- **Equivalence rules**:
  - Same order of conflicting operations
  - Same final state

---

### **22.6** Role of DBMS transaction manager.
- Coordinates transactions
- Ensures ACID properties
- Manages concurrency and recovery

---

### **22.7** Problems with locking and prevention.
- **Problems**:
  - Deadlock
  - Livelock
- **Prevention**:
  - Timeouts
  - Wait-die / Wound-wait schemes
  - Deadlock detection (wait-for graph)

---

### **22.8** Why 2PL not suitable for indexes? Alternative?
- **2PL not suitable**:
  - High contention on root nodes
  - Poor concurrency
- **Better scheme**:
  - B-link trees
  - Latches/semaphores for short duration

---

### **22.9** Timestamp vs locking protocols.
- **Timestamp**:
  - Orders transactions by start time
  - No locks, but restarts possible
- **Locking**:
  - Uses locks to control access
  - Can cause deadlocks

---

### **22.10** Basic timestamp ordering & Thomas’s write rule.
- **Basic protocol**:
  - Read if TS ≥ write-TS of item
  - Write if TS ≥ read-TS and write-TS
- **Thomas’s rule**:
  - Ignore obsolete writes
  - Increases concurrency

---

### **22.11** Advantages of nested transaction models.
- Modularity
- Finer concurrency control
- Independent recovery of subtransactions
- Intra-transaction parallelism

---

### **22.12** Pessimistic vs optimistic concurrency control.
- **Pessimistic**:
  - Assumes conflicts likely
  - Uses locking
- **Optimistic**:
  - Assumes conflicts rare
  - Validates before commit

---

### **22.13** Types of failure and need for recovery.
- **Failures**:
  - System crash
  - Media failure
  - Application error
  - Human error
- **Why recovery needed**:
  - Ensure durability
  - Restore consistent state

---

### **22.14** Log file and recovery.
- **Log file**:
  - Records before/after images
- **Forward recovery (redo)**:
  - Reapply committed transactions
- **Backward recovery (undo)**:
  - Reverse uncommitted transactions
- **Write-ahead log protocol**:
  - Log written before database update
- **Checkpoints**:
  - Reduce recovery time
  - Synchronize log and database

---

### **22.15** Nested vs multilevel transaction models.
- **Nested**:
  - Hierarchical subtransactions
  - Only leaves access data
- **Multilevel**:
  - Different abstraction levels
  - Exploits semantic knowledge

---

### **22.16** Oracle recovery concepts.
- **Instance recovery**:
  - Automatic after crash (redo + undo)
- **Point-in-time recovery**:
  - Restore to specific time/SCN
- **Standby database**:
  - Real-time backup site
- **Flashback technology**:
  - Query/restore historical data without restore

---

