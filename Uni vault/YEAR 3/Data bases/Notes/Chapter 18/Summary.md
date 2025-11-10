

# Chapter 18: Methodology—Physical Database Design for Relational Databases

---

## 18.1 Comparison of Logical and Physical Database Design

- **Database design process has 3 phases**:
    
    1. **Conceptual design** → captures high-level entities, attributes, and relationships.
        
    2. **Logical design** → produces a logical data model (relations, schemas, ER diagrams, data dictionary). It is **implementation independent** (doesn’t depend on a specific DBMS).
        
    3. **Physical design** → decides **how to implement** the logical model in a specific DBMS.
        
- **Logical design = “what”**
    
    - Focuses on _what data_ to store and _what relationships_ exist.
        
    - DBMS-independent.
        
- **Physical design = “how”**
    
    - Focuses on _how_ the data will be stored and accessed efficiently.
        
    - DBMS-dependent.
        
    - Requires knowledge of DBMS functionality (e.g., indexing options, constraints support).
        
- **Feedback loop**:
    
    - Physical design choices (e.g., merging relations for performance) may force changes in logical design or application design.
        
![`Pasted image 20251105224617.png`](images/`Pasted image 20251105224617.png`)

---

## 18.2 Overview of the Physical Database Design Methodology

The physical design methodology continues from logical design. Steps are numbered **3–8** (since steps 1–2 covered conceptual and logical design in earlier chapters).

### **Steps of Physical Design:**

- **Step 3**: Translate logical data model for target DBMS
    
    - 3.1 Design base relations
        
    - 3.2 Design derived data representation
        
    - 3.3 Design general constraints
        
- **Step 4**: Design file organizations and indexes
    
    - 4.1 Analyze transactions
        
    - 4.2 Choose file organizations
        
    - 4.3 Choose indexes
        
    - 4.4 Estimate disk space requirements
        
- **Step 5**: Design user views
    
- **Step 6**: Design security mechanisms
    
- **Step 7**: (Covered in Chapter 19) Consider controlled redundancy (denormalization for performance).
    
- **Step 8**: (Covered in Chapter 19) Monitor and tune the operational system.
    

**Definition**:

> _Physical database design_ = producing a description of the database implementation on secondary storage, including base relations, file organizations, indexes, integrity constraints, and security mechanisms.

---

## 18.3 The Physical Database Design Methodology for Relational Databases

This section explains **Steps 3 and 4** in detail.

---

### Step 3: Translate Logical Data Model for Target DBMS

**Objective**: Produce a relational schema that can be implemented in the chosen DBMS.

Requires knowledge of:

- How to create tables and relations in the DBMS.
    
- Whether DBMS supports primary/foreign/alternate keys, domains, NOT NULL constraints, general constraints.
    
- Integrity constraints and derived attributes handling.
    

#### Step 3.1 Design base relations

- Use **data dictionary + DBDL** (Database Design Language) to define relations.
    
- For each relation: specify name, attributes, primary/alternate/foreign keys, integrity constraints.
    
- From data dictionary: include domain (type, length, constraints), default values, null options, derived attribute rules.
    

**Implementation**:

- Create using SQL (e.g., `CREATE TABLE`).
    
- Alternative: define in MS Access or Oracle.
    
- **Document**: record why specific design choices were made (important for alternatives).
    

#### Step 3.2 Design representation of derived data

- **Derived attributes** = values calculated from other attributes. Examples:
    
    - Number of staff at a branch.
        
    - Total salaries of staff.
        
    - Number of properties managed by a staff member.
        
- Decision: **Store vs. calculate** each time.
    
    - Storing saves time for frequent queries but increases storage and maintenance cost.
        
    - Calculating saves storage but may slow queries.
        
- Example: Add `noOfProperties` attribute to Staff relation.
    
    - Stored value must be updated consistently when properties are assigned or removed.
        
    - Useful if queries using this attribute are frequent.
        
- Some derived attributes are stored if DBMS query language (like SQL) cannot easily compute them.
    
- **Document design decisions** (why stored or not).
    

#### Step 3.3 Design general constraints

- Beyond entity, referential, domain constraints, sometimes we need **business rules**:
    
    - Example: A staff member cannot manage more than 100 properties.
        
- Can implement as:
    
    - **CHECK constraints** in SQL.
        
    - **Triggers** (automatic checks on updates).
        
    - **Application code** (if DBMS doesn’t support constraints).
        
- Some constraints (like time-based archival rules) may require external programming.
    
- **Document all choices**.
    

---

### Step 4: Design File Organizations and Indexes

**Objective**: Store data efficiently and ensure good performance.

#### Step 4.1 Analyze transactions

- Collect info about queries and updates:
    
    - Which transactions are most frequent/critical.
        
    - Peak load times.
        
    - Relations and attributes accessed.
        
- Use tools:
    
    - **Transaction/relation cross-reference matrix** → shows which transactions use which relations.
        
    - **Transaction usage map** → highlights heavily accessed relations.
        
- 80/20 rule: 20% of queries may account for 80% of data access.
    
- For each transaction, record:
    
    - Relations accessed, type of access (read, update, insert, delete).
        
    - Attributes used in conditions (`WHERE` clause), joins, ordering, grouping.
        
    - Frequency and performance goals.
        

#### Step 4.2 Choose file organizations

- Decide how to **store relations**.
    
- Options (if supported by DBMS):
    
    - Heap (unsorted).
        
    - Hash.
        
    - Indexed Sequential Access Method (ISAM).
        
    - B+ tree.
        
    - Clusters.
        
- If DBMS doesn’t allow choice → skip this step.
    
- **Document choice** with reasons.
    

#### Step 4.3 Choose indexes

- Indexes improve retrieval but slow updates/inserts.
    
- **Types of indexes**:
    
    - Primary index → ordered on key.
        
    - Clustering index → ordered on non-key attribute.
        
    - Secondary index → additional access paths.
        
- **Guidelines for choosing indexes**:
    
    1. Don’t index small relations.
        
    2. Index primary key (if not already).
        
    3. Add index to foreign keys used in joins.
        
    4. Add index for frequently used attributes (queries, sorting, grouping).
        
    5. Avoid indexing heavily updated attributes.
        
    6. Avoid indexing when queries retrieve a large portion of relation.
        
    7. Avoid indexing long text attributes.
        
    8. Consider “index-only plans” (when query can be answered entirely from index).
        
- **Experimentation**: test query execution plans (QEP) using DBMS tools (Oracle’s `EXPLAIN PLAN`, Access Analyzer, DB2 tools, etc.).
    
- **Practical notes**:
    
    - Drop indexes before bulk inserts; recreate after.
        
    - Keep DBMS statistics updated to ensure optimizer uses indexes efficiently.
        

#### Step 4.4 Estimate disk space requirements

- Estimate storage for each relation:
    
    - Size of each tuple × number of tuples.
        
    - Add growth factor (expected database growth).
        
- Helps check hardware capacity or plan procurement.
    

---

## Step 5: Design User Views

**Objective**: Implement user views identified earlier in requirements analysis.

- Views = stored queries (virtual tables).
    
- Provide:
    
    - **Data independence** (hide schema changes).
        
    - **Reduced complexity** (users see only relevant data).
        
    - **Customization** (different views for different roles).
        
- In multi-user DBMS: essential for **security and access control**.
    
- Can be created using SQL (`CREATE VIEW`) or DBMS-specific methods.
    
- **Document design of each view**.
    

---

## Step 6: Design Security Mechanisms

**Objective**: Protect data against unauthorized access.

- Use requirements gathered earlier from users.
    
- Mechanisms include:
    
    - Access controls (who can read/insert/update/delete).
        
    - Role-based permissions.
        
    - Security measures applied at relation or view level.
        
- Must balance **usability** and **protection**.
    

---

# Key Takeaways

- Logical design defines **what** the database should contain; physical design defines **how** it will be implemented efficiently.
    
- Physical design methodology focuses on:
    
    - Translating logical design into DBMS-specific structures.
        
    - Designing base relations, derived data handling, and constraints.
        
    - Analyzing transactions to decide on file organizations and indexes.
        
    - Estimating storage.
        
    - Implementing user views and security mechanisms.
        
- Decisions must be **documented** at each stage, with reasons for chosen approaches.
    
