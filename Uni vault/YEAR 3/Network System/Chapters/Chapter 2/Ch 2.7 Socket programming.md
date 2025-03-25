### **Sockets in Client-Server Applications**:

1. **Role of Sockets**:
    
    - Sockets are the **only API** that sits between the **application layer** and the **transport layer**.
        
    - They enable communication over the Internet for distributed applications.
        
2. **Operating System Perspective**:
    
    - **Application Layer**: Runs in **user space** (outside the operating system).
        
    - **Transport Layer and Below**: Runs in **kernel space** (inside the operating system).
        
    - Sockets act as the **interface** (or "door") between the application layer and the transport layer.
        
3. **Key Functionality**:
    
    - Sockets allow applications to:
        
        - Send and receive messages over the Internet.
            
        - Access transport layer services (e.g., TCP or UDP).
---
### **Transport Layer Services in the Internet Socket API**:

1. **TCP (Transmission Control Protocol)**:
    
    - Provides **reliable**, **congestion-controlled**, and **flow-controlled** data transfer.
        
    - Offers a **byte-stream-oriented** service, ensuring data is delivered in the correct order.
        
2. **UDP (User Datagram Protocol)**:
    
    - Provides an **unreliable**, **datagram-oriented** service.
        
    - Does not guarantee delivery, order, or error correction.
---

### **UDP Socket Programming Example**:

1. **Application Overview**:
    
    - **Client**: Reads a line of characters from the keyboard, sends it to the server.
        
    - **Server**: Receives the data, converts characters to uppercase, and sends the modified data back to the client.
        
    - **Client**: Receives the uppercase data and displays it on the screen.
        
2. **UDP Characteristics**:
    
    - **Connectionless**: No handshaking or connection setup between client and server.
        
    - **Explicit Addressing**: Client must include the server’s **IP address** and **port number** in each datagram.
        
    - **Unreliable and Unordered**: Data can be lost or arrive out of order.
        
3. **Steps for UDP Socket Programming**:
    
    - **Client Side**:
        
        1. Create a UDP socket using `socket(AF_INET, SOCK_DGRAM)`.
            
        2. Attach the server’s IP address and port number to the message.
            
        3. Send the message to the server using the socket.
            
        4. Receive the server’s response and display it.
            
        5. Close the socket.
            
    - **Server Side**:
        
        1. Create a UDP socket using `socket(AF_INET, SOCK_DGRAM)`.
            
        2. Bind the socket to a specific port (optional for the client, required for the server).
            
        3. Receive the client’s message and extract the client’s IP address and port number.
            
        4. Process the message (e.g., convert to uppercase).
            
        5. Send the response back to the client using the client’s IP address and port number.
            
        6. Close the socket.
            
4. **Key Points**:
    
    - **Port Numbers**: Some are standardized (e.g., port 80 for HTTP, port 53 for DNS).
        
    - **No Directory Service**: Clients must know the server’s IP address and port number in advance.
        
    - **Socket Creation**:
        
        - `AF_INET`: Specifies an Internet socket using IPv4.
            
        - `SOCK_DGRAM`: Specifies a UDP socket.
---

### **TCP Socket Programming**:

1. **New Socket for Each Connection**:
    
    - A **new socket** is created on the server side every time a TCP client initiates a connection.
        
    - This socket is **dedicated** to communication with that specific client for the duration of the TCP connection.
        
2. **TCP Connection as a "Pipe"**:
    
    - The TCP connection acts like a **pipe** between the client and server.
        
    - Provides **reliable**, **in-order**, **byte-stream** transfer of data.
        
3. **Server-Side Socket**:
    
    - The server-side socket is the endpoint of the pipe, handling communication with the client.

----
### **TCP Client-Server Interaction**:

1. **Connection-Oriented Service**:
    
    - Unlike UDP, TCP requires a **connection** to be established before data exchange.
        
    - The client and server perform a **three-way handshake** to set up the TCP connection.
        
2. **Socket Attachment**:
    
    - One end of the TCP connection is attached to the **client TCP socket**.
        
    - The other end is attached to a **server-side TCP socket**.
        
3. **Server-Side Setup**:
    
    - The server must first:
        
        - Create a **listening socket** to accept incoming connection requests.
            
        - Wait for a client to initiate a connection.
            
    - Once a connection is established, the server creates a **new socket** dedicated to that client.

----
### **TCP Client-Server Interaction**:

1. **Server-Side Setup**:
    
    - The server creates a **welcoming socket** (also called a **listening socket**).
        
        - This socket waits for incoming connection requests from clients.
            
    - The server invokes the **`accept` method** on the welcoming socket.
        
        - This is a **blocking call**, causing the server to wait until a client connects.
            
2. **Client-Side Setup**:
    
    - The client creates a **TCP socket**, specifying the server’s name and port number.
        
    - Creating this socket triggers a **TCP connection request** (sent by the transport layer, not the application).
        
3. **Connection Establishment**:
    
    - When the server receives the client’s connection request:
        
        - A **new socket** (called the **connection socket**) is created on the server side.
            
        - The server-side application uses this connection socket to communicate with the client.
            
        - A **TCP-level message** is sent from the server’s operating system to the client to confirm the connection.
            
4. **Message Exchange**:
    
    - The client and server exchange messages using their respective sockets:
        
        - The server uses the **connection socket**.
            
        - The client uses the **client-side socket** it created earlier.
            
5. **Key Points**:
    
    - The **welcoming socket** is only used to accept incoming connections.
        
    - The **connection socket** is used for actual communication with the client.

---
