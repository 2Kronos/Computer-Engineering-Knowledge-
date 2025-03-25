![Pasted image 20250130234638](https://github.com/user-attachments/assets/1ce857e8-2b2f-40ed-941d-620b207bf27e)

##### **Application Layer**:  
- Includes **application layer protocols** that govern the **sending and receiving of messages** between distributed components of an application.  
- These protocols enable communication between application processes running on different hosts.  
---
##### **Transport Layer**:  
- Responsible for transporting **application layer messages** from one process to another across a network.  
- Key considerations:  
  - Packets may be **lost** during transmission (e.g., dropped in router buffers).  
  - The transport layer may provide:  
    - **No reliability guarantee** (e.g., UDP in the Internet).  
    - **Reliable data transfer** (e.g., TCP in the Internet), ensuring data is delivered correctly even if the underlying network loses packets.  
- **TCP (Transmission Control Protocol)**:  
  - Implements reliable data transfer on top of an unreliable network layer.  

---
##### **Network Layer**:  
- Responsible for transporting data from **one end device (host) to another**.  
- **Service Model**:  
  - The network layer may or may not provide **reliable transport**, depending on the service model.  
  - In the **Internet**, the network layer provides a **best-effort service**:  
    - It makes **no guarantees** about reliability, delivery, or order of packets.  
    - It simply tries its best to deliver packets.  

- **Key Distinction**:  
  - **Host-to-Host Transfer**:  
    - Handled by the **network layer**.  
    - Focuses on delivering data between devices (hosts).  
  - **Process-to-Process Transfer**:  
    - Handled by the **transport layer**.  
    - Focuses on delivering data between specific processes (applications) on hosts.  

---
##### **Link Layer**:  
- Responsible for transferring data between **two network devices** that are directly connected by the **same communication link**.  
- Ensures reliable and error-free communication over the link.  
---
##### **Physical Layer**:  
- Controls the **sending of raw bits** (0s and 1s) into the communication link.  
- Deals with the physical transmission medium (e.g., cables, wireless signals) and hardware-level signaling.  

# Service, Layering and encapsulation

### **Application Layer**:  
- Distributed pieces of an application **exchange messages** with each other.  
- The unit of data exchanged at this layer is called a **message** (also known as a **Protocol Data Unit (PDU)**).  

---

### **Transport Layer**:  
- Takes the **application layer message** and adds additional information to create a new data unit called a **transport layer segment**.  
- **Transport Layer Segment**:  
  - The unit of data exchanged between transport layer entities.  
  - Contains:  
    - Information to identify the **destination process** (since multiple processes may run on the destination host).  
    - Additional control information (e.g., for **reliable data transfer** in protocols like TCP).  

---

### **Network Layer**:  
- Encapsulates the **transport layer segment** and adds its own **network layer header information (Hₙ)**.  
- Creates a **network layer datagram**, which is the PDU used at the network layer.  
- **Network Layer Header (Hₙ)**:  
  - Used to implement the network layer service (e.g., routing, addressing).  
  - In the Internet's **IP protocol**, the header contains:  
    - **Source and destination IP addresses**.  

---

### **Link Layer**:  
- Encapsulates the **network layer datagram** and adds its own **link layer information**.  
- Creates a **frame**, which is the PDU used at the link layer.  
- **Frame**:  
  - Transferred between link layer sender and receiver.  
  - Contains link-layer-specific information (e.g., MAC addresses, error detection).  

---

### **Encapsulation**:  
- The process of taking a data unit from a **higher layer**, adding information, and creating a new PDU at a lower layer.  
- Occurs at **every layer** of the Internet protocol stack.  
- A **fundamental concept** in networking.  
---

# Kuros answers

## Q1 

1. **Protocols that are part of a distributed network application.**  
    **Answer:** A. Application Layer
    
2. **Transfer of data between one process and another process (typically on different hosts).**  
    **Answer:** E. Transport Layer
    
3. **Delivery of datagrams from a source host to a destination host (typically).**  
    **Answer:** D. Network Layer
    
4. **Transfer of data between neighboring network devices.**  
    **Answer:** C. Link Layer
    
5. **Transfer of a bit into and out of a transmission media.**  
    **Answer:** B. Physical Layer
    

# Q2
- **Application layer →** **B. Message**
    
- **Transport layer →** **A. Segment**
    
- **Network layer →** **D. Datagram**
    
- **Link layer →** **E. Frame**
    
- **Physical layer →** **C. Bit**