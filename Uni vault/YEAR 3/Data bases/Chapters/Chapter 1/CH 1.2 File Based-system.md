![[Pasted image 20250302202956.png]]
### **Summary of Traditional File-Based Systems**

#### **What is a File-Based System?**

- A **file-based system** is an early method of organizing and managing data using individual files stored and accessed by separate application programs.
- Each program **defines and manages its own data**, leading to a decentralized storage approach.

#### **How File-Based Systems Worked**

- Inspired by manual filing systems where documents are stored in cabinets with labels.
- Files were used to store different types of information, such as:
    - **Sales Department**: Property and client details.
    - **Contracts Department**: Lease agreements and payments.
    - **Payroll Department**: Staff salaries.
    - **HR Department**: Employee information.
- Each department managed **its own** set of files with the help of a **Data Processing (DP) team**.

#### **Problems with File-Based Systems**

1. **Data Duplication**
    
    - Multiple departments stored the **same information** in different files, leading to redundancy.
2. **Data Inconsistency**
    
    - If one department updated data, other departments might still have **outdated** records.
3. **Lack of Data Integration**
    
    - Information was **scattered** across different files, making cross-referencing difficult.
4. **Hard to Retrieve Data Efficiently**
    
    - Searching for specific data (e.g., "properties for sale with a garage") required **manual searching** through multiple files.
5. **Limited Reporting Capabilities**
    
    - Generating business reports (monthly sales, employee payroll, etc.) was **time-consuming**.
6. **Tight Coupling Between Data and Programs**
    
    - Data structures were **defined within programs**, making it difficult to **modify** or scale the system.

#### **Why is this Important Today?**

- Understanding file-based systems helps in **avoiding past mistakes** when designing modern database systems.
- When transitioning from a **file-based system to a database system**, knowing how files were structured helps in **data migration**.

#### **Key Takeaway**

File-based systems were a **stepping stone** toward modern **database management systems (DBMS)**, which solved these problems by introducing **centralized, integrated, and efficient data management.**

----
### **Summary of Limitations of File-Based Systems**

1. **Separation and Isolation of Data**
    
    - Data stored in separate files makes it difficult to access and process information across multiple files.
    - Example: Finding houses that match client preferences requires creating temporary files and synchronizing multiple datasets.

2. **Data Dependence**
    
    - File structure is embedded in the application code, making changes complex.
    - Modifying a file structure (e.g., increasing an address field size) requires updating multiple programs.
    - This process is time-consuming and error-prone.
4. **Incompatible File Formats**
    
    - Different programming languages use different file formats.
    - Data sharing between departments using different languages (e.g., COBOL vs. C) requires format conversion.
    - Conversion is costly and time-consuming.
5. **Fixed Queries & Proliferation of Application Programs**
    
    - Users depend on developers to write queries and reports.
    - Fixed queries limit flexibility; ad-hoc queries are not possible.
    - Proliferation of files and applications leads to inefficiency and maintenance difficulties.
    - Issues include lack of security, poor data recovery, and restricted file access.

### **Key Takeaway:**

The file-based approach is inefficient due to **data redundancy, lack of flexibility, and difficulties in data access and integration**. A better solution, such as a **database management system (DBMS)**, is needed for more effective data handling.

---
