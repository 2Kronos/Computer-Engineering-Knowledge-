
# ASSIGMENT 4

Let me break down **every SQL clause in Question 4** of your assignment with clear explanations and your actual examples:

---

### **4a. WHERE Clause**
**Purpose:** Filters records based on conditions  
**Your Example:**
```sql
SELECT * FROM Citizens WHERE DateOfBirth > '1990-01-01';
```
**Explanation:**  
- Returns only citizens born after January 1, 1990  
- `>` operator compares dates  
- Works with: `=`, `<>`, `LIKE`, `BETWEEN`, etc.

---

### **4b. ORDER BY Clause**
**Purpose:** Sorts results by specified column(s)  
**Your Example:**
```sql
SELECT * FROM Citizens ORDER BY LastName ASC;
```
**Explanation:**  
- `ASC` = ascending (A-Z) (default)  
- `DESC` = descending (Z-A)  
- Can sort by multiple columns: `ORDER BY LastName, FirstName`

---

### **4c. GROUP BY Clause**
**Purpose:** Groups rows by common values for aggregation  
**Your Example:**
```sql
SELECT YEAR(DateOfBirth) AS BirthYear, COUNT(*) AS NumberOfCitizens 
FROM Citizens 
GROUP BY YEAR(DateOfBirth);
```
**Explanation:**  
- Groups citizens by birth year  
- `COUNT(*)` calculates how many per group  
- Must include all non-aggregated columns in `GROUP BY`

---

### **4d. HAVING Clause**
**Purpose:** Filters groups (like WHERE for GROUP BY)  
**Your Example:**
```sql
SELECT YEAR(DateOfBirth) AS BirthYear, COUNT(*) AS NumberOfCitizens
FROM Citizens
GROUP BY YEAR(DateOfBirth)
HAVING COUNT(*) > 1;
```
**Explanation:**  
- Shows only years with >1 citizen (your result was empty)  
- `HAVING` vs `WHERE`:  
  - `WHERE` filters rows before grouping  
  - `HAVING` filters groups after grouping

---

### **4e. Aggregate Function**
**Purpose:** Performs calculations across rows  
**Your Example:**
```sql
SELECT AVG(Fee) AS AverageFee FROM Services;
```
**Common Aggregates:**  
- `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`  
- Your query calculated the average service fee (Result: 185.00)

---

### **4f. UPDATE Clause**
**Purpose:** Modifies existing records  
**Your Example:**
```sql
UPDATE Services SET Fee = 60.00 WHERE ServiceName = 'ID Application';
```
**Explanation:**  
- Changes fee for "ID Application" from 50.00 to 60.00  
- Always use `WHERE` to target specific rows (omitting it updates ALL rows)

---

### **4g. DELETE Clause**
**Purpose:** Removes records (failed in your example)  
**Attempted:**
```sql
DELETE FROM Citizens;
```
**Why Failed:**  
- Foreign key constraint (citizens referenced in Appointments/Queues)  
- Safe alternative:  
  ```sql
  DELETE FROM Citizens WHERE CitizenID NOT IN (SELECT CitizenID FROM Appointments);
  ```

---

### **4h. UNION Clause**
**Purpose:** Combines results from multiple queries  
**Your Example:**
```sql
SELECT FirstName, LastName FROM Citizens
UNION
SELECT FirstName, LastName FROM Employees;
```
**Key Points:**  
- Merges names from both tables  
- Removes duplicates (use `UNION ALL` to keep duplicates)  
- All queries must have same number/type of columns

---

### **4i. INTERSECT Clause**
**Purpose:** Returns only common records (empty in your case)  
**Your Example:**
```sql
SELECT FirstName, LastName FROM Citizens
WHERE EXISTS (
  SELECT 1 FROM Employees 
  WHERE Employees.FirstName = Citizens.FirstName 
  AND Employees.LastName = Citizens.LastName
);
```
**Note:**  
- MySQL doesn't natively support `INTERSECT`  
- You simulated it with `EXISTS` subquery  
- Result was empty (no shared names between citizens/employees)

---

### **4j. SELECT vs SELECT DISTINCT**
**Purpose:** Controls duplicate results  
**Your Example:**
```sql
SELECT LastName FROM Citizens;          -- Shows all (including duplicates if any)
SELECT DISTINCT LastName FROM Citizens; -- Shows unique values only
```
**Key Difference:**  
- Both gave same output because all last names were unique  
- `DISTINCT` eliminates duplicate values in results

---

### **Visual Summary of Clause Types**

| Clause Type       | Purpose                          | Example Use Case                     |
|-------------------|----------------------------------|---------------------------------------|
| **Filtering**     | Narrow down results              | `WHERE Status='Waiting'`              |
| **Sorting**       | Order results                    | `ORDER BY QueueNumber DESC`           |
| **Grouping**      | Summarize data                   | `GROUP BY ServiceID`                  |
| **Modifying**     | Change data                      | `UPDATE Queues SET Status='Completed'`|
| **Combining**     | Merge query results              | `UNION` (citizens + employees)        |

Each clause serves a specific role in querying or maintaining your Home Affairs database. Would you like me to elaborate on any particular one?