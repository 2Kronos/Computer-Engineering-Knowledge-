
# Approach 

When approaching a database design question in exams, follow this **step-by-step thinking framework** to create a well-structured relational database with 5 interconnected tables:

---

### **1. Understand the Scenario (1 Minute)**
- Identify the **organization type** (hospital, school, e-commerce, etc.)
- Note key **entities** (people, services, transactions) and **actions** mentioned
- Example scenario: "A clinic management system for patients, doctors, and appointments"

---

### **2. Identify Core Tables (2 Minutes)**
For most service-based scenarios, these 5 table types cover 90% of cases:

| Table Type       | Purpose                          | Example Names        |
|------------------|----------------------------------|----------------------|
| 1. **Users**     | People receiving services        | `patients`, `students`, `customers` |
| 2. **Services**  | What the organization provides   | `treatments`, `courses`, `products` |
| 3. **Staff**     | People delivering services       | `doctors`, `teachers`, `employees` |
| 4. **Transactions** | Service bookings/orders       | `appointments`, `enrollments`, `orders` |
| 5. **Payments**  | Financial records                | `bills`, `invoices`, `transactions` |

**Clinic Example:**
1. `patients`
2. `treatments`
3. `doctors`
4. `appointments`
5. `medical_bills`

---

### **3. Define Columns with Keys (3 Minutes)**
For each table, include:

- **Primary Key (PK)**: Auto-increment ID
- **Natural Key**: Unique identifier (e.g., email, phone)
- **Foreign Keys (FK)**: 2-3 relationships minimum
- **Status Field**: ENUM for state tracking

**Example for `appointments`:**
```sql
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    treatment_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);
```

---

### **4. Establish Relationships (2 Minutes)**
Use this cheat sheet:

| Relationship       | Implementation               | Example                         |
|--------------------|------------------------------|---------------------------------|
| One-to-Many        | FK in the "many" table       | Patient → Appointments          |
| Many-to-Many       | Junction table               | Doctors ↔ Specializations      |
| One-to-One         | FK + UNIQUE constraint       | Appointment → Bill              |

**Always include:**
- At least one **self-relationship** (e.g., employee → manager)
- One **cascading delete** (e.g., `ON DELETE CASCADE` for appointments when a patient is deleted)

---

### **5. Add Sample Data (2 Minutes)**
Insert 5 realistic records per table with **deliberate relationships**:

```sql
-- Patients
INSERT INTO patients (patient_id, name) VALUES 
(1, 'John Doe'), (2, 'Jane Smith'), ...;

-- Appointments
INSERT INTO appointments (patient_id, doctor_id, treatment_id) VALUES
(1, 3, 2),  -- John Doe with Dr. X for Treatment Y
(2, 1, 5);  -- Jane Smith with Dr. Z for Treatment W
```

---

### **6. Verify Constraints**
Check for:
- **No orphan records** (all FKs point to existing PKs)
- **No duplicate unique keys**
- **Valid ENUM values**

---

### **Exam-Tested Template**
Adapt this for any scenario:

```sql
-- Table 1: Users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL
);

-- Table 2: Services
CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10,2)
);

-- Table 3: Staff
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,  -- If staff are also users
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table 4: Orders/Appointments
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    service_id INT NOT NULL,
    staff_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- Table 5: Payments
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE NOT NULL,  -- One-to-one
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
```

---

### **Pro Tips for Exams**
1. **Draw a quick ER diagram** before writing SQL
2. **Use consistent naming**: `[table]_id` for PKs, same name for FKs
3. **Add one "complex" element**: 
   - A self-referencing FK (e.g., `manager_id` in staff table)
   - A composite UNIQUE key (e.g., `UNIQUE(patient_id, appointment_date)`)
4. **Comment unusual design choices** (e.g., "Assuming patients can book multiple appointments per day")

This approach ensures you'll design a complete, relational database within 10 minutes. Practice with different scenarios (library, school, restaurant) to build fluency.
