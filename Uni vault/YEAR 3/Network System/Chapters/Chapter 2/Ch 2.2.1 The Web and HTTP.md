
### **HTTP as a Stateless Protocol**:

- **Statelessness**:
    
    - The server **does not maintain any internal state** about ongoing requests.
        
    - Each request is **independent** and treated as a new transaction.
        
- **Request-Reply Model**:
    
    - A single request is made for an object, and a single reply is sent back.
        
    - No tracking of multi-step transactions or intermediate states.
        
- **Advantages of Statelessness**:
    
    - **Simplicity**: Easier to implement and scale.
        
    - No need to handle:
        
        - **State cleanup** in case of failures.
            
        - **Rollback** to previous states.
            
        - **Inconsistent state resolution**.
---
# Why http uses TCP

HTTP (HyperText Transfer Protocol) uses TCP (Transmission Control Protocol) because TCP provides reliable, ordered, and error-checked delivery of data between the client and server. Here’s why HTTP relies on TCP:

- **Reliability**: TCP ensures that all data packets arrive at their destination without loss or corruption.
- **Order Preservation**: TCP guarantees that packets are received in the correct order, preventing scrambled or incomplete web pages.
- **Error Checking**: TCP detects and corrects errors in transmission, ensuring data integrity.
- **Connection-Oriented**: HTTP requires a stable connection for request-response exchanges, which TCP provides through its three-way handshake.

Since HTTP depends on accurate and complete data transfer, TCP is the ideal transport layer protocol.

---
### **Response Time**:

- Defined as the **total time** from when a user:
    
    1. **Enters a URL** into a browser.
        
    2. **Receives and displays** the base HTML file.
        
- **Key Components**:
    
    - Includes time for DNS resolution, TCP connection setup, HTTP request/response, and rendering the base HTML.
---
### **Persistent vs. Non-Persistent HTTP**

#### **Non-Persistent HTTP**

- A **TCP connection** is opened for each request.
    
- Each connection handles **only one object**, then it is closed.
    
- Multiple objects (e.g., images, scripts) require multiple TCP connections.
    
- **Example Process:**
    
    1. User enters a URL (e.g., `www.someSchool.edu/someDepartment/home.index`).
        
    2. The HTTP client **opens a TCP connection** to the server on port 80.
        
    3. The client sends an **HTTP request** for the object.
        
    4. The server **accepts the request**, processes it, and sends a response.
        
    5. The client receives the **HTML file** and parses it, finding references to other objects (e.g., images).
        
    6. The process **repeats** for each referenced object (e.g., 10 JPEG images).
        
- **Response Time Formula for Non-Persistent HTTP:**
    
    $Response Time= 2RTT + \text{File Transmission Time}$
    
    
    Where:
    
    - **RTT (Round Trip Time)**: Time for a small packet to travel from client to server and back.
        
    - **2RTT** includes:
        
        1. **1 RTT** to initiate the TCP connection.
            
        2. **1 RTT** for the HTTP request and response.
            

#### **Persistent HTTP (HTTP 1.1)**

- The **TCP connection remains open** after the initial request.
    
- **Multiple objects** are sent over a **single connection**, reducing overhead.
    
- The **client sends multiple requests** without needing new connections.
    
- **Reduces response time** since only **one RTT** is needed for all objects.
    
- **Benefits Over Non-Persistent HTTP:**
    
    - Reduces **2 RTTs per object** requirement.
        
    - Less **OS overhead** due to fewer TCP connections.
        
    - Browsers **parallelize** object fetching for faster loading.
        

### **Key Differences:**

|Feature|Non-Persistent HTTP|Persistent HTTP (HTTP 1.1)|
|---|---|---|
|TCP Connection|One per object|Reused for multiple objects|
|Response Time|**2RTT + transmission** per object|**1 RTT for all objects**|
|Efficiency|High overhead, slower|Lower overhead, faster|
|OS Overhead|High (multiple TCP connections)|Low (fewer connections)|

### **Conclusion**

- **Non-Persistent HTTP** requires a new TCP connection for each object, increasing response time.
    
- **Persistent HTTP (HTTP 1.1)** keeps the connection open, reducing delays and improving efficiency.

----
### **HTTP Statelessness and Cookies**:

- **HTTP is Stateless**:
    
    - By default, the server does not maintain any **user state** or remember past interactions.
        
- **Maintaining State with Cookies**:
    
    - A technique called **cookies** allows web servers to **maintain user state**.
        
    - Cookies enable the server to:
        
        - Remember past user actions.
            
        - Influence the current session based on prior interactions.

---
### **How Cookies Work**:

- **Purpose**:
    
    - Websites use **cookies** to maintain information about a user (or their browser) between transactions.
        
- **Four Components of Using Cookies**:
    
    1. **Server Sends a Cookie**:
        
        - The server sends a cookie (a unique number) to the client in the **cookie header line** of an HTTP response message.
            
    2. **Client Stores the Cookie**:
        
        - The client (browser) stores the cookie locally.
            
    3. **Client Sends the Cookie Back**:
        
        - In subsequent requests to the server, the client includes the cookie in the **cookie header line** of the HTTP request.
            
    4. **Server Tracks User Interactions**:
        
        - The server uses the cookie value to:
            
            - Remember past requests and responses.
                
            - Maintain a **history of interactions** with that specific user.

----

### **Example of Cookies in Action**:

- **Scenario**:
    
    - A client (browser) interacts with an **Amazon server** that uses cookies to track user activity.
        
    - The server stores cookie-related information in a **back-end database**.
        

---

### **Step-by-Step Process**:

1. **First Request (No Cookie)**:
    
    - The client sends an HTTP request to Amazon **without a cookie**.
        
    - The Amazon server:
        
        - Creates a **new cookie** for the client.
            
        - Stores the cookie and transaction details in its database.
            
        - Sends an HTTP response to the client, including the **cookie value**.
            
2. **Second Request (With Cookie)**:
    
    - The client includes the **cookie value** in the HTTP request to Amazon.
        
    - The server uses the cookie to:
        
        - Retrieve the client’s transaction history.
            
        - Take **cookie-specific actions** (e.g., offering a deal on items viewed in previous requests).
            
3. **Subsequent Requests (With Cookie)**:
    
    - The client returns a week later and includes the cookie in the request.
        
    - The server uses the cookie to:
        
        - Personalize the response (e.g., reminding the user of items they viewed earlier).
            

---

### **Key Takeaway**:

- Cookies allow websites to **store state** about a user between HTTP interactions.
    
- This enables **personalized experiences**, such as:
    
    - Offering deals based on past behavior.
        
    - Reminding users of previously viewed items.