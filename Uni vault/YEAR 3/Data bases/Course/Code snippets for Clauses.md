Here are **reusable SQL snippet templates** for all clauses from your assignment, designed for easy adaptation to any database:

---

### **1. WHERE Clause**
```sql
-- Basic filtering
SELECT * FROM [table_name] 
WHERE [column] [operator] [value];

-- Example with dates
SELECT * FROM employees 
WHERE hire_date > '2023-01-01';
```

---

### **2. ORDER BY Clause**
```sql
-- Single column sorting
SELECT * FROM [table_name] 
ORDER BY [column] [ASC|DESC];

-- Multi-column sorting
SELECT * FROM products 
ORDER BY category ASC, price DESC;
```

---

### **3. GROUP BY Clause**
```sql
-- Basic grouping with count
SELECT [group_column], COUNT(*) 
FROM [table_name] 
GROUP BY [group_column];

-- With multiple columns
SELECT department, job_title, AVG(salary)
FROM employees
GROUP BY department, job_title;
```

---

### **4. HAVING Clause**
```sql
-- Filter groups
SELECT [group_column], COUNT(*) 
FROM [table_name] 
GROUP BY [group_column]
HAVING [condition];

-- Example
SELECT product_id, SUM(quantity) 
FROM orders 
GROUP BY product_id
HAVING SUM(quantity) > 100;
```

---

### **5. Aggregate Functions**
```sql
-- Common aggregates
SELECT 
    COUNT(*) AS total,
    AVG([numeric_column]) AS average,
    MAX([column]) AS maximum,
    MIN([column]) AS minimum
FROM [table_name];
```

---

### **6. UPDATE Clause**
```sql
-- Single record update
UPDATE [table_name] 
SET [column] = [value] 
WHERE [condition];

-- Multiple columns
UPDATE products 
SET price = 19.99, stock = stock-1 
WHERE product_id = 101;
```

---

### **7. DELETE Clause**
```sql
-- Conditional deletion
DELETE FROM [table_name] 
WHERE [condition];

-- Clear table (caution!)
TRUNCATE TABLE [table_name];
```

---

### **8. JOIN Clauses**
```sql
-- INNER JOIN (default)
SELECT a.*, b.* 
FROM table_a a
JOIN table_b b ON a.key = b.key;

-- LEFT JOIN (all from left table)
SELECT * FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;
```

---

### **9. UNION Clause**
```sql
-- Combine queries (no duplicates)
SELECT [columns] FROM table1
UNION
SELECT [columns] FROM table2;

-- Keep duplicates
SELECT [columns] FROM table1
UNION ALL
SELECT [columns] FROM table2;
```

---

### **10. Subqueries**
```sql
-- In WHERE clause
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- In FROM clause
SELECT * FROM 
    (SELECT user_id, COUNT(*) FROM orders GROUP BY user_id) 
AS order_counts;
```

---

### **11. Common Table Expressions (CTEs)**
```sql
WITH department_stats AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT * FROM department_stats 
WHERE avg_salary > 50000;
```

---

### **12. Index Creation**
```sql
-- Single column index
CREATE INDEX idx_column ON table_name(column_name);

-- Composite index
CREATE INDEX idx_name ON users(last_name, first_name);
```

---

### **13. Transaction Control**
```sql
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT; -- or ROLLBACK if errors occur
```

---

### **14. String Functions**
```sql
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    UPPER(email) AS email_upper,
    SUBSTRING(phone, 1, 3) AS area_code
FROM contacts;
```

---

### **15. Date Functions**
```sql
SELECT 
    NOW() AS current_datetime,
    DATEDIFF(end_date, start_date) AS days_difference,
    DATE_ADD(start_date, INTERVAL 1 MONTH) AS next_month
FROM projects;
```

Each snippet follows this pattern:
1. Generic template (replace items in `[square brackets]`)
2. Concrete example
3. Clear formatting for readability

To use:
1. Replace placeholder values with your actual table/column names
2. Adjust conditions to your specific needs
3. Most work across MySQL, PostgreSQL, SQL Server with minor syntax adjustments