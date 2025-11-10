## 12.2 Relationship Types 408

### Why Use ER Models Instead of Semantic Nets?
1. **Simplicity**: ER models group similar occurrences into types  
2. **Scalability**: More practical for large databases  
3. **Design Focus**: Emphasizes structure over instance-level details  

------

## 12.2.1 Degree of Relationship Type

#### **1. Relationship Basics**
Relationships define how entities interact in a database. They represent real-world connections like "employees manage departments" or "students take courses." Each relationship has:
- **Participants**: The entities involved
- **Degree**: Number of participating entities
- **Cardinality**: How many instances can relate (one-to-one, one-to-many)

#### **2. Relationship Degrees**
| Degree | Name      | Description                     | Common Example               |
|--------|-----------|---------------------------------|------------------------------|
| 2      | Binary    | Links two entities              | Employee → Department        |
| 3      | Ternary   | Connects three entities         | Student → Course → Professor |
| 4+     | Complex   | Rare, for specialized cases     | Order → Supplier → Shipper → Payment |
#### **4. Design Considerations**
1. **Clarity**: Ensure each relationship has a clear purpose
2. **Avoid redundancy**: Don't create overlapping relationships
3. **Validation**: Check if the relationship reflects real-world logic

#### **5. Common Mistakes**
- **Fan traps**: Creating ambiguous many-to-many paths
- **Overcomplicating**: Using ternary when binary suffices
- **Missing relationships**: Forgetting critical connections

---

## 12.2.2 Recursive Relationship 412

**Recursive Relationship**
- A relationship type where the **same entity type** participates more than once in **different roles**.
- Also called a *unary* relationship.

**Role Names**
- Used to indicate the purpose that each participating entity plays in the relationship.
- Essential for clarifying recursive relationships.
- Can also be used when two entities are associated through more than one relationship.

----
## 12.3 Attributes 413

### **Attributes in ER Diagrams**
Attributes are the specific properties that describe entities or relationships (e.g., a `Staff` entity has attributes like `staffNo`, `name`, and `salary`).


### **1. Attribute Types**
| Type          | Description                                                                 | Example                          |
|---------------|-----------------------------------------------------------------------------|----------------------------------|
| **Simple**    | Cannot be divided into smaller parts (atomic values).                       | `age`, `salary`                  |
| **Composite** | Made of multiple sub-attributes.                                            | `address` → {street, city, zip}  |
| **Single-Valued** | Holds exactly one value per entity.                                    | `staffNo` (each staff has one ID)|
| **Multi-Valued** | Can hold multiple values per entity.                                    | `phoneNumbers` (a person may have several) |
| **Derived**   | Calculated from other attributes (not stored directly).                     | `age` (derived from `birthDate`) |


### **2. Attribute Domains**
- A **domain** defines the allowed values for an attribute (like a "value range").
- **Examples**:
  - `rooms` (in `PropertyForRent`): Integers from 1 to 15.
  - `salary`: Positive numbers up to $200,000.
  - `name`: Text with letters/hyphens (no numbers).
- **Shared Domains**: Different attributes can share the same domain (e.g., `Branch.address` and `Staff.address` both use "valid addresses").

### **3. Key Rules**
1. **Identify Attributes Early**: List all properties of each entity (e.g., for `Student`: `studentID`, `name`, `major`).
2. **Classify Them**:  
   - Is `birthDate` simple or composite? *(Simple)*  
   - Is `email` single- or multi-valued? *(Usually single, but could be multi-valued)*  
3. **Document Domains**: Note value constraints (e.g., `rating` must be 1–5).

### **Why This Matters**
- **Data Integrity**: Domains prevent invalid entries (e.g., negative salary).
- **Clarity**: Composite attributes organize related data (e.g., address parts).
- **Efficiency**: Derived attributes reduce storage (e.g., calculate `age` instead of storing it).

---

## 12.3.1 Simple and Composite Attributes 413



### Simple vs. Composite Attributes

| Feature | Simple (Atomic) Attributes | Composite Attributes |
| :--- | :--- | :--- |
| **Definition** | Attributes that **cannot be broken down** into smaller, meaningful parts. | Attributes that are **made of smaller, meaningful parts**. |
| **Examples** | - `salary` (e.g., $50,000)<br>- `position` (e.g., "Manager")<br>- `age` (e.g., 30) | - `address` → `street`, `city`, `postcode`<br>- `fullName` → `firstName`, `lastName` |
| **When to Use** | - For **standalone data** that doesn't need to be split.<br>- When there is **no need to query or modify** individual parts. | - When the data has **logical subdivisions**.<br>- When users need to **search, sort, or filter** by individual components (e.g., find by `city`). |
| **Key Reason** | Simplicity for atomic values. | **Avoids redundancy** and allows for more precise data manipulation. |
| **ER Diagram Example** | `managerName` (treated as a single unit). | `address` (split into `street`, `city`, `postcode`). |
| **Real-World Analogy** | A **price tag** ($20) — a single, indivisible value. | A **mailing label** — broken down into street, city, and ZIP code for precision. |

----
## 12.3.2 Single-valued and Multi-valued Attributes 414 

Of course! Here are your notes on Single-valued and Multi-valued Attributes presented in a clear table format.

### Single-Valued vs. Multi-Valued Attributes

| Feature | Single-Valued Attributes | Multi-Valued Attributes |
| :--- | :--- | :--- |
| **Definition** | Store **exactly one value** per entity instance. | Can store **multiple related values** per entity instance. |
| **Cardinality** | One value per entity. | One-to-many (1-N) values per entity. |
| **Characteristics** | - Most common attribute type.<br>- Represents core, identifying information.<br>- Simple to store and query. | - Represents real-world cases with multiple values.<br>- Often has practical limits (min/max).<br>- Requires special database handling. |
| **Examples** | - `employee_id = "E1001"`<br>- `birth_date = "1990-05-15"`<br>- `salary = 75000` | - `phone_numbers = ["555-1234", "555-5678"]`<br>- `email_addresses = ["work@email.com", "personal@email.com"]`<br>- `certifications = ["PMP", "AWS", "CISSP"]` |
| **Database Implementation** | A direct column in a table.<br>**Example SQL:**<br>`managerName VARCHAR(50)` | **Relational DB:** Requires a separate table.<br>**Document DB:** Stored as an array/list.<br>**Example JSON:**<br>`"phoneNumbers": ["0141-339-2178", ...]` |
| **Query Complexity** | Simple equality checks and filters. | Requires joins (relational) or array operations (document). |
| **When to Use** | - The attribute represents a **single fact**.<br>- You need simple, fast queries.<br>- The value uniquely identifies the entity. | - The real-world concept **naturally has multiple values**.<br>- You need to maintain historical or alternative values.<br>- The values have independent significance. |
| **Real-World Analogy** | A person's **Social Security Number** (only one). | A person's **Phone Numbers** (can have home, work, mobile). |

---

## 12.3.3 Derived Attributes 414 

### Derived Attributes in ER Modeling  

#### Definition  
*"An attribute whose value is calculated from other attributes or entities, rather than stored directly in the database."*


#### Core Concept  
Derived attributes are:  
- 🧮 **Calculated dynamically** from source data  
- 🔄 **Always current** (automatically update when sources change)  
- 🖋️ **Notation**: Typically shown with `/forward slashes/` or dotted underline in diagrams  

#### Implementation Guide  
1. **When to Derive**:  
   - ✅ Values that change frequently  
   - ✅ Business rules (e.g., "deposit = 2×rent")  
   - ✅ Aggregate metrics (counts, sums)  

2. **Performance Tips**:  
   - 🚀 Materialize frequently-used derived values  
   - 📊 Create indexes on source attributes  
   - ⚠️ Avoid over-complex derivations in queries  

-----

# 12.3.4 Keys 415 

Here are the notes on Keys in ER Modeling presented in a table format.

### Keys in ER Modeling

| Key Type | Definition | Characteristics & Rules | Examples |
| :--- | :--- | :--- | :--- |
| **Candidate Key** | A **minimal set of attributes** that uniquely identifies each entity occurrence. | - Must be **unique** (no duplicates).<br>- Must be **minimal** (no unnecessary attributes).<br>- Cannot contain **NULL** values. | - `branchNo` for a `Branch` entity (e.g., "B003").<br>- `staffNo` and `NIN` (National Insurance Number) for a `Staff` entity. |
| **Primary Key** | The **selected candidate key** used as the main method to uniquely identify entities. | - **Selection Criteria**:<br>  - Shortest length (e.g., `staffNo` vs. `NIN`).<br>  - Guaranteed future uniqueness.<br>  - Prefer single-attribute keys.<br>- The non-selected candidate keys become **Alternate Keys**. | - **Chosen Primary Key**: `staffNo`<br>- **Alternate Key**: `NIN` |
| **Composite Key** | A primary key made of **multiple attributes**. | - Used when **no single attribute** is unique by itself.<br>- Often represents natural business identifiers. | - For an `Advert` entity: <br>(`propertyNo`, `newspaperName`, `dateAdvert`). |
![`Pasted image 20251105215211.png`](images/`Pasted image 20251105215211.png`)
----

## 12.4 Strong and Weak Entity Types 417


### Strong vs. Weak Entity Types

| Feature | Strong Entity Type | Weak Entity Type |
| :--- | :--- | :--- |
| **Definition** | An entity that is **not** existence-dependent on any other entity. | An entity that is **existence-dependent** on a strong "owner" entity. |
| **Existence** | **Independent**: Can exist on its own. | **Dependent**: Cannot exist without its owner entity. |
| **Primary Key** | Has its **own primary key** (e.g., `clientNo`). | Has **no standalone primary key**. |
| **Identification** | Uniquely identified by its own primary key. | Identified by the **owner's primary key + a partial key** (discriminator). |
| **Example** | **Client** entity | **Preference** entity |
| **Example Attributes** | `clientNo` (PK), name, contact details. | `prefType` (Partial Key), other details. Its full key is (`clientNo`, `prefType`). |
| **Relationship** | The "owner" or parent in a relationship with a weak entity. | The dependent or child in a relationship with a strong entity. |
![`Pasted image 20251105215130.png`](images/`Pasted image 20251105215130.png`)

----

## 12.6 Structural Constraints 419


## 🔐 Structural Constraints

### ❓ What Are They?

- Rules that define **how entities can be associated** in a relationship.
    
- These rules reflect **real-world restrictions** or **business policies**.
    

🧠 Example:

- Every `PropertyForRent` **must** have an `Owner`.
    
- Every `Branch` **must** have at least one `Staff` member.



### Multiplicity (Cardinality) in Entity Relationships

| Multiplicity Type | Definition | Real-World Example | Participation (from example) | Key Characteristics |
| :--- | :--- | :--- | :--- | :--- |
| **One-to-One (1:1)** | One entity instance is associated with **exactly one** instance of another entity. | **Staff** `Manages` **Branch** | **Staff:** `0..1` (A staff member manages zero or one branch)<br>**Branch:** `1..1` (A branch is managed by exactly one staff member) | - Maximum of one entity on either side.<br>- Often optional on one side, mandatory on the other. |
| **One-to-Many (1:*)** | One entity instance can be associated with **many** instances of another entity, but not vice-versa. | **Staff** `Oversees` **PropertyForRent** | **Staff:** (One staff oversees many properties)<br>**Property:** (A property is overseen by at most one staff) | - The most common relationship type.<br>- The "many" side entity is related to at most one instance of the "one" side. |
| **Many-to-Many (*:*)** | Many instances of one entity can be associated with **many** instances of another entity. | **Newspaper** `Advertises` **PropertyForRent** | **Newspaper:** (One newspaper advertises many properties)<br>**Property:** (A property is advertised in many newspapers) | - Mutual, many-sided relationship.<br>- Very common in real-world systems.<br>- Requires special handling in database design (e.g., a junction table). |

----

## 12.7 Problems with ER Models 426

Here is the information on Problems with ER Models (Connection Traps) presented in a comprehensive table.

### Connection Traps in ER Modeling

| Trap Type | Definition | Problem Description | Example Scenario | Solution |
| :--- | :--- | :--- | :--- | :--- |
| **Fan Trap** | Occurs when a model contains **1:* relationships** that "fan out" from the same entity, creating an **ambiguous pathway** between related entities. | The model does not directly show the relationship between entities that are connected through a common third entity, making it impossible to answer certain queries. | **Entities:** `Division`, `Branch`, `Staff`<br>**Relationships:**<br>- Division → Branches (1:*)<br>- Division → Staff (1:*)<br>**Problem:** Cannot determine which staff work at which branches. | Add a **direct relationship** between the ambiguous entities (e.g., `Staff` ↔ `Branch` with "WorksAt" relationship). |
| **Chasm Trap** | Occurs when a model suggests a relationship should exist between entities, but **optional participation** (0..*) creates a broken pathway in some cases. | The only path between two entities goes through an optional relationship, so when that relationship doesn't exist, information is lost. | **Entities:** `Branch`, `Staff`, `PropertyForRent`<br>**Relationships:**<br>- Branch → Staff (1:*)<br>- Staff → Property (0..*)<br>**Problem:** If a property has no assigned staff, we cannot determine which branch it belongs to. | Add a **direct relationship** to bridge the gap (e.g., `Branch` ↔ `PropertyForRent` with "Offers" relationship). |

#### Fan trap visual example
![`Pasted image 20251105220918.png`](images/`Pasted image 20251105220918.png`)

- SOLUTION

![`Pasted image 20251105221053.png`](images/`Pasted image 20251105221053.png`)

#### Chasm trap visual example

![`Pasted image 20251105221317.png`](images/`Pasted image 20251105221317.png`)

- Solution
![`Pasted image 20251105221345.png`](images/`Pasted image 20251105221345.png`) 

### 📌 Summary of Connection Traps

| Aspect | Fan Trap | Chasm Trap |
| :--- | :--- | :--- |
| **Root Cause** | Multiple 1:* relationships from one entity | Optional participation (0..*) in relationship path |
| **Main Issue** | **Ambiguous connections** between entities | **Missing pathway** between entities |
| **Result** | Cannot determine specific relationships | Loss of information when optional link is absent |
| **Visual Cue** | Relationships "fan out" from one central entity | "Gap" or "chasm" in the relationship path |
| **Fix** | Add direct relationship between affected entities | Add missing relationship to complete the path |
