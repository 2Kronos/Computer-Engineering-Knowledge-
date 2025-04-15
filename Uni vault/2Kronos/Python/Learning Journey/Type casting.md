
Here's a **concise bullet-point summary** of the **Typecasting** tutorial:

---

### **Typecasting in Python**  
#### **1. What is Typecasting?**  
- Converting a value from **one data type to another** (e.g., `int` → `float`, `str` → `bool`).  
- **Why?**  
  - User input is always a `str` (e.g., `"5"` needs conversion to `int` for math).  
  - Rounding floats (`3.7` → `3`).  
  - Data validation (check if a string is empty).  

#### **2. Explicit Typecasting (Manual)**  
Use built-in functions:  
- `int()` → Converts to integer (truncates decimals):  
  ```python
  GPA = 1.9
  print(int(GPA))  # Output: 1
  ```  
- `float()` → Converts to float (adds `.0`):  
  ```python
  age = 21
  print(float(age))  # Output: 21.0
  ```  
- `str()` → Converts to string:  
  ```python
  is_student = True
  print(str(is_student))  # Output: "True" (now a string)
  ```  
- `bool()` → Converts to boolean:  
  - **Numbers**: `0` → `False`, any other → `True`.  
  - **Strings**: Empty (`""`) → `False`, non-empty → `True`.  
  ```python
  print(bool(0))      # False
  print(bool("Hi"))   # True
  ```  

#### **3. Checking Data Types**  
- Use `type()`:  
  ```python
  name = "Raya"
  print(type(name))  # Output: <class 'str'>
  ```  

#### **4. Implicit Typecasting (Automatic)**  
- Python converts types automatically in operations:  
  ```python
  x = 2      # int
  y = 2.0    # float
  print(x / y)  # Output: 1.0 (float)
  ```  

#### **5. Key Examples**  
| **Conversion**       | **Code**                          | **Result**       |
|----------------------|----------------------------------|------------------|
| Float → Integer      | `int(3.9)`                       | `3` (truncated) |
| String → Integer     | `int("5")`                       | `5`              |
| Integer → Boolean    | `bool(10)`                       | `True`           |
| Empty String → Bool  | `bool("")`                       | `False`          |

#### **6. Practical Uses**  
- **User Input**: Convert `input()` (always `str`) to numbers:  
  ```python
  user_age = int(input("Enter age: "))  # "25" → 25
  ```  
- **Data Validation**:  
  ```python
  name = input("Name: ")
  if bool(name):  # False if empty
      print(f"Hello, {name}!")
  ```  

---

### **Key Takeaways**  
- **Explicit**: Use `int()`, `float()`, `str()`, `bool()` to manually convert.  
- **Implicit**: Python auto-converts in operations (e.g., `int + float = float`).  
- **Boolean Rules**:  
  - `False`: `0`, `0.0`, `""`, `None`.  
  - `True`: Any other value.  

