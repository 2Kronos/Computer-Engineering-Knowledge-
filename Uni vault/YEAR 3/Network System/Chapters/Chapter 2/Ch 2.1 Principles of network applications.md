## **Network application Models**
### **1. Client-Server Model**

- A **central server** provides services (e.g., websites, files) to multiple **clients**.
- Clients **request** data, and the server **responds**.
- **Example:** Websites (Google, Facebook) → Your browser (client) requests a webpage from the server.

**Pros:**  
✅ Centralized control (easier to manage).  
✅ More secure (data stored on the server).  
✅ Scalable for large networks.

**Cons:**  
❌ Server failure can stop all clients.  
❌ Expensive to maintain powerful servers.

---

### **2. Peer-to-Peer (P2P) Model**

- **No central server** – all devices (peers) share data directly.
- Each device acts as both a **client** and a **server**.
- **Example:** Torrent file sharing, Bitcoin transactions.

**Pros:**  
✅ No central failure point.  
✅ Scales well with more users.  
✅ Cheaper (no need for a big server).

**Cons:**  
❌ Harder to manage security.  
❌ Can be slower if peers disconnect.

🔹 **Client-Server is structured & reliable, P2P is decentralized & flexible!** 🚀

## **Sockets**



### **Application Programming Interface (API) to Transport Layer**:  
- Uses an abstraction called a **socket**.  
- A **socket** is like a **door**:  
  - Created by the process for sending and receiving messages.  
  - Messages are sent **into the socket** and received **out of the socket**.  

### **Communication Process**:  
- The sending and receiving processes rely on the **underlying infrastructure**:  
  - **Transport layer**, **network layer**, and **link layer** work together to deliver messages.  
- Messages are delivered from a **socket at the sending process** to a **socket at the receiving process**.  

### **Key Point**:  
- **Two sockets** are involved in communication:  
  - One on the **sender’s side**.  
  - One on the **receiver’s side**.  

---

## **Addressing processes**

### **Socket Creation**:

- When a socket is created, it has **two key pieces of information**:
    
    1. **IP Address of the Host**:
        
        - Identifies the device (host) on the network.
            
    2. **Port Number**:
        
        - Identifies the specific process or application on the host.

----
## **Internet transport protocols services**
### **Why Does UDP Exist?**

- UDP (User Datagram Protocol) is a lightweight transport layer protocol that provides minimal services:
    
    - **No reliability** (no guarantees for delivery, order, or error correction).
        
    - **No congestion control**.
        
    - **No connection establishment** (connectionless).
        
- **Advantages of UDP**:
    
    - **Low overhead**: Faster and more efficient for applications that don’t need reliability.
        
    - **Flexibility**: Allows applications to implement their own custom services (e.g., reliability, error correction) at the **application layer**.
        
- **Use Cases**:
    
    - Adopted by many **application layer protocols** (e.g., DNS, VoIP, video streaming) where speed and low latency are more important than reliability.
---

### **Transport Layer Security (TLS)**:

- A widely used **security layer** (or **shim layer**) implemented on top of **TCP sockets**.
    
- Operates in **user application space**.
    

### **Key Services Provided by TLS**:

1. **Encryption**:
    
    - Secures data in transit to prevent eavesdropping.
        
2. **Data Integrity**:
    
    - Ensures data is not tampered with during transmission.
        
3. **Endpoint Authentication**:
    
    - Verifies the identity of the communicating parties.
        

### **Use Case**:

- TLS is used by applications to provide secure communication over the Internet (e.g., HTTPS for secure web browsing).
