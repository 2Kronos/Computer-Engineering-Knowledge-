
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
### **Response Time**:

- Defined as the **total time** from when a user:
    
    1. **Enters a URL** into a browser.
        
    2. **Receives and displays** the base HTML file.
        
- **Key Components**:
    
    - Includes time for DNS resolution, TCP connection setup, HTTP request/response, and rendering the base HTML.
---
### **Protocol Definition**:

- A protocol defines:
    
    1. **Format**: The structure of messages exchanged between network entities.
        
    2. **Order**: The sequence in which messages are sent and received.
        
    3. **Actions**: The steps taken when messages are sent, received, or other events occur.

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