### **SMTP (Simple Mail Transfer Protocol)**:

- Defined in **RFC 5321**.
    
- Operates on top of **TCP** for reliable email message transfer.
    
- Uses **port 25** as the standard server port.
    
### **Email Transfer Process**:

1. **Direct Transfer**:
    
    - Email messages are transferred directly from the **sending server** (acting as a client) to the **receiving server**.
        
2. **Three Phases of Message Transfer**:
    
    - **SMTP Handshaking**:
        
        - Involves the exchange of three messages:
            
            1. Server sends a **220** message to the client.
                
            2. Client sends a **HELO** (or **EHLO**) command.
                
            3. Server responds with a **HELO** (or **EHLO**) acknowledgment.
                
    - **Message Transfer**:
        
        - The actual email message is transferred.
            
    - **Connection Closure**:
        
        - The SMTP connection is closed, followed by the TCP connection.
            

### **Key Characteristics of SMTP**:

- **Command-Response Interaction**:
    
    - Similar to HTTP, uses **ASCII text** for human-readable commands and responses.
        
    - Includes **status codes** and **phrases** (e.g., 220, HELO).

---

### **HTTP vs. SMTP**:

1. **HTTP**:
    
    - A **pull protocol**: The client (browser) pulls data from the server.
        
    - Typically involves **one object per request**.
        
2. **SMTP**:
    
    - A **push protocol**: The client (user agent or mail server) pushes messages to the server.
        
    - Can involve **multiple objects encoded into a single message**.
        

---

### **Key Characteristics of SMTP**:

1. **Human-Readable Messages**:
    
    - Encoded in **7-bit ASCII** format.
        
    - Includes **status codes** and phrases (similar to HTTP).
        
2. **Persistent Connections**:
    
    - Multiple email messages can be transferred over a **single SMTP connection**.
        
3. **Message Termination**:
    
    - Messages are terminated by a line containing only a **period (.)**.
        

### **Historical Note**:

- HTTP drew some of its design inspiration from SMTP.
  
  ---
-