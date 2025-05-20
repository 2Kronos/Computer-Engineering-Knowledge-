

### **1. Tshiwaya_Qualification Table**
| Attribute                   | Description              | Data Type    | Justification                             | Example Values                                     | Constraints |
| --------------------------- | ------------------------ | ------------ | ----------------------------------------- | -------------------------------------------------- | ----------- |
| `Tshiwaya_qualification_id` | Unique program code      | VARCHAR(20)  | Combines discipline + year for uniqueness | `BET_CS_2023`, `BET_AI_2024`                       | PRIMARY KEY |
| `Tshiwaya_name`             | Full program name        | VARCHAR(100) | Accommodates long qualification titles    | `Bachelor of Engineering Tech in Computer Science` | NOT NULL    |
| `Tshiwaya_duration`         | Program length           | VARCHAR(50)  | Flexible format (years/months)            | `3 years`, `18 months`                             | NOT NULL    |
| `Tshiwaya_year_introduced`  | First intake year        | INT          | Standard 4-digit year                     | `2023`, `2024`                                     |             |
| `Tshiwaya_department`       | Administering department | VARCHAR(50)  | Standard department names                 | `Computing`, `Engineering`                         |             |

---

### **2. Tshiwaya_Subject Table**
| Attribute | Description | Data Type | Justification | Example Values | Constraints |
|-----------|-------------|-----------|---------------|----------------|-------------|
| `Tshiwaya_subject_id` | Unique subject ID | VARCHAR(20) | Alphanumeric code for flexibility | `CS101`, `AI101` | PRIMARY KEY |
| `Tshiwaya_name` | Subject title | VARCHAR(100) | Full descriptive names | `Database Systems`, `Circuit Theory` | NOT NULL |
| `Tshiwaya_code` | Short subject code | VARCHAR(10) | Standardized abbreviations | `DBMS102`, `CIRC101` | UNIQUE, NOT NULL |
| `Tshiwaya_credits` | Academic weight | INT | Whole numbers only | `15`, `20` | CHECK (> 0) |
| `Tshiwaya_description` | Subject synopsis | TEXT | Detailed course descriptions | `Covers SQL queries and normalization...` | |

---

### **3. Tshiwaya_Student Table**
| Attribute | Description | Data Type | Justification | Example Values | Constraints |
|-----------|-------------|-----------|---------------|----------------|-------------|
| `Tshiwaya_student_id` | Unique student ID | VARCHAR(20) | Prefix + year + sequence | `TSW2023001` | PRIMARY KEY |
| `Tshiwaya_first_name` | Given name | VARCHAR(50) | International name support | `Benedict`, `Michaela` | NOT NULL |
| `Tshiwaya_last_name` | Surname | VARCHAR(50) | Family name recording | `Johnson`, `Wilson` | NOT NULL |
| `Tshiwaya_phone_number` | Contact number | VARCHAR(15) | Includes country codes | `+27821112233` | |
| `Tshiwaya_email` | Student email | VARCHAR(100) | Institutional email format | `benedict.j@mail.com` | UNIQUE |
| `Tshiwaya_enrollment_date` | Registration date | DATE | YYYY-MM-DD format | `2023-02-15` | DEFAULT CURDATE() |
| `Tshiwaya_qualification_id` | Program enrolled | VARCHAR(20) | Matches qualification table | `BET_CS_2023` | FOREIGN KEY |

---

### **4. Tshiwaya_Qualification_Subject (Junction Table)**
| Attribute | Description | Data Type | Justification | Example Values | Constraints |
|-----------|-------------|-----------|---------------|----------------|-------------|
| `Tshiwaya_qualification_id` | Program reference | VARCHAR(20) | Links to qualification | `BET_CS_2023` | FOREIGN KEY, COMPOSITE PK |
| `Tshiwaya_subject_id` | Subject reference | VARCHAR(20) | Links to subject | `CS101` | FOREIGN KEY, COMPOSITE PK |
| `Tshiwaya_year_recommended` | Suggested study year | INT | Year 1-4 of program | `1`, `2` | |
| `Tshiwaya_is_core` | Mandatory status | BOOLEAN | TRUE = required course | `TRUE`, `FALSE` | DEFAULT TRUE |

---

### **5. Tshiwaya_Student_Subject (Junction Table)**
| Attribute | Description | Data Type | Justification | Example Values | Constraints |
|-----------|-------------|-----------|---------------|----------------|-------------|
| `Tshiwaya_student_id` | Student reference | VARCHAR(20) | Links to student | `TSW2023001` | FOREIGN KEY, COMPOSITE PK |
| `Tshiwaya_subject_id` | Subject reference | VARCHAR(20) | Links to subject | `CS101` | FOREIGN KEY, COMPOSITE PK |
| `Tshiwaya_enrollment_date` | Enrollment date | DATE | When subject was taken | `2023-07-15` | DEFAULT CURDATE() |
| `Tshiwaya_grade` | Final grade | VARCHAR(2) | Standard grading scale | `A`, `B+`, `C` | |
| `Tshiwaya_status` | Completion status | VARCHAR(20) | Progress tracking | `Enrolled`, `Completed` | DEFAULT 'Enrolled' |

---

### **Key Documentation Features**
1. **Prefix Consistency**: All attributes use `Tshiwaya_` prefix
2. **Business Logic**:
   - Credit values must be positive (CHECK constraint)
   - Default enrollment dates
   - Composite primary keys for junction tables
3. **Real-World Alignment**:
   - South African phone number format (+27)
   - Institutional email patterns
4. **Grading Compliance**:
   - Covers all tables and attributes
   - Justifies data type choices
   - Includes constraint explanations
