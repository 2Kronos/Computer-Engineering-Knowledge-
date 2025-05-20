
# To do list

- [ ] ERD
- [ ] Tenary relationships
- [ ] Generalization
- [ ] Specilazation

![[Pasted image 20250520221925.png]]

# Database Study Plan (5 Days)

## Day 1: ERD Fundamentals and Design

### Topics to Cover:
1. **Entity-Relationship Diagrams (ERD)**
   - Entities, attributes, relationships
   - Cardinality (one-to-one, one-to-many, many-to-many)
   - Primary keys and foreign keys

2. **Ternary Relationships**
   - Definition and examples
   - When to use ternary vs binary relationships

### Notes:
**ERD Basics:**
- An ERD is a visual representation of data requirements
- Entities are represented as rectangles (e.g., Student, Qualification)
- Relationships are lines connecting entities
- Attributes are ovals or listed inside entity boxes

**Ternary Relationship Example:**
A ternary relationship exists when three entities participate in a single relationship. For example:
- A Student takes a Subject from a Lecturer (all three are needed to fully describe the relationship)

### Code Snippet (DDL for Ternary Relationship):
```sql
CREATE TABLE Student_Subject_Lecturer (
    student_id VARCHAR(20),
    subject_id VARCHAR(20),
    lecturer_id VARCHAR(20),
    semester VARCHAR(20),
    year INT,
    PRIMARY KEY (student_id, subject_id, lecturer_id, semester, year),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
    FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id)
);
```

### Practice Question:
Design an ERD for a library system with these entities: Book, Member, and Librarian. Include a ternary relationship showing which member borrows which book from which librarian.

## Day 2: Advanced ERD Concepts

### Topics to Cover:
1. **Generalization**
   - Supertype/subtype relationships
   - "Is-a" relationships
   - Shared attributes in supertype

2. **Specialization**
   - Top-down approach
   - Specific attributes in subtypes
   - Completeness constraints

### Notes:
**Generalization Example:**
- A "Qualification" is a general entity
- "Undergrad_Qual" and "Postgrad_Qual" are specialized types that inherit from Qualification

**Specialization Example:**
- Start with a general "Person" entity
- Specialize into "Student" and "Lecturer" with their unique attributes

### Code Snippet (Generalization/Specialization):
```sql
-- Supertype
CREATE TABLE Qualification (
    qual_code VARCHAR(20) PRIMARY KEY,
    qual_name VARCHAR(100),
    duration INT
);

-- Subtype 1
CREATE TABLE Undergrad_Qual (
    qual_code VARCHAR(20) PRIMARY KEY,
    nqf_level INT,
    FOREIGN KEY (qual_code) REFERENCES Qualification(qual_code)
);

-- Subtype 2
CREATE TABLE Postgrad_Qual (
    qual_code VARCHAR(20) PRIMARY KEY,
    research_component VARCHAR(100),
    FOREIGN KEY (qual_code) REFERENCES Qualification(qual_code)
);
```

### Practice Question:
Create an ERD with generalization/specialization for a university system where Person is the supertype and Student, Lecturer, and Staff are subtypes. List at least 2 attributes specific to each subtype.

## Day 3: SQL Implementation (DDL)

### Topics to Cover:
1. **Data Definition Language (DDL)**
   - CREATE TABLE statements
   - Data types and constraints
   - Primary and foreign keys
   - Referential integrity

2. **Attribute Domains**
   - Choosing appropriate data types
   - Setting constraints (NOT NULL, UNIQUE, CHECK)

### Notes:
**DDL Best Practices:**
- Always define primary keys
- Use appropriate data types (VARCHAR for text, INT for numbers)
- Add constraints to enforce data integrity
- Use foreign keys to maintain relationships

### Code Snippet (Complete DDL Example):
```sql
CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    qualification_id VARCHAR(20),
    FOREIGN KEY (qualification_id) REFERENCES Qualification(qual_id)
);

CREATE TABLE Subject (
    subject_id VARCHAR(20) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    description TEXT
);
```

### Practice Question:
Write DDL statements to create tables for a simple hospital system with Patients, Doctors, and Appointments. Include appropriate data types and constraints.

## Day 4: SQL Queries (DML)

### Topics to Cover:
1. **Data Manipulation Language (DML)**
   - INSERT, UPDATE, DELETE
   - Basic SELECT queries
   - Filtering with WHERE

2. **Advanced Querying**
   - JOIN operations
   - DISTINCT, ORDER BY
   - GROUP BY and aggregation

### Notes:
**Query Techniques:**
- Use INNER JOIN to combine related tables
- LEFT JOIN includes all rows from the left table
- GROUP BY with COUNT, SUM, AVG for aggregations
- ORDER BY for sorting results

### Code Snippet (DML Examples):
```sql
-- Basic SELECT
SELECT * FROM Student WHERE qualification_id = 'BET_CS_2023';

-- JOIN example
SELECT s.student_id, s.first_name, q.qual_name
FROM Student s
JOIN Qualification q ON s.qualification_id = q.qual_id;

-- GROUP BY with aggregation
SELECT qualification_id, COUNT(*) as student_count
FROM Student
GROUP BY qualification_id
ORDER BY student_count DESC;
```

### Practice Question:
1. Write a query to find all students enrolled in Computer Science qualifications.
2. Write a query to count how many subjects each student has taken.
3. Write a query to find the average credits of subjects for each qualification.

## Day 5: Review and Practice

### Topics to Cover:
1. **Review all concepts**
   - ERD components
   - Relationship types
   - Generalization/Specialization
   - SQL implementation

2. **Practice with sample databases**
   - Design small database systems
   - Write DDL and DML statements
   - Create queries

### Comprehensive Practice Questions:

1. Design an ERD for a simple online shopping system with Customers, Products, and Orders. Include a ternary relationship if appropriate.

2. Write the DDL statements to implement your online shopping ERD.

3. Write SQL queries to:
   - Find all products ordered by a specific customer
   - Calculate the total sales for each product
   - List customers who haven't placed any orders

4. Explain how you would use generalization/specialization in this system.

## Additional Study Tips:

1. **For ERDs:**
   - Practice drawing diagrams with clear entities and relationships
   - Label all cardinalities correctly
   - Distinguish between weak and strong entities

2. **For SQL:**
   - Memorize basic syntax for CREATE, SELECT, INSERT
   - Understand how JOINs work (practice with Venn diagrams)
   - Know common aggregate functions (COUNT, SUM, AVG)

3. **For Generalization/Specialization:**
   - Identify shared attributes for supertypes
   - Recognize when specialization is appropriate
   - Understand completeness constraints (total vs partial)

Remember to:
- Take breaks during study sessions
- Test yourself with practice questions
- Review your notes daily
- Get good sleep before the test

