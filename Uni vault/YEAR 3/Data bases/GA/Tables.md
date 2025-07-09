
Here's a complete **Attribute Domain Specification** for each table in your `Raya_Tshiwaya_222170972_University` database, formatted for your report:

---

### **Attribute Domain Tables**

#### **1. Raya_Tshiwaya_222170972_Departments**
| Attribute         | Data Type     | Constraints                          | Domain Values               | Description                     |
|-------------------|--------------|--------------------------------------|----------------------------|---------------------------------|
| DepartmentID      | INT          | PRIMARY KEY, AUTO_INCREMENT         | 1, 2, 3,...                | Unique department identifier    |
| Name              | VARCHAR(100) | NOT NULL                             | E.g., "Computer Science"   | Department name                 |
| Faculty           | VARCHAR(50)  | NOT NULL                             | "Engineering", "Science", etc. | Faculty affiliation           |
| Budget            | DECIMAL(12,2)| DEFAULT 0.00                         | 0.00 to 99999999.99        | Annual budget in dollars        |
| BuildingCode      | VARCHAR(10)  | NOT NULL                             | 2-10 alphanumeric chars    | Physical location code          |
| EstablishedDate   | DATE         | None                                 | Valid past dates           | Date department was created     |

---

#### **2. Raya_Tshiwaya_222170972_Lecturers**
| Attribute         | Data Type     | Constraints                          | Domain Values               | Description                     |
|-------------------|--------------|--------------------------------------|----------------------------|---------------------------------|
| LecturerID        | INT          | PRIMARY KEY, AUTO_INCREMENT         | 1, 2, 3,...                | Unique lecturer identifier      |
| Name              | VARCHAR(100) | NOT NULL                             | E.g., "Luke Daniels"       | Full name                       |
| Email             | VARCHAR(100) | UNIQUE, NOT NULL                     | format: x.lastname@univ.edu| Institutional email             |
| OfficeNumber      | VARCHAR(20)  | None                                 | E.g., "CSB-205"            | Office location                 |
| Specialization    | VARCHAR(50)  | None                                 | E.g., "Database Systems"   | Academic focus area             |
| DepartmentID      | INT          | FOREIGN KEY, NOT NULL                | Refers to Departments      | Department affiliation          |
| HireDate          | DATE         | NOT NULL                             | Valid past dates           | Employment start date           |

---

#### **3. Raya_Tshiwaya_222170972_Students**
| Attribute         | Data Type     | Constraints                          | Domain Values               | Description                     |
|-------------------|--------------|--------------------------------------|----------------------------|---------------------------------|
| StudentID         | INT          | PRIMARY KEY, AUTO_INCREMENT         | 1, 2, 3,...                | Unique student identifier       |
| Name              | VARCHAR(100) | NOT NULL                             | E.g., "James Darwin"       | Full name                       |
| Email             | VARCHAR(100) | UNIQUE, NOT NULL                     | format: x.lastname@student.edu | Student email               |
| Phone             | VARCHAR(15)  | None                                 | 10-15 digits               | Contact number                  |
| EnrollmentDate    | DATE         | NOT NULL                             | Valid dates                | Date of enrollment              |
| Status            | VARCHAR(20)  | CHECK: 'Active', 'Graduated', or 'Withdrawn' | 3 valid states         | Academic status                 |
| DepartmentID      | INT          | FOREIGN KEY, NOT NULL                | Refers to Departments      | Major department                |

---

#### **4. Raya_Tshiwaya_222170972_Courses**
| Attribute         | Data Type     | Constraints                          | Domain Values               | Description                     |
|-------------------|--------------|--------------------------------------|----------------------------|---------------------------------|
| CourseID          | INT          | PRIMARY KEY, AUTO_INCREMENT         | 1, 2, 3,...                | Unique course identifier        |
| CourseCode        | VARCHAR(20)  | UNIQUE, NOT NULL                     | E.g., "CS370"              | Institutional course code       |
| Title             | VARCHAR(100) | NOT NULL                             | E.g., "Database Systems"   | Course title                    |
| Credits           | TINYINT      | CHECK (1 ≤ Credits ≤ 6)              | 1, 2, 3, 4, 5, 6           | Academic credit hours           |
| Capacity          | SMALLINT     | DEFAULT 30                           | 1-32767                    | Maximum students allowed        |
| Description       | TEXT         | None                                 | Free text                  | Course overview                 |
| DepartmentID      | INT          | FOREIGN KEY, NOT NULL                | Refers to Departments      | Offering department             |
| LecturerID        | INT          | FOREIGN KEY, NOT NULL                | Refers to Lecturers        | Instructor                      |

---

#### **5. Raya_Tshiwaya_222170972_Enrollments**
| Attribute         | Data Type     | Constraints                          | Domain Values               | Description                     |
|-------------------|--------------|--------------------------------------|----------------------------|---------------------------------|
| EnrollmentID      | INT          | PRIMARY KEY, AUTO_INCREMENT         | 1, 2, 3,...                | Unique enrollment record        |
| StudentID         | INT          | FOREIGN KEY, NOT NULL                | Refers to Students         | Enrolled student                |
| CourseID          | INT          | FOREIGN KEY, NOT NULL                | Refers to Courses          | Course enrolled in              |
| Grade             | CHAR(2)      | CHECK: 'A+', 'A', 'B+', 'B', 'C+', 'C', 'D', 'F' or NULL | Letter grades         | Final grade (NULL if in-progress)|
| Semester          | VARCHAR(10)  | NOT NULL                             | Format: "YYYY-SPR/SUM/FALL"| Academic term                   |
| EnrollmentDate    | DATE         | DEFAULT CURRENT_DATE                 | Valid dates                | Date of registration            |

---

### **Key Features of This Specification**:
1. **Consistency**:  
   - Matches your ERD and SQL implementation exactly.  
   - Uses your prefix `Raya_Tshiwaya_222170972_`.  

2. **Constraint Clarity**:  
   - Explicitly lists CHECK constraints (e.g., valid grades).  
   - Identifies all FOREIGN KEY relationships.  

3. **Real-World Alignment**:  
   - Email formats follow institutional standards.  
   - Semester format ensures academic term tracking.  

4. **Assignment Compliance**:  
   - All tables meet the **degree ≥5** and **cardinality ≥4** requirements.  

---
