
## 20.1 Database Security

### Definition

**Database Security** = Mechanisms that protect the database against intentional or accidental threats.

Security encompasses hardware, software, people, and data - not just the database itself.

### Why Database Security Matters

- Increasing amounts of crucial corporate data stored on computers
- Data loss or unavailability could be disastrous
- Need for 24/7 availability
- Rising computer-based criminal activities

### Five Main Security Areas

1. **Theft and Fraud** - Affects entire organization, focus on reducing opportunities
2. **Loss of Confidentiality** - Maintaining secrecy over critical organizational data
3. **Loss of Privacy** - Protecting individual data, legal implications
4. **Loss of Integrity** - Invalid/corrupted data affects operations
5. **Loss of Availability** - Data/system inaccessible, impacts financial performance

### 20.1.1 Threats

**Threat** = Any situation or event that may adversely affect a system and organization.

**Types of Harm:**

- **Tangible**: Loss of hardware, software, data
- **Intangible**: Loss of credibility, client confidence

**Threat Categories:**

- **Intentional**: Authorized/unauthorized users, external attackers
- **Unintentional**: Accidents, system failures, natural disasters

**Key Threats Include:**

- Unauthorized access and data disclosure
- Program alteration and system trapdoors
- Physical damage (fire, flood, equipment failure)
- Human factors (inadequate training, staff issues)
- Technical failures (power loss, viruses)

**Impact Factors:**

- Existence of countermeasures
- Quality of contingency plans
- Recovery procedures and backup frequency

**Risk Management:** Organizations must balance security costs against potential impact, focusing on serious threats while considering rare but significant events.

# 20.2 Countermeasures—Computer-Based Controls


This section details the primary technical controls available in a multi-user environment to counter the threats identified.

1. **Authorization & Authentication:**
    
    - **Authorization:** Granting a user the right to access the system or specific objects within it.
        
    - **Authentication:** Verifying the identity of a user (e.g., via usernames and passwords). Cloud computing often uses automated validation via email or other services.
        
2. **Access Controls:** Govern what authorized users can do. Implemented through privileges.
    
    - **Discretionary Access Control (DAC):** Managed using SQL `GRANT` and `REVOKE` statements. The owner of an object can grant privileges to others. **Weakness:** An unauthorized user can trick an authorized user into disclosing data.
        
    - **Mandatory Access Control (MAC):** A system-wide, policy-based model where users have clearances and data objects have security classifications (e.g., Top Secret, Secret, Confidential, Unclassified).
        
        - **Bell-LaPadula Model:** A subject (user) can read an object only if their clearance is **>=** the object's classification (_Simple Security Property_). A subject can write to an object only if their clearance is **<=** the object's classification (_-Property_). This prevents users from writing highly classified data down to a lower level.
            
        - **Multilevel Relations & Polyinstantiation:** To avoid inference attacks, the security class can become part of the primary key, leading to a situation where multiple tuples with the same "business key" exist at different security levels (polyinstantiation).
            
3. **Views:** A powerful security tool. A virtual relation derived from base tables that can hide sensitive data from users by restricting both the rows and columns they can see.
    
4. **Backup and Recovery:**
    
    - **Backup:** Periodically copying the database and log files to offline storage.
        
    - **Journaling:** Maintaining a log of all changes made to the database (the transaction log). This is crucial for restoring the database to a consistent state after a failure.
        
5. **Integrity Constraints:** Enforce data validity and business rules (e.g., primary keys, foreign keys, CHECK constraints), preventing the storage of incorrect data.
    
6. **Encryption:** Encoding data so it is unreadable without a decryption key.
    
    - **Symmetric Encryption:** Uses the same key for encryption and decryption (e.g., DES, AES). Fast but requires secure key exchange.
        
    - **Asymmetric Encryption:** Uses a public/private key pair (e.g., RSA). The public key encrypts, the private key decrypts. Solves the key distribution problem. Often used together with symmetric encryption for efficiency.
        
7. **RAID (Redundant Array of Independent Disks):** A hardware solution for fault tolerance and improved performance.
    
    - **Purpose:** Protects against disk drive failures, which are common.
        
    - **How it works:** Data is striped (spread) across multiple disks. Redundant information (parity or error-correcting codes) is also stored, allowing data to be reconstructed if a disk fails.
        
    - **Common Levels:**
        
        - **RAID 0:** Striping for performance only. **No redundancy.**
            
        - **RAID 1:** Mirroring. Complete redundancy by duplicating all data on a second disk.
            
        - **RAID 5:** Block-level striping with distributed parity. Good balance of performance, storage efficiency, and redundancy.

# 20.3 Security in Microsoft Office Access DBMS


#### **Summary**

Microsoft Access does not use standard SQL security commands (`GRANT`/`REVOKE`). Instead, it provides four main methods to secure a database:

1.  **Splitting the Database:**
    *   The most secure method. It separates the data (tables) into a back-end database file from the application objects (forms, reports) in a front-end file.
    *   Users connect to the back-end file. This protects the raw data and allows for easier management and security.

2.  **Setting a Database Password:**
    *   A simple encryption method that password-protects the entire database file.
    *   Users must enter the password to open the database. However, once open, a user has access to all objects within it.

3.  **Trust Center:**
    *   A settings menu that allows users to "trust" or enable content (like macros) that Access has disabled for security reasons.
    *   Users can define trusted locations (folders). Databases opened from these locations will have their content enabled automatically.

4.  **Packaging and Signing:**
    *   The database is packaged into a single, signed file (`.accdc`).
    *   The digital signature proves the database comes from a trusted author and hasn't been tampered with.
    *   This allows users to verify the source before enabling the database's content.
----

# 20.4 Security in Oracle DBMS


#### **Summary**

Oracle provides robust security through a combination of **system security** (controlling access to the database) and **data security** (controlling what users can do inside the database).

**1. Authentication:**
*   The primary method is the standard **username and password** mechanism.
*   Oracle can also delegate authentication to the operating system.

**2. Privileges:**
A **privilege** is a right to execute a specific SQL statement or access an object. There are two main categories:

*   **System Privileges:** The right to perform a system-wide action or an action on a type of object (e.g., `CREATE TABLE`, `CREATE USER`). There are over 80 distinct system privileges.
*   **Object Privileges:** The right to perform a specific action on a specific object (e.g., `SELECT ON Staff`, `DELETE ON PropertyForRent`). The available privileges depend on the object type (see Table 20.2).

**3. Roles:**
*   A **role** is a named group of privileges. This is the recommended way to manage permissions.
*   Instead of granting privileges to many users individually, privileges are granted to a role, and the role is then granted to users.
*   This simplifies security management (e.g., a user gains all permissions of the "Assistant" role).

**Key Management Principle:** For easier and more secure management, privileges should be granted to **roles**, and then those roles should be granted to users.

-----

# **20.5 DBMSs and Web Security**



Securing a DBMS on the web is complex because core internet protocols (TCP/IP, HTTP) were not designed with security in mind. Data travels "in the clear," making it vulnerable to interception. The goal is to ensure:
*   **Privacy:** Data is inaccessible to eavesdroppers.
*   **Integrity:** Data cannot be altered in transit.
*   **Authenticity:** The sender and receiver can verify each other's identity.
*   **Non-repudiation:** A sender cannot deny having sent a message.

Web security involves protecting data both during transmission and once it reaches the server. Key technologies include:

**1. Proxy Servers**
*   **Purpose:** Sits between a browser and web server.
*   **Benefits:** Improves performance by caching web pages and can filter requests (e.g., block access to certain websites).

**2. Firewalls**
*   **Purpose:** A system that acts as a barrier between a trusted internal network and untrusted external networks (like the internet).
*   **How it works:** It examines all incoming and outgoing messages and blocks those that don't meet defined security rules.
*   **Types:** Packet filters, application gateways, circuit-level gateways, and proxy servers. Often, a firewall uses a combination of these techniques.

**3. Cryptography & Digital Certificates**
*   **Message Digest (Hash):** A one-way function that creates a unique, fixed-length fingerprint for a message to verify its **integrity**.
*   **Digital Signatures:** A hash of a message encrypted with the sender's private key. Verifies the **authenticity** of the sender and provides **non-repudiation**.
*   **Digital Certificates:** An electronic document issued by a trusted **Certificate Authority (CA)** that binds a public key to an individual or organization. This is used to verify identities and establish trust online (e.g., for websites using HTTPS).

**4. Secure Communication Protocols**
*   **SSL/TLS (Secure Sockets Layer / Transport Layer Security):** The most common protocol. It creates an encrypted secure tunnel between a browser and a server for an entire session. Websites using SSL/TLS start with `https://`.
*   **S-HTTP (Secure HTTP):** A protocol designed to secure individual HTTP messages, not entire sessions. It is complementary to SSL.

**5. Secure Payment Protocols**
*   **SET (Secure Electronic Transactions):** A complex standard for securing credit card transactions online. It uses digital certificates extensively to authenticate all parties (cardholder, merchant, bank) and splits transaction details to protect privacy.

**6. Client-Side Security (Executable Content)**
Web pages can contain executable code (e.g., Java applets, ActiveX controls), which poses a security risk.
*   **Java Security:** Uses a **"sandbox"** model to restrict what downloaded applets can do (e.g., no file system access). Security is enforced by the **Class Loader**, **Bytecode Verifier**, and **Security Manager**. Applets can be digitally signed to become "trusted" and gain more privileges.
*   **ActiveX Security:** Has no inherent restrictions. It relies solely on **digital signatures** (Authenticode) to identify the publisher. The user is presented with a warning and must decide whether to trust and run the control, placing the security responsibility on the user.

---



# 20.6 Data Administration and Database Administration



## 20.6.1 Data Administration (DA)

**Data Administration** is the management of the **data resource**, including:
- Database planning
- Development and maintenance of standards, policies, and procedures
- Conceptual and logical database design

**Key Responsibilities of DA:**
- Manages the corporate data resource (including non-computerized data)
- Consults with and advises senior managers
- Ensures database technologies support corporate objectives
- Focuses on shared data across users or application areas

**DA Tasks Include:**
- Developing corporate data model and IT strategies
- Setting data collection standards
- Educating users on data standard
- Developing security policies

## 20.6.2 Database Administration (DBA)

**Database Administration** is the management of the **physical realization** of a database system, including:
- Physical database design and implementation
- Setting security and integrity controls
- Monitoring system performance
- Reorganizing the database as necessary

**Key Characteristics of DBA:**
- More technically oriented than DA
- Requires knowledge of specific DBMSs and operating systems
- Focused on developing and maintaining systems using DBMS software to its fullest extent

**DBA Tasks Include:**
- Evaluating and selecting DBMS products
- Undertaking physical database design
- Implementing physical database design
- Defining security and integrity constraints


## 20.6.3 Comparison of DA and DBA

| Data Administration (DA) | Database Administration (DBA) |
|-------------------------|--------------------------------|
| **Strategic IS planning** | **Evaluates new DBMSs** |
| **Determines long-term goals** | **Executes plans to achieve goals** |
| **Enforces standards, policies, procedures** | **Enforces standards, policies, procedures** |
| **Determines data requirements** | **Implements data requirements** |
| **Develops conceptual/logical design** | **Develops logical/physical design** |
| **Develops corporate data model** | **Implements physical database design** |
| **Coordinates system development** | **Monitors and controls database** |
| **Managerial orientation** | **Technical orientation** |
| **DBMS-independent** | **DBMS-dependent** |

**Key Difference:** DA staff are more **managerial** while DBA staff are more **technical**. DA focuses on the early stages of the lifecycle (planning to logical design) while DBA focuses on later stages (physical design to operational maintenance).
