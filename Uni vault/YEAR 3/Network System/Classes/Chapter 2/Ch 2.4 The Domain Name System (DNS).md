## **Domain Name System (DNS)**:

- A **distributed database** that translates:
    
    - **Hostnames** and **services** to **IP addresses**.
        
    - **IP addresses** to **hostnames** and **services**.
        

### **Key Features of DNS**:

1. **Distributed Hierarchy**:
    
    - DNS servers are organized in a **hierarchical structure** spread across the Internet.
        
    - They communicate with each other to provide name translation services.
        
2. **Application Layer Service**:
    
    - DNS is implemented as an **application layer protocol**.
        
    - Operates on **servers at the network edge**, not on routers or switches within the network core.
        
3. **Internet Design Philosophy**:
    
    - **Keep the network core simple**: Routers and switches focus on forwarding packets.
        
    - **Push complexity to the edge**: Services like DNS handle advanced functionality.
---

### **DNS and Load Balancing**:

- **Load Balancing Function**:
    
    - DNS can distribute incoming requests across multiple servers to balance the load.
        
- **How It Works**:
    
    - For a requested service (e.g., a web server), there may be **multiple IP addresses** associated with the service.
        
    - DNS **rotates** among these IP addresses when responding to queries.
        
    - Returns **one IP address** at a time as the primary service for the client.
        
- **Benefits**:
    
    - Distributes traffic evenly across servers.
        
    - Improves **scalability** and **reliability** of services.

----

### **Why DNS is Distributed (Not Centralized)**:

1. **Traffic Concentration**:
    
    - A centralized DNS system would create a **huge concentration of traffic** at a single point.
        
2. **Performance Requirements**:
    
    - DNS queries require **low latency** (milliseconds matter).
        
    - A centralized system would result in **long RTT (Round-Trip Time)** delays for users far from the central server.
        
3. **Scalability**:
    
    - The Internet handles **trillions of DNS queries daily** (e.g., Akamai alone handles over a trillion requests per day).
        
    - A centralized system cannot scale to meet this demand.
        
4. **Resiliency and Capabilities**:
    
    - A distributed system provides:
        
        - **Better computational capabilities**.
            
        - **Higher resiliency** against failures.
            
        - **Improved performance** for users globally.
          
- DNS can be thought of as a **highly distributed, scalable, and high-performance database** that translates domain names to IP addresses efficiently.
---
## **DNS Hierarchy**:

1. **Root DNS Servers**:
    
    - Located at the top of the hierarchy.
        
    - Provide information about **Top-Level Domain (TLD)** servers.
        
2. **Top-Level Domain (TLD) Servers**:
    
    - Responsible for domains like **.com**, **.edu**, **.net**, etc.
        
    - Provide information about **authoritative name servers** for specific domains.
        
3. **Authoritative Name Servers**:
    
    - Have the **ultimate responsibility** for resolving names within their domain (e.g., **umass.edu**, **nyu.edu**, **pbs.org**).
        

---

### **DNS Resolution Process (Example: [www.amazon.com](http://www.amazon.com/))**:

1. **Client Contacts Root DNS Server**:
    
    - Gets the address of the **TLD server** for **.com**.
        
2. **Client Contacts TLD Server**:
    
    - Gets the address of the **authoritative name server** for **amazon.com**.
        
3. **Client Contacts Authoritative Name Server**:
    
    - Gets the **IP address** for **[www.amazon.com](http://www.amazon.com/)**.
---
 1. Root DNS Servers:

	- **Role**:
	    
	    - Act as the starting point for DNS resolution when a server cannot resolve a name.
	        
	    - Provide information about **Top-Level Domain (TLD)** servers but do not perform the final translation.
	        
	- **Importance**:
	    
	    - Critical to the functioning of the Internet, often compared to the **central nervous system**.
	        
	- **Security**:
	    
	    - Highly secure due to their critical role.
	        
	- **Management**:
	    
	    - Managed by **ICANN (Internet Corporation for Assigned Names and Numbers)**, which oversees the root servers and associated infrastructure.

2. **Top-Level Domain (TLD) Servers**:
    
    - Responsible for resolving domain names with specific endings (e.g., **.com**, **.edu**, **.net**, **.org**).
        
    - Managed by **Internet Registries**:
        
        - Organizations that oversee TLDs and handle domain name registrations (e.g., registering a new **.com** or **.edu** name).
            
3. **Authoritative Name Servers**:
    
    - Responsible for resolving names **within an organization** (e.g., **umass.edu**, **nyu.edu**).
        
    - **"The buck stops here"**:
        
        - These servers have the **final authority** over their domain’s name-to-IP mappings.
            
4. **Local DNS Servers**:
    
    - Every host on the Internet has an associated **local DNS server**.
        
    - **Role**:
        
        - Acts as the **first point of contact** for a host when resolving a name.
            
        - If the local DNS server has the requested name-to-IP mapping **cached locally**, it responds immediately.
            
        - If not, it initiates the **DNS resolution process** (querying root, TLD, and authoritative servers

---

### **What is DNS Name Resolution?**

DNS (Domain Name System) name resolution is the process of converting a website's domain name (like `google.com`) into its corresponding IP address (like `142.250.190.78`). Since computers communicate using IP addresses, but humans prefer using easy-to-remember domain names, DNS acts as a "phonebook" for the internet.

---

### **Example: Resolving `gaia.cs.umass.edu` from `engineering.nyu.edu`**

If a computer at `engineering.nyu.edu` wants to find the IP address of `gaia.cs.umass.edu`, the following steps happen:

1. **Check Local Cache:**
    
    - The host (`engineering.nyu.edu`) first checks if it already knows the IP for `gaia.cs.umass.edu` (stored in a cache from a previous request).
    - If found, it uses that IP directly.
    - If not, it moves to the next step.
2. **Ask the Local DNS Server (Recursive Resolver):**
    
    - The request is sent to the local DNS resolver (often provided by the ISP or a university's IT department).
    - If the resolver has the answer cached, it returns the IP. Otherwise, it starts querying other DNS servers.
3. **Query the Root DNS Server:**
    
    - If the resolver doesn’t have the IP, it contacts a Root DNS Server.
    - The Root Server doesn’t know the IP but directs the query to the appropriate **Top-Level Domain (TLD) Server** (e.g., `.edu`).
4. **Query the TLD Server (`.edu` in this case):**
    
    - The TLD Server directs the query to the **Authoritative Name Server** for `umass.edu`.
5. **Query the Authoritative Name Server:**
    
    - The authoritative server for `umass.edu` knows the exact IP for `gaia.cs.umass.edu` and responds with the IP address.
6. **Return the IP to the Host:**
    
    - The local resolver stores the IP in its cache and sends it back to `engineering.nyu.edu`.
7. **Connecting to `gaia.cs.umass.edu`:**
    
    - The host (`engineering.nyu.edu`) now knows the IP and establishes a direct connection.

---

### **Summary of the Process:**

1. **Check cache** → 2. **Ask local DNS resolver** → 3. **Query Root DNS server** → 4. **Ask `.edu` TLD server** → 5. **Get answer from `umass.edu` authoritative server** → 6. **Send IP back to `engineering.nyu.edu`** → 7. **Connect to `gaia.cs.umass.edu`**.

This process ensures that domain names can be quickly translated into IP addresses, allowing users to browse the internet seamlessly. 🚀

### **DNS Caching and Iterated Queries resolution**:

1. **DNS Caching**:
    
    - Reduces query traffic by storing previously resolved name-to-IP mappings locally.
        
    - If a local DNS server has a cached result, it can respond immediately without querying other servers.
        
2. **Iterated Query**:
    
    - A type of DNS query where the **local DNS server** iteratively contacts other servers (root, TLD, authoritative) to resolve a name as the one in the above example.
        
    - Example:
        
        - The local DNS server at **NYU** queries:
            
            1. **Root DNS server**.
                
            2. **TLD DNS server** (e.g., for **.edu**).
                
            3. **Authoritative DNS server** (e.g., for **gaia.cs.umass.edu**).
                
        - Continues until the name is resolved.

### **Recursive Query Resolution**:

1. **Definition**:
    
    - In recursive query resolution, the **name server** (e.g., local DNS server) takes full responsibility for resolving the query.
        
    - Instead of providing a "try next server" response (as in iterative queries), it **recursively contacts other servers** until it obtains a definitive answer.
        
2. **Process**:
    
    - The client sends a query to the local DNS server.
        
    - The local DNS server:
        
        - Contacts other DNS servers (root, TLD, authoritative) on behalf of the client.
            
        - Returns the **final resolved IP address** to the client.
            
3. **Example**:
    
    - The local DNS server resolves the query for **gaia.cs.umass.edu** by recursively querying:
        
        1. **Root DNS server**.
            
        2. **TLD DNS server** (e.g., for **.edu**).
            
        3. **Authoritative DNS server** (e.g., for **umass.edu**).
            
    - Returns the final IP address to the client.

-----

### **Steps to Establish an Internet Presence**:

1. **Register Your Domain Name**:
    
    - Choose a domain name (e.g., **networkutopia.com**).
        
    - Register it with a **DNS registrar** (e.g., Network Solutions).
        
2. **Obtain IP Addresses**:
    
    - Acquire a range of IP addresses for your servers (details on how to get these are discussed in Chapter 4).
        
3. **Provide Authoritative Name Server Information**:
    
    - Give the registrar:
        
        - The **name** of your authoritative name server.
            
        - The **IP address** of your authoritative name server.
            
    - The registrar will:
        
        - Insert an **NS record** (Name Server record) for your domain.
            
        - Insert an **A record** (Address record) for your authoritative name server’s IP address into the global DNS database.
            
4. **Set Up Your Authoritative Name Server**:
    
    - Bring up your authoritative name server.
        
    - Populate it with **resource records** (e.g., A, CNAME, MX) for all servers and services in your network.
        

---

### **Key Points**:

- DNS is essential for making your servers accessible by name (e.g., **networkutopia.com**).
    
- The registrar handles the global DNS entries, while your authoritative name server manages the internal DNS records.

----

### **DNS Security Measures**:

1. **Protection Against Denial of Service (DoS) Attacks**:
    
    - Primarily achieved using **firewalls** to filter and block malicious traffic.
        
2. **Authentication for Record Integrity**:
    
    - Ensures that only **authorized sources** can add or modify DNS records.
        
    - **Authentication services** (e.g., DNSSEC - DNS Security Extensions) play a critical role in verifying the authenticity of DNS data.

----
