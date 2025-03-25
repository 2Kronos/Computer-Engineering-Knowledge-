# **Network Systems 3 - Evaluation 1 Study Notes**  
**Based on Study Guide: Chapters 1, 2, 3**  

---

## **Chapter 1: Computer Networks and the Internet**  

### **1. Understanding the Internet**  
- **Internet**: A global network of interconnected networks using TCP/IP protocols.  
- **Key Components**:  
  - **Hosts (End Systems)**: Devices (e.g., PCs, smartphones, servers) running network apps.  
  - **Communication Links**: Physical (fiber, copper) or wireless (Wi-Fi, cellular).  
  - **Packet Switches**: Routers (network layer) and switches (link layer) forward packets.  
  - **ISPs (Internet Service Providers)**: Provide access (e.g., Comcast, AT&T).  

### **2. Network Edge vs. Core**  
- **Edge**: Hosts and access networks (e.g., home, enterprise networks).  
- **Core**: Interconnected routers that route packets across the Internet.  

### **3. Performance Metrics**  
#### **Delay**  
- **Types**:  
  1. **Processing Delay**: Time to check packet headers (microseconds).  
  2. **Queuing Delay**: Time waiting in router buffers (depends on traffic).  
  3. **Transmission Delay**: Time to push packet onto link = *Packet Size (L) / Link Bandwidth (R)*.  
  4. **Propagation Delay**: Time for signal to travel = *Distance (d) / Propagation Speed (s)*.  
- **Total Delay**: Sum of all delays.  

#### **Throughput**  
- **Rate of data transfer** (bits/sec) between sender/receiver.  
- **Bottleneck**: Minimum bandwidth link along the path.  

#### **Round-Trip Time (RTT)**  
- Time for a packet to go to destination and return.  

### **4. Encapsulation**  
- **Layered Protocol Stack**:  
  - Application → Transport → Network → Link → Physical.  
- **Headers** are added at each layer (e.g., HTTP → TCP → IP → Ethernet).  

### **5. Access Technologies**  
- **DSL/Cable**: Wired broadband (shared medium in cable).  
- **FTTH**: Fiber to the home (high-speed).  
- **Wireless (Wi-Fi, 4G/5G)**: Mobile and LAN access.  

---

## **Chapter 2: Application Layer**  

### **1. Application Architectures**  
- **Client-Server**:  
  - Clients request services (e.g., web browser), servers provide them (e.g., web server).  
  - Centralized, scalable with data centers.  
- **P2P (Peer-to-Peer)**:  
  - Peers act as both clients and servers (e.g., BitTorrent).  
  - Decentralized, scalable but harder to manage.  

### **2. HTTP (HyperText Transfer Protocol)**  
- **Web’s application-layer protocol**. Uses TCP on port 80 (HTTP) or 443 (HTTPS).  
- **Stateless**: No memory of past requests.  
- **HTTP Methods**:  
  - `GET`: Request data.  
  - `POST`: Submit data.  
  - `HEAD`: Request headers only.  
- **HTTP/1.1 vs. HTTP/2**:  
  - **Persistent Connections**: Reuse TCP connection for multiple requests.  
  - **Pipelining**: Send multiple requests without waiting for responses (HTTP/1.1).  
  - **Multiplexing**: Send multiple streams over one connection (HTTP/2).  

### **3. Web Caching (Proxy Servers)**  
- Stores copies of web objects to reduce latency/bandwidth.  
- **Conditional GET**: Cache checks with server if object is updated.  

### **4. Process Communication (Sockets)**  
- **Socket**: Interface between app and transport layer.  
- **Port Numbers**: Identify processes (e.g., HTTP: 80, SMTP: 25).  

---

## **Chapter 3: Transport Layer**  

### **1. TCP vs. UDP**  
| **Feature**       | **TCP**                          | **UDP**                          |  
|-------------------|----------------------------------|----------------------------------|  
| **Reliability**   | Reliable (acknowledgments)       | Unreliable (no ACKs)             |  
| **Connection**    | Connection-oriented (handshake)  | Connectionless                   |  
| **Flow Control**  | Yes (sliding window)             | No                               |  
| **Congestion Ctrl**| Yes (AIMD)                      | No                               |  
| **Use Cases**     | Web, email, file transfer        | VoIP, video streaming, DNS       |  

### **2. Reliable Data Transfer (RDT)**  
- **RDT 2.2**: Handles bit errors (ACKs/NAKs).  
- **RDT 3.0**: Adds timeout for lost packets.  

### **3. Pipelining Protocols**  
- **Go-Back-N (GBN)**:  
  - Sender sends *N* packets without waiting.  
  - On error, retransmits *all* packets from lost one.  
- **Selective Repeat (SR)**:  
  - Only retransmits lost/damaged packets.  

### **4. TCP Features**  
- **Congestion Control**:  
  - **AIMD (Additive Increase, Multiplicative Decrease)**:  
    - Increase window size slowly, halve on loss.  
  - **Slow Start**: Exponential growth until threshold.  
- **Flow Control**: Adjusts window size to prevent receiver overload.  
- **3-Way Handshake**: SYN → SYN-ACK → ACK.  

### **5. TCP State Diagram**  
- States: `CLOSED → LISTEN → SYN_SENT → ESTABLISHED → FIN_WAIT → CLOSED`.  

---

## **Key Formulas**  
- **Total Delay** = Processing + Queuing + Transmission + Propagation.  
- **Transmission Delay** = *L / R*.  
- **Throughput** = min(*R₁, R₂, ..., Rₙ*).  
- **RTT** = Time for packet to go and return.  

---

## **Study Tips**  
- **Practice Calculations**: Delay, throughput, RTT.  
- **Draw Diagrams**: TCP state transitions, RDT protocols.  
- **Compare**: HTTP/1.1 vs. HTTP/2, TCP vs. UDP.  
- **Review Textbook Exercises**: Especially RDT and congestion control.  

Good luck! 🚀