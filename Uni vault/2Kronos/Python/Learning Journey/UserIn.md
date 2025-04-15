### **1. User Input Handling**

- **`input()` Function**:
    
    - Always returns a **string** → Must typecast for numerical use.
        
    - **Best Practice**: Combine typecasting with input in one line:
```python
age = int(input("Enter age: ")) #Efficient and clean
```
        
- **Validation**: Use `try-except` to handle invalid inputs (not shown in tutorial but critical for real-world code).

### **2. String Formatting (f-strings)**

- **Syntax**: `f"Text {variable}"` → Embeds variables/expressions directly.
    
- **Advanced Use**:
    
    - Formatting numbers: `f"Price: ${price:.2f}"` → Rounds to 2 decimal places.
        
    - Expressions: `f"Total: {x * y}"` → Computes within the string.