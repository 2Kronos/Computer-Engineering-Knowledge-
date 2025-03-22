## **Web Caching**:

- A powerful technique to:
    
    - Improve **user-perceived performance**.
        
    - Reduce load on **origin servers** and **institutional resources** (e.g., access links).

### **How Web Caching Works**:

1. **Setup**:
    
    - An institution installs a **web cache**.
        
    - Users configure their browsers to point to this **local web cache**.
        
2. **Request Flow**:
    
    - When a browser makes a request:
        
        - It first sends the HTTP request to the **web cache**.
            
    - **If the object is in the cache**:
        
        - The cache returns the object directly to the client.
            
        - The **origin server is not involved**.
            
    - **If the object is not in the cache**:
        
        - The cache requests the object from the **origin server**.
            
        - It caches the received object for future requests.
            
        - It returns the object to the client.
            
### **Benefits of Web Caching**:

- **Faster response times** for users.
    
- **Reduced bandwidth usage** on institutional access links.
    
- **Lower load** on origin servers.

---
### **Caching Behavior Controlled by the Origin Server**:

- The origin server can specify how an object should be cached using **response headers** in the HTTP response message.
    
- **Cache-Control Header**:
    
    - Used to define caching rules for the object.
        
    - Examples of directives:
        
        - **max-age**: Specifies the maximum time (in seconds) the object can be cached.
            
        - **no-cache**: Indicates the object should not be cached.
            

### **Key Points**:

- Caching behavior is communicated from the **origin server** to the **cache** via HTTP response headers.
    
- This allows the server to control how long or whether an object is stored in the cache.

----

## **Client-Side Caching (Conditional HTTP GET)**:

- A second form of caching where the **client’s browser** stores content locally.
    
- **Purpose**:
    
    - Avoids redundant downloads if the client already has an **up-to-date copy** of the content.
        
    - Reduces **transmission delays** and saves **network resources**.
        

### **How It Works**:

1. **Client Request**:
    
    - The client includes an **If-Modified-Since** header in the HTTP request.
        
    - This header specifies the **last retrieval date** of the object from the server.
        
2. **Server Response**:
    
    - **If the object is unchanged**:
        
        - The server responds with a **304 Not Modified** status.
            
        - No object is sent, saving bandwidth.
            
    - **If the object has been modified**:
        
        - The server responds with a **200 OK** status and sends the updated object.

### **Benefits of Client-Side Caching**:

- **Improved user-perceived performance**: Faster loading times for cached content.
    
- **Reduced network resource usage**: Less data transmitted over the network.