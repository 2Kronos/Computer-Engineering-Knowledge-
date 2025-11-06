

---

### **Chapter 22: Transaction Management – Summary**

#### **22.1 Transaction Support**
- A **transaction** is a logical unit of work that ensures the database moves from **one consistent state to another**.
- Follows **ACID properties**:
  - **Atomicity**: All or nothing execution.
  - **Consistency**: Preserves database consistency.
  - **Isolation**: Transactions run independently.
  - **Durability**: Committed changes are permanent.
- States: Active → Partially Committed → Committed / Failed → Aborted.

---

#### **22.2 Concurrency Control**
- Manages simultaneous transactions to prevent interference.
- **Problems without control**:
  - Lost update, uncommitted dependency, inconsistent analysis.
- **Solutions**:
  - **Locking (2PL)**: Guarantees serializability.
  - **Timestamping**: Orders transactions by start time.
  - **Optimistic methods**: Assume low conflict; validate before commit.
  - **Deadlock handling**: Prevention, detection, and recovery.

---

#### **22.3 Database Recovery**
- Restores database after failures (system crash, media failure, etc.).
- **Key facilities**:
  - **Backup mechanism**
  - **Log file** (before/after images)
  - **Checkpoints**
  - **Recovery Manager**
- **Techniques**:
  - **Deferred update**: Write only after commit.
  - **Immediate update**: Write as transactions execute (with write-ahead logging).
  - **Shadow paging**: Uses page tables for recovery.

---

#### **22.4 Advanced Transaction Models**
- Extend traditional models for **long-duration** and **complex applications**:
  - **Nested transactions**: Hierarchical subtransactions.
  - **Sagas**: Sequence of transactions with compensating actions.
  - **Multilevel transactions**: Different abstraction levels.
  - **Dynamic restructuring**: Split/join transactions.
  - **Workflow models**: Coordinated task execution across systems/people.

---

#### **22.5 Oracle Implementation**
- **Isolation levels**: READ COMMITTED (default), SERIALIZABLE, READ ONLY.
- **Multiversion read consistency**: Readers don’t block writers.
- **Automatic deadlock detection** and resolution.
- **Recovery**: Uses **RMAN**, flashback technology, and undo segments.
- **Flashback**: Enables point-in-time recovery without full restore.

---

### **Key Takeaway**
Transaction management ensures **data consistency**, **concurrency control**, and **recovery** in single and advanced applications, with real-world implementations like Oracle providing robust, scalable solutions.
