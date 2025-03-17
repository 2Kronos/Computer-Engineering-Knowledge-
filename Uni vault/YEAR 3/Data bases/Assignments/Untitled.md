Let's start with **Question 1: Demonstrate Entity Integrity**.

### **Question 1: Demonstrate Entity Integrity**

#### **1.a. Show a screenshot of all the tuples in any one of your relations**

**Instruction**: You need to display all the records (tuples) from one of the tables in your database. For example, you can choose the `Citizens` table.

**MySQL Command**:
```sql
SELECT * FROM Citizens;
```

**Explanation**: This command will display all the records in the `Citizens` table. You should take a screenshot of the output.

---

#### **1.b. Try to add a record that has the same primary key as any one of your records**

**Instruction**: Attempt to insert a new record into the `Citizens` table with a `CitizenID` that already exists. This should fail because of the primary key constraint.

**MySQL Command**:
```sql
INSERT INTO Citizens (CitizenID, FirstName, LastName, IDNumber, DateOfBirth, PhoneNumber)
VALUES (1, 'Alice', 'Johnson', '9901011234567', '1999-01-01', '0712345678');
```

**Explanation**: This command tries to insert a new record with `CitizenID = 1`, which already exists in the table. The primary key constraint should prevent this insertion, and you should get an error message.

---

#### **1.c. Get a screenshot of the resulting success/failure**

**Instruction**: After running the above command, take a screenshot of the error message that appears. This will demonstrate that the database enforces entity integrity by preventing duplicate primary keys.

---

### **Next Steps**:
1. Run the `SELECT * FROM Citizens;` command and take a screenshot of the output.
2. Run the `INSERT INTO Citizens` command with a duplicate primary key and take a screenshot of the error message.
3. Once you have completed these steps, type **"done"** in the text box, and I will provide the instructions for **Question 2**.

Let me know if you need further clarification!

---

Great! Now let's move on to **Question 2: Demonstrate Referential Integrity**.

### **Question 2: Demonstrate Referential Integrity**

#### **2.a. Show a screenshot of all the tuples from your first relation (this relation has no foreign key)**

**Instruction**: Display all the records from a table that does not have a foreign key. In your database, the `Services` table does not have any foreign keys, so you can use that.

**MySQL Command**:
```sql
SELECT * FROM Services;
```

**Explanation**: This command will display all the records in the `Services` table. You should take a screenshot of the output.

---

#### **2.b. Show a screenshot of all the tuples from your second relation (this relation should have a foreign key)**

**Instruction**: Display all the records from a table that has a foreign key. In your database, the `Queues` table has foreign keys (`CitizenID` and `ServiceID`), so you can use that.

**MySQL Command**:
```sql
SELECT * FROM Queues;
```

**Explanation**: This command will display all the records in the `Queues` table. You should take a screenshot of the output.

---

#### **2.c. Try to add a record on the second table, and get a screenshot of your failure/success**

**Instruction**: Attempt to insert a new record into the `Queues` table with a `CitizenID` or `ServiceID` that does not exist in the `Citizens` or `Services` table. This should fail because of the foreign key constraint.

**MySQL Command**:
```sql
INSERT INTO Queues (CitizenID, ServiceID, QueueNumber, Status)
VALUES (999, 999, 106, 'Waiting');
```

**Explanation**: This command tries to insert a new record with `CitizenID = 999` and `ServiceID = 999`, which do not exist in the `Citizens` or `Services` tables. The foreign key constraint should prevent this insertion, and you should get an error message.

---

#### **2.d. Try to remove all records from the first table, and get a screenshot of your failure/success**

**Instruction**: Attempt to delete all records from the `Services` table. This should fail if there are records in the `Queues` table that reference the `Services` table.

**MySQL Command**:
```sql
DELETE FROM Services;
```

**Explanation**: This command tries to delete all records from the `Services` table. However, since the `Queues` table has foreign key references to the `Services` table, the deletion should fail, and you should get an error message.

---

### **Next Steps**:
1. Run the `SELECT * FROM Services;` command and take a screenshot of the output.
2. Run the `SELECT * FROM Queues;` command and take a screenshot of the output.
3. Run the `INSERT INTO Queues` command with invalid foreign keys and take a screenshot of the error message.
4. Run the `DELETE FROM Services;` command and take a screenshot of the error message.
5. Once you have completed these steps, type **"done"** in the text box, and I will provide the instructions for **Question 3**.

Let me know if you need further clarification!


Great! Now let's move on to **Question 3: Explain Entity Integrity and Referential Integrity**.

### **Question 3: Explain Entity Integrity and Referential Integrity**

#### **3.a. Using your answers from question 1, what is entity integrity?**

**Instruction**: Based on the results from **Question 1**, explain what **entity integrity** is. Refer to the screenshots and outcomes from the commands you executed in **Question 1**.

**Explanation**:
- **Entity Integrity** ensures that each row (or tuple) in a table is uniquely identifiable by its primary key. This means:
  - No two rows can have the same primary key value.
  - The primary key cannot be null (it must always have a value).
- In **Question 1**, you demonstrated entity integrity by:
  - Showing all the tuples in the `Citizens` table, where each `CitizenID` is unique.
  - Attempting to insert a record with a duplicate primary key (`CitizenID = 1`), which failed because the primary key must be unique.

**Answer**:
Entity integrity ensures that each record in a table is uniquely identifiable by its primary key. In the `Citizens` table, the `CitizenID` is the primary key, and it must be unique and non-null. When I tried to insert a record with a duplicate `CitizenID`, the database rejected the insertion, demonstrating that entity integrity is enforced.

---

#### **3.b. Using your answers from question 2, what is referential integrity?**

**Instruction**: Based on the results from **Question 2**, explain what **referential integrity** is. Refer to the screenshots and outcomes from the commands you executed in **Question 2**.

**Explanation**:
- **Referential Integrity** ensures that relationships between tables remain consistent. This means:
  - A foreign key in one table must reference an existing primary key in another table.
  - You cannot delete a record from a primary key table if it is referenced by a foreign key in another table.
- In **Question 2**, you demonstrated referential integrity by:
  - Showing all the tuples in the `Queues` table, where `CitizenID` and `ServiceID` are foreign keys referencing the `Citizens` and `Services` tables.
  - Attempting to insert a record in the `Queues` table with invalid foreign keys (`CitizenID = 999` and `ServiceID = 999`), which failed because the foreign keys must reference existing records.
  - Attempting to delete all records from the `Services` table, which failed because the `Queues` table has records that reference the `Services` table.

**Answer**:
Referential integrity ensures that relationships between tables are maintained. In the `Queues` table, the `CitizenID` and `ServiceID` are foreign keys that reference the `Citizens` and `Services` tables, respectively. When I tried to insert a record with invalid foreign keys or delete records from the `Services` table, the database rejected the operations, demonstrating that referential integrity is enforced.

---

### **Next Steps**:
1. Write your answers for **3.a** and **3.b** based on the explanations above.
2. Once you have completed these steps, type **"done"** in the text box, and I will provide the instructions for **Question 4**.

Let me know if you need further clarification!


Got it! I’ll rewrite **Question 4** with clear instructions on when to take **before** and **after** screenshots. Here's the revised version:

---

### **Question 4: Demonstrate SQL Clauses**

For each of the SQL clauses below, follow these steps:
1. **Before**: Take a screenshot of the affected table(s) **before** running the query.
2. **Execute**: Run the SQL query.
3. **Output**: Take a screenshot of the query output.
4. **After**: If the query modifies the table (e.g., `UPDATE`, `DELETE`), take a screenshot of the affected table **after** running the query.

---

#### **4.a. WHERE Clause**

**Instruction**: Use the `WHERE` clause to filter records from the `Citizens` table. Retrieve all citizens born after 1990.

**MySQL Command**:
```sql
SELECT * FROM Citizens WHERE DateOfBirth > '1990-01-01';
```

**Screenshots**:
1. **Before**: Screenshot of the `Citizens` table.
2. **Output**: Screenshot of the query output.
3. **After**: Not needed (no modification).

---

#### **4.b. ORDER BY Clause**

**Instruction**: Use the `ORDER BY` clause to sort records in the `Citizens` table by `LastName` in ascending order.

**MySQL Command**:
```sql
SELECT * FROM Citizens ORDER BY LastName ASC;
```

**Screenshots**:
1. **Before**: Screenshot of the `Citizens` table.
2. **Output**: Screenshot of the query output.
3. **After**: Not needed (no modification).

---

#### **4.c. GROUP BY Clause**

**Instruction**: Use the `GROUP BY` clause to group records in the `Citizens` table by birth year and count the number of citizens born in each year.

**MySQL Command**:
```sql
SELECT YEAR(DateOfBirth) AS BirthYear, COUNT(*) AS NumberOfCitizens
FROM Citizens
GROUP BY YEAR(DateOfBirth);
```

**Screenshots**:
1. **Before**: Screenshot of the `Citizens` table.
2. **Output**: Screenshot of the query output.
3. **After**: Not needed (no modification).

---

#### **4.d. HAVING Clause**

**Instruction**: Use the `HAVING` clause to filter groups created by the `GROUP BY` clause. Find years where more than one citizen was born.

**MySQL Command**:
```sql
SELECT YEAR(DateOfBirth) AS BirthYear, COUNT(*) AS NumberOfCitizens
FROM Citizens
GROUP BY YEAR(DateOfBirth)
HAVING COUNT(*) > 1;
```

**Screenshots**:
1. **Before**: Screenshot of the `Citizens` table.
2. **Output**: Screenshot of the query output.
3. **After**: Not needed (no modification).

---

#### **4.e. Aggregate Function**

**Instruction**: Use an aggregate function to calculate the average fee for services in the `Services` table.

**MySQL Command**:
```sql
SELECT AVG(Fee) AS AverageFee FROM Services;
```

**Screenshots**:
1. **Before**: Screenshot of the `Services` table.
2. **Output**: Screenshot of the query output.
3. **After**: Not needed (no modification).

---

#### **4.f. UPDATE Clause**

**Instruction**: Use the `UPDATE` clause to modify the fee for the "ID Application" service in the `Services` table.

**MySQL Command**:
```sql
UPDATE Services SET Fee = 60.00 WHERE ServiceName = 'ID Application';
```

**Screenshots**:
1. **Before**: Screenshot of the `Services` table.
2. **Output**: Screenshot of the query output (if any).
3. **After**: Screenshot of the `Services` table after the update.

---

#### **4.g. DELETE Clause**

**Instruction**: Use the `DELETE` clause to remove a citizen from the `Citizens` table (e.g., delete the citizen with `CitizenID = 5`).

**MySQL Command**:
```sql
DELETE FROM Citizens WHERE CitizenID = 5;
```

**Screenshots**:
1. **Before**: Screenshot of the `Citizens` table.
2. **Output**: Screenshot of the query output (if any).
3. **After**: Screenshot of the `Citizens` table after the deletion.

---

#### **4.h. UNION Clause**

**Instruction**: Use the `UNION` clause to combine the `FirstName` and `LastName` columns from the `Citizens` and `Employees` tables.

**MySQL Command**:
```sql
SELECT FirstName, LastName FROM Citizens
UNION
SELECT FirstName, LastName FROM Employees;
```

**Screenshots**:
1. **Before**: Screenshots of the `Citizens` and `Employees` tables.
2. **Output**: Screenshot of the query output.
3. **After**: Not needed (no modification).

---

#### **4.i. INTERSECT Clause**

**Instruction**: Simulate the `INTERSECT` clause to find common names between the `Citizens` and `Employees` tables using `EXISTS`.

**MySQL Command**:
```sql
SELECT FirstName, LastName FROM Citizens
WHERE EXISTS (SELECT 1 FROM Employees WHERE Employees.FirstName = Citizens.FirstName AND Employees.LastName = Citizens.LastName);
```

**Screenshots**:
1. **Before**: Screenshots of the `Citizens` and `Employees` tables.
2. **Output**: Screenshot of the query output.
3. **After**: Not needed (no modification).

---

#### **4.j. SELECT vs SELECT DISTINCT**

**Instruction**: Use `SELECT` and `SELECT DISTINCT` to retrieve all last names and distinct last names from the `Citizens` table.

**MySQL Command**:
```sql
-- Retrieve all last names
SELECT LastName FROM Citizens;

-- Retrieve distinct last names
SELECT DISTINCT LastName FROM Citizens;
```

**Screenshots**:
1. **Before**: Screenshot of the `Citizens` table.
2. **Output**: Screenshots of both query outputs.
3. **After**: Not needed (no modification).

---

### **Summary of Screenshots**:
- **Before**: Always take a screenshot of the relevant table(s) before running the query.
- **Output**: Always take a screenshot of the query output.
- **After**: Only for `UPDATE` and `DELETE` clauses, take a screenshot of the table after running the query.

---

### **Next Steps**:
1. Execute each query as described.
2. Take the required screenshots for each clause.
3. Once you have completed these steps, type **"done"** in the text box, and I will help you wrap up the assignment.

Let me know if you need further clarification!