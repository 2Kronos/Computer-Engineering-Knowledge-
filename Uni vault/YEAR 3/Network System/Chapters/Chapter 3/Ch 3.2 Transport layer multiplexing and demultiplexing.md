
### **Multiplexing/demultiplexing**

1. **Demultiplexing**:
    
    - The process of directing incoming **datagram payloads** to the appropriate **application** or **protocol** running on a host.
        
    - Example: A host receives datagrams bound for different applications (e.g., web browser, email client) and directs them to the correct sockets.
        
2. **Multiplexing**:
    
    - The process of combining multiple application-layer messages into a single transport-layer segment for transmission.
        
    - Example: Multiple applications send messages through their sockets to TCP, which funnels them into IP for delivery.

### **How demultiplexing works**
![[Screenshot 2025-03-23 181701.png]]


1. **Multiplexing (Sender Side)**:
    
    - Processes **P1** and **P2** send data through their sockets to the transport layer.
        
    - The transport layer:
        
        - Combines data from multiple processes into segments.
            
        - Adds transport header information (e.g., **source port** and **destination port**) for later demultiplexing.
            
2. **Demultiplexing (Receiver Side)**:
    
    - When datagrams arrive at the receiving host, the transport layer:
        
        - Uses header information (e.g., **source port** and **destination port**) to direct the received segments to the correct socket.
            
        - Delivers the data to the appropriate application process (e.g., **P3** or **P4**).
            
3. **Key Points**:
    
    - **Port Numbers**: Used to identify the correct socket and application process.

4. **IP Datagram and Transport Segment**:  
   - Each IP datagram contains:  
     - **Source IP address**: IP address of the sender.  
     - **Destination IP address**: IP address of the receiving host.  
     - A **transport layer segment** with a header containing:  
       - **Source port number**.  
       - **Destination port number**.  

---


#### **Connectionless demultiplexing (UDP)**

1. **Socket Creation**:
    
    - When creating a UDP socket, the application programmer specifies a **host-local port number** (e.g., `12534` in the code fragment).
        
2. **Sending a Datagram**:
    
    - When sending a datagram, the application specifies:
        
        - **Destination IP address**.
            
        - **Destination port number** (not the localhost port number).
            
3. **Receiving Side**:
    
    - When the receiving host gets a UDP segment, it:
        
        - Checks the **destination port number** in the segment.
            
        - Directs the segment to the socket associated with that port number.
          
4. **UDP Demultiplexing Process**:
    
    - The receiving host uses the **destination IP address** and **destination port number** to direct the segment to the appropriate socket.
        
    - **Socket Identification**:
        
        - Each socket is associated with a unique **port number**.
            
        - The host checks the **destination port number** in the UDP segment and forwards the data to the corresponding socket.
            
5. **Key Points**:
    
    - UDP demultiplexing is **connectionless** and relies on **port numbers** and **IP addresses**.
        
    - Simpler than TCP demultiplexing, as UDP does not maintain connection state.

##### **UDP Demultiplexing with Multiple Clients**:

1. **Multiple Clients to One Port**:
    
    - Multiple clients can send datagrams to the **same UDP port number** at a destination.
        
2. **Demultiplexing Based on Destination Port**:
    
    - UDP demultiplexing is **solely based on the destination port number**.
        
    - Even if datagrams come from different **source IP addresses** and **source port numbers**, they are directed to the **same socket** at the receiving host if they share the same **destination port number**.
        
3. **Key Point**:
    
    - UDP does not distinguish between different clients based on source IP or port; it only uses the **destination port number** for demultiplexing

### **Example 
![[Screenshot 2025-03-23 181701 1.png]]

1. **Scenario**:
    
    - Three hosts are involved:
        
        - **P3** (left): Creates a datagram socket with local port **9157**.
            
        - **P1** (middle): Creates a datagram socket with local port **6428**.
            
        - **P4** (right): Creates a datagram socket with local port **5775**.
            
    - **P1** communicates with **P3** and **P4**.
        
2. **Data Exchange Between P1 and P3**:
    
    - **P1** sends a datagram to **P3**:
        
        - **Source port**: `6428` (P1’s socket).
            
        - **Destination port**: `9157` (P3’s socket).
            
    - **P3** replies to **P1**:
        
        - **Source port**: `9157` (P3’s socket).
            
        - **Destination port**: `6428` (P1’s socket).
            
3. **Key Points**:
    
    - **Source and Destination Ports**:
        
        - The **source port** of the sender becomes the **destination port** for the reply.
            
    - **Demultiplexing**:
        
        - The receiving host uses the **destination port number** to direct the datagram to the correct socket.
            

---


#### **Connection - oriented demultiplexing(TCP)**

1. **Connection-Oriented Nature**:
    
    - TCP is **connection-oriented**, meaning it establishes a connection between the sender and receiver.
        
2. **TCP Socket Identification**:
    
    - A TCP socket is identified by a **four-tuple**:
        
        - **Source IP address**.
            
        - **Source port number** (sending side).
            
        - **Destination IP address**.
            
        - **Destination port number** (receiving side).
            
3. **Demultiplexing in TCP**:
    
    - The receiver uses **all four values** in the four-tuple to direct a segment to the appropriate socket.
        
4. **Server-Side TCP Sockets**:
    
    - A server can have **multiple simultaneous TCP sockets**, each identified by a unique four-tuple.
        
    - Each socket is associated with a different **client process**
### **Example**

![[pic 2 1.png]]

1. **TCP Socket Identification**:
    
    - TCP sockets are uniquely identified by a **four-tuple**:
        
        - **Source IP address**.
            
        - **Source port number**.
            
        - **Destination IP address**.
            
        - **Destination port number**.
            
2. **Underlying Principle**:
    
    - TCP uses the **four-tuple** to ensure data is delivered to the correct socket, even when multiple connections exist between the same hosts.
        
    - This allows a server to handle **multiple simultaneous connections** from different clients, each with its own unique socket.
        
3. **Port 80**:
    
    - The **destination port number 80** is the standard port for HTTP service, used by the Apache server to handle web requests.

----

### **Key Concept: TCP Demultiplexing Using the Four-Tuple**:

1. **TCP vs. UDP Demultiplexing**:
    
    - **UDP**: Demultiplexing is based solely on the **destination port number**.
        
    - **TCP**: Demultiplexing is based on the **four-tuple**:
        
        - **Source IP address**.
            
        - **Source port number**.
            
        - **Destination IP address**.
            
        - **Destination port number**.
            
2. **Critical Observation**:
    
    - In the example, all three datagrams arriving at the HTTP server have the same **destination port number (80)**.
        
    - However, because TCP is **connection-oriented**, it uses the **four-tuple** to uniquely identify each connection and correctly demultiplex the datagrams to the appropriate processes (**P4**, **P5**, and **P6**).
        
3. **Underlying Principle**:
    
    - TCP’s use of the **four-tuple** ensures that multiple connections to the same destination port (e.g., port 80 for HTTP) can coexist and be handled independently.
4. Multiplexing and demultiplexing occur at **all layers** of the protocol stack, not just the transport layer.