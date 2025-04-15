
### **Databases** 

For this course the database name will be called myDB 
- <u>Setting database to read only </u>
```MySQL
ALTER DATABASE myDB READ ONLY = 1
-- To disable it make it equal top 0 
```

- <u> Permanently delete a data base </u>
```MySQL
DROP DATABASE mydb;
```

#### **Relational Database in MySQL**

A **relational database** in MySQL is a type of database that stores and organizes data in **tables** with predefined relationships between them. It follows the **Relational Database Management System (RDBMS)** model, where data is structured using **rows and columns**.

### **Key Features**

- **Tables & Rows:** Data is stored in tables with unique rows.
- **Relationships:** Tables are connected using **primary keys** and **foreign keys**.
- **SQL Queries:** Uses **Structured Query Language (SQL)** to manipulate data.
- **Normalization:** Avoids data redundancy by organizing data efficiently.

### **Example in MySQL**

#### **Creating Two Related Tables**

```sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

Here:

- **Customers table** stores customer details.
- **Orders table** stores order details.
- **customer_id** links the two tables, ensuring a **relational structure**.

---
### **Tables**

- Consists of rows and columns

