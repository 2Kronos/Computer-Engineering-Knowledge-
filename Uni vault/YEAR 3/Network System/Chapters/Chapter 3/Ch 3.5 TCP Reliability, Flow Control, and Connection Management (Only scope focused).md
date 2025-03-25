### **TCP Flow Control vs. Congestion Control**

#### **1. Flow Control** (Manages sender speed based on receiver capacity)

- Prevents overwhelming the **receiver** by ensuring it gets data at a manageable rate.
- Uses a **receiver window (rwnd)**, which tells the sender how much data it can send before waiting for an acknowledgment.
- Example: If a receiver can only handle 10 KB at a time, the sender won’t send more than that before receiving an acknowledgment.

#### **2. Congestion Control** (Manages sender speed based on network capacity)

- Prevents **network congestion** by adjusting the sending rate based on available bandwidth.
- Uses mechanisms like:
    - **Slow Start**: Starts with a small sending rate and increases gradually.
    - **Congestion Avoidance**: Reduces speed when packet loss is detected.
    - **Fast Retransmit & Fast Recovery**: Quickly resends lost packets to maintain performance.
- Example: If too many packets are lost due to congestion, TCP slows down transmission to prevent further packet loss.

### **Key Difference**

- **Flow control** protects the **receiver** from being overwhelmed.
- **Congestion control** protects the **network** from being overloaded.

# TCP 3-way handshake 

![[Pasted image 20250325034512.png]]

### **TCP 3-Way Handshake (From the Image Above)**

The **TCP 3-way handshake** is the process used to establish a reliable connection between a client and a server before data transmission. It consists of three steps:

#### **1. SYN (Synchronization) – Client to Server**

- The **client** initiates the connection by sending a **SYN (synchronize) message** with an initial sequence number **x** to the server.
- This places the client in the **SYN-SENT** state.

#### **2. SYN-ACK (Synchronization + Acknowledgment) – Server to Client**

- The **server** responds with a **SYN-ACK** message:
    - SYNbit = 1 (indicating a synchronization request).
    - Sequence number **y** (server's own initial sequence number).
    - Acknowledgment number **x+1** (confirming receipt of the client’s SYN).
- The server moves to the **SYN-RCVD** state.

#### **3. ACK (Acknowledgment) – Client to Server**

- The **client** sends an **ACK** back to the server:
    - ACKbit = 1 (confirming acknowledgment).
    - ACKnum = **y+1** (confirming receipt of the server’s SYN).
- Both client and server enter the **ESTABLISHED** state, meaning the connection is ready for data transmission.

### **Key Points**

- The **handshake ensures a reliable connection** before data transfer.
- The **SYN-ACK exchange** confirms both sides are ready.
- The **final ACK completes** the connection setup.
- Once established, **both parties can send data** securely.

