Here are code snippets for all clauses in **Question 4** of your assignment, using your Home Affairs database tables, plus additional useful clauses:

---

### **4a. WHERE Clause**
```sql
-- Find citizens born after 1990
SELECT * FROM Citizens 
WHERE DateOfBirth > '1990-01-01';
```

---

### **4b. ORDER BY Clause**
```sql
-- Sort citizens by last name (A-Z)
SELECT * FROM Citizens 
ORDER BY LastName ASC;

-- Sort services by highest fee first
SELECT * FROM Services 
ORDER BY Fee DESC;
```

---

### **4c. GROUP BY Clause**
```sql
-- Count citizens per birth year
SELECT YEAR(DateOfBirth) AS BirthYear, COUNT(*) 
FROM Citizens 
GROUP BY YEAR(DateOfBirth);
```

---

### **4d. HAVING Clause**
```sql
-- Show services with average fee > 100
SELECT ServiceID, AVG(Fee) 
FROM Services 
GROUP BY ServiceID
HAVING AVG(Fee) > 100;
```

---

### **4e. Aggregate Functions**
```sql
-- Get statistics for service fees
SELECT 
    MIN(Fee) AS MinFee,
    MAX(Fee) AS MaxFee,
    AVG(Fee) AS AvgFee,
    SUM(Fee) AS TotalFees
FROM Services;
```

---

### **4f. UPDATE Clause**
```sql
-- Change passport renewal fee
UPDATE Services 
SET Fee = 250.00 
WHERE ServiceName = 'Passport Renewal';
```

---

### **4g. DELETE Clause**
```sql
-- Delete completed queues
DELETE FROM Queues 
WHERE Status = 'Completed';
```

---

### **4h. UNION Clause**
```sql
-- Combine citizen and employee names
SELECT FirstName, LastName FROM Citizens
UNION
SELECT FirstName, LastName FROM Employees;
```

---

### **4i. INTERSECT (Simulated)**
```sql
-- Find names existing in both tables (MySQL workaround)
SELECT FirstName, LastName FROM Citizens
WHERE EXISTS (
    SELECT 1 FROM Employees 
    WHERE Employees.FirstName = Citizens.FirstName
    AND Employees.LastName = Citizens.LastName
);
```

---

### **4j. SELECT vs SELECT DISTINCT**
```sql
-- All last names (including duplicates)
SELECT LastName FROM Citizens;

-- Unique last names only
SELECT DISTINCT LastName FROM Citizens;
```

---

## **Additional Useful Clauses**

### **1. LIMIT Clause**
```sql
-- Get first 3 citizens
SELECT * FROM Citizens 
LIMIT 3;

-- Pagination (skip 5, get next 5)
SELECT * FROM Citizens 
LIMIT 5 OFFSET 5;
```

### **2. JOIN Clause**
```sql
-- Show queue details with citizen names
SELECT q.QueueID, c.FirstName, s.ServiceName
FROM Queues q
JOIN Citizens c ON q.CitizenID = c.CitizenID
JOIN Services s ON q.ServiceID = s.ServiceID;
```

### **3. LIKE Clause**
```sql
-- Find citizens with 'Joh' in first name
SELECT * FROM Citizens 
WHERE FirstName LIKE '%Joh%';
```

### **4. BETWEEN Clause**
```sql
-- Find services priced between 50-200
SELECT * FROM Services 
WHERE Fee BETWEEN 50 AND 200;
```

### **5. CASE Clause**
```sql
-- Categorize services by price
SELECT 
    ServiceName,
    CASE 
        WHEN Fee < 100 THEN 'Budget'
        WHEN Fee < 300 THEN 'Standard'
        ELSE 'Premium'
    END AS PriceCategory
FROM Services;
```

### **6. IS NULL/IS NOT NULL**
```sql
-- Find citizens without phone numbers
SELECT * FROM Citizens 
WHERE PhoneNumber IS NULL;
```

Each snippet uses your actual table and column names from the Home Affairs database. You can run these directly in your MySQL environment.
