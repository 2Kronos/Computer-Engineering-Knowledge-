### **Reliable Data Transfer (RDT) Protocol Development - Part 2 Summary**

#### **1. Introduction to Packet Loss**
- In Part 1, we addressed channels that corrupt messages. Now, we extend the protocol to handle **packet loss**, a common issue in real-world networks (e.g., due to router congestion).
- Key question: **How do humans handle lost messages?**  
  - If no response is received, they **retransmit** after a timeout. This idea is central to RDT 3.0.

---

#### **2. RDT 3.0: Handling Loss and Corruption**
- **Key Mechanisms:**  
  - **Timeout and Retransmission:** Sender waits a "reasonable" time for an ACK. If none arrives, it retransmits the packet.  
  - **Sequence Numbers:** Receiver must explicitly ACK the sequence number of the received packet to handle duplicates.  
  - **Countdown Timer:** Introduced at the sender to trigger retransmission after a timeout.  

- **Sender FSM:**  
  - Similar to RDT 2.1/2.2 but with timer operations:  
    - Starts timer when sending a packet.  
    - Stops timer on receiving the correct ACK.  
    - On timeout, retransmits the oldest unacknowledged packet.  

- **Scenarios:**  
  - **Packet Loss:** Sender retransmits after timeout.  
  - **ACK Loss:** Receiver detects duplicates (using sequence numbers) and re-sends ACK.  
  - **Premature Timeout:** Handled via sequence numbers (duplicates are ignored).  

---

#### **3. Performance Issues with Stop-and-Wait (RDT 3.0)**
- **Low Sender Utilization:**  
  - Example: 1 Gbps link, 15 ms propagation delay, 8000-bit packet.  
  - Time to transmit packet: \( D_{trans} = \frac{L}{R} = 8 \mu s \).  
  - Total time per packet: \( RTT + \frac{L}{R} \).  
  - Utilization: \( U = \frac{L/R}{RTT + L/R} \approx 0.00027 \) (very inefficient!).  

- **Problem:** The sender is idle most of the time, underutilizing the high-speed channel.  

---

#### **4. Pipelining: Improving Efficiency**
- **Solution:** Allow multiple in-flight (unacknowledged) packets to fill the channel.  
- **Benefits:**  
  - Increases utilization by a factor of \( N \) (window size).  
  - Example: With 3-packet pipelining, utilization improves to ~0.00081 (3x better).  

- **Requirements:**  
  - Larger sequence number range.  
  - Buffering at sender/receiver.  

---

#### **5. Pipelined Protocols: Go-Back-N (GBN) and Selective Repeat (SR)**

##### **Go-Back-N (GBN)**  
- **Sender:**  
  - Maintains a window of up to \( N \) unacknowledged packets.  
  - Uses **cumulative ACKs** (e.g., ACK(n) acknowledges all packets up to \( n \)).  
  - On timeout, retransmits all packets in the window (starting from the oldest unacknowledged).  

- **Receiver:**  
  - ACKs the highest in-order packet received.  
  - Discards out-of-order packets (no buffering).  

- **Example:**  
  - Packet 2 is lost → Receiver sends duplicate ACK 1.  
  - Sender times out and retransmits packets 2, 3, 4, 5.  

##### **Selective Repeat (SR)**  
- **Sender:**  
  - Individual ACKs for each packet.  
  - Retransmits only the lost packet (not the entire window).  

- **Receiver:**  
  - Buffers out-of-order packets.  
  - Sends **individual ACKs** for each correctly received packet.  

- **Example:**  
  - Packet 2 is lost → Receiver buffers packets 3, 4, 5 and sends ACK 1, ACK 3, etc.  
  - Sender retransmits only packet 2 on timeout.  

---

#### **6. Key Takeaways**
- **RDT 3.0** handles loss/corruption but suffers from low efficiency due to stop-and-wait.  
- **Pipelining (GBN/SR)** improves utilization by allowing multiple in-flight packets.  
  - **GBN:** Simpler (no receiver buffering) but less efficient (retransmits entire window).  
  - **SR:** More complex (buffering, individual ACKs) but more efficient (retransmits only lost packets).  
- **TCP** uses a hybrid approach (GBN-like cumulative ACKs + SR-like optimizations).  

---

#### **Next Steps**
- Apply these principles to **TCP**, which builds on RDT 3.0 and pipelining for reliable, efficient data transfer.  

This concludes the development of reliable data transfer protocols. The next step is to explore how these concepts are implemented in TCP.