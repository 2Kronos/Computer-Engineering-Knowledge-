
### **Overview**
#### **Topics to Cover in Transport Layer**:

1. **Logical Communication**:
    
    - How application processes running on **different hosts** communicate logically.
        
2. **Transport Protocols**:
    
    - The role of transport protocols in enabling communication.
        
    - Actions taken by the **sending and receiving sides** to ensure reliable or unreliable data transfer.
        
3. **Internet Transport Protocols**:
    
    - **TCP (Transmission Control Protocol)**:
        
        - Provides **reliable**, **connection-oriented** communication.
            
    - **UDP (User Datagram Protocol)**:
        
        - Provides **unreliable**, **connectionless** communication.
---
### **Transport vs network layer services and protocols: Ann house example **

Here’s how the actual layers of the network stack relate to the house analogy:

- **Application Layer (Kids Writing Letters)**
    
    - This layer includes the software applications that generate and receive messages (e.g., web browsers, email clients).
    - In the analogy, the kids (processes) write letters (messages) to each other.
- **Transport Layer (Ann Distributing the Letters Inside Her House)**
    
    - This layer ensures the correct process within a host gets the message.
    - In the analogy, Ann (the transport layer) receives the letters at her house and gives them to the correct child (process).
    - Example: TCP and UDP.
- **Network Layer (Postal Service Delivering Letters Between Houses)**
    
    - This layer is responsible for moving packets (Datagrams) from one device to another across the network.
    - In the analogy, the Postal Service (network layer) is responsible for delivering letters between houses (hosts).
    - Example: IP (Internet Protocol).
- **Data Link Layer (Local Mail Delivery System)**
    
    - This layer is responsible for the actual transmission of packets over a specific physical link, like Ethernet or Wi-Fi.
    - In the analogy, this would be the postal carrier delivering the letter within a neighborhood.
- **Physical Layer (The Roads and Vehicles Moving Letters)**
    
    - This is the lowest level, responsible for transmitting raw data bits over physical media like fiber optics, radio waves, or cables.
    - In the analogy, this would be the actual roads, mail trucks, and infrastructure that allow letters to move between houses.

In short:

- **Application Layer:** Kids writing letters (software processes exchanging messages).
- **Transport Layer:** Ann distributing letters to the correct child (delivers data to the correct process).
- **Network Layer:** The postal service (routes data from one host to another).
- **Data Link Layer:** Local mail carriers (handles delivery over specific network links).
- **Physical Layer:** The roads and vehicles (the physical transmission of data).

-----
### **Transport layer actions**

1. **Sender Side**:
    
    - An **application layer process** creates a message and sends it to the transport layer via a **socket**.
        
    - The transport layer:
        
        - Determines the necessary **header fields** for the transport layer segment.
            
        - Creates the segment and passes it to the **network layer** (e.g., IP protocol).
            
    - The network layer delivers the **IP datagram** from the sender to the receiver.
        
2. **Receiver Side**:
    
    - The transport layer receives the segment from the network layer.
        
    - It performs the following actions:
        
        - **Checks header fields** (e.g., for corruption).
            
        - Extracts the **application layer message**.
            
        - **Demultiplexes** the message to the appropriate application layer socket.
-----
### **Two principal Internet transport protocols**

1. **TCP (Transmission Control Protocol)**:
    
    - Provides **reliable**, **in-order delivery** of data between application processes.
        
    - Implements **congestion control** and **flow control**.
        
    - Requires a **connection** to be established, with connection state maintained at both sender and receiver.
        
2. **UDP (User Datagram Protocol)**:
    
    - Provides **unreliable**, **best-effort delivery**.
        
    - Messages may be **lost**, **duplicated**, or **delivered out of order**.
        
    - A **no-frills**, lightweight protocol with minimal overhead.
---

