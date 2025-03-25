
### **Summary of Reliable Data Transfer (RDT) Principles (Part 1)**

#### **1. Introduction to Reliable Data Transfer (Pages 1-5)**
- **Goal**: Enable reliable communication between sender and receiver over an **unreliable channel** (packet loss, corruption, reordering).  
- **Key Challenge**:  
  - Sender and receiver cannot observe each other’s state directly—must infer state via **message exchanges**.  
  - **Unidirectional data flow** (application layer) but **bidirectional control flow** (protocol layer).  

#### **2. RDT 1.0: Perfect Channel (Page 8)**
- **Assumption**: Channel is **flawless** (no loss, corruption, or reordering).  
- **Protocol**:  
  - **Sender**: Waits for data from app → creates packet → sends.  
  - **Receiver**: Waits for packet → extracts data → delivers to app.  
- **No recovery mechanisms needed** (trivial).  
![[Pasted image 20250325005010.png]]
#### **3. RDT 2.0: Bit Errors (Pages 9-14)**

##### **RDT 2.0 with No Errors 
![[Screenshot 2025-03-25 005914.png]]

- **Sender Actions**:
    
    1. Receives data from the application layer (`rdt_send(data)`).
        
    2. Creates a packet with a **checksum** (`make_pkt(data, checksum)`).
        
    3. Sends the packet (`udt_send(sndpkt)`).
        
    4. Waits for **ACK** (acknowledgment) or **NAK** (negative acknowledgment).
        
- **Receiver Actions**:
    
    1. Receives the packet (`rdt_rcv(rcvpkt)`).
        
    2. Checks for corruption:
        
        - If **not corrupt**: Extracts data, delivers to app, and sends **ACK**.
            
        - If **corrupt**: Sends **NAK** (not shown in this image).
            
    3. Sender receives **ACK** → Moves to next packet.
        

**Key Point**:

- ACKs confirm successful delivery; NAKs signal corruption.
    
- Uses **stop-and-wait** (sender waits for ACK/NAK before sending next packet).

##### **2. RDT 2.0 with Corrupted Packet 
![[Screenshot 2025-03-25 005955.png]]

- **Corruption Detected**:
    
    - Receiver checks the packet’s checksum and finds it **corrupt**.
        
    - Sends **NAK** back to the sender (`udt_send(NAK)`).
        
- **Sender Response**:
    
    - Receives NAK → **Retransmits** the same packet (`udt_send(sndpkt)`).
        
    - Continues waiting for ACK/NAK.
        

**Key Point**:

- Retransmission fixes errors, but **duplicate packets** can occur if ACKs/NAKs are lost/corrupted (addressed in **RDT 2.1** with sequence numbers).

---
#### **4. RDT 2.1: Handling Garbled ACKs/NAKs (Pages 16-18)**
- **Solution**: Add **1-bit sequence numbers** (0 or 1) to packets.  
  - Receiver discards duplicates (ignores retransmissions of already-received packets).  
- **Sender/Receiver FSMs**:  
  - **Sender**: Tracks whether it’s sending packet 0 or 1.  
  - **Receiver**: Tracks expected sequence number (0 or 1).  
- **Key Improvement**: Resolves ambiguity from corrupted ACKs/NAKs.  

#### **5. RDT 2.2: NAK-Free Protocol (Pages 19-20)**

##### **Key Improvement Over RDT 2.1**
RDT 2.2 achieves the **same reliability as RDT 2.1** but **eliminates NAKs entirely**, using only **ACKs with explicit sequence numbers**. This mirrors TCP's design.


##### **How It Works (From PDF Pages 19-20)**
1. **Receiver Behavior**:
   - Instead of sending NAKs for corrupted packets, the receiver:
     - **Re-sends the last ACK** for the *previous* correctly received packet.  
     - *Example*: If expecting seq=1 but gets corrupt seq=1, it re-sends `ACK(0)`.

2. **Sender Behavior**:
   - Treats **duplicate ACKs** (e.g., two `ACK(0)`s in a row) as equivalent to a NAK.  
   - *Example*:  
     - Sender sends `pkt(1)` → corrupted.  
     - Receiver replies with `ACK(0)` (duplicate).  
     - Sender infers loss/corruption and retransmits `pkt(1)`.


##### **Protocol Steps (From PDF Examples)**
1. **Normal Operation (No Errors)**:
   - Sender sends `pkt(0)` → Receiver replies `ACK(0)`.  
   - Sender sends `pkt(1)` → Receiver replies `ACK(1)`.  

2. **Corrupted Packet Handling**:
   - Sender sends `pkt(1)` → **Corrupted in transit**.  
   - Receiver detects corruption → re-sends `ACK(0)` (last good ACK).  
   - Sender sees duplicate `ACK(0)` → retransmits `pkt(1)`.

##### **Advantages Over RDT 2.1**
- **Simpler Control Flow**: No separate NAK logic.  
- **TCP Inspiration**: Modern protocols (like TCP) use this "ACK-only" approach with sequence numbers.  

##### **Why This Matters**
- **Robustness**: Handles corrupted/lost packets *and* corrupted ACKs.  
- **Efficiency**: Fewer message types (no NAKs) reduce protocol complexity.  

**Analogy**:  
- Like a teacher saying, "Repeat the last answer" (duplicate ACK) instead of "Wrong!" (NAK).  
- The student (sender) knows to retry without explicit criticism.













#### **6. Key Protocol Mechanisms (Page 49)**
- **Error detection**: Checksums.  
- **Feedback**: ACKs/NAKs (or duplicate ACKs).  
- **Retransmission**: On loss/corruption.  
- **Sequencing**: Detect duplicates (1-bit seq # suffices for stop-and-wait).  

#### **7. Human Analogy (Highlighted in Video)**
- **ACKs**: "I heard you!"  
- **NAKs**: "Say that again?"  
- **Retransmission**: Repeating a misunderstood phrase.  
- **Sequence Numbers**: "This is the 2nd time I’m saying this…"  

#### **8. Limitations of RDT 2.x**
- **Assumes no packet loss**—only bit errors.  
- **Next Step (RDT 3.0)**: Handle **lost packets** using timers (covered in Part 2).  

---  
**Next in Part 2**: RDT 3.0 (packet loss + errors) and pipelining (Go-Back-N, Selective Repeat).  

**Visual Aids**:  
- FSM diagrams for RDT 2.1 sender/receiver (Pages 16-17).  
- Sequence number handling (Page 18).  
- NAK-free operation (Page 20).  

