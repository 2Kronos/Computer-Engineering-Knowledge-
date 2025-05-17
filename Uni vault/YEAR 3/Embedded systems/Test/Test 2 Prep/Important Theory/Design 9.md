
Here are three **slightly easier** coding questions based **only** on the concepts from your document (Serial input, substring, indexOf, LED control). All questions use the **same circuit** (LEDs on pins 3, 5, 9 + Serial Monitor).

---

### **Question 1: Simple LED On/Off Parser**  
**Task:**  
Read a command like `"On(5)"` or `"Off(3)"` from Serial and turn the correct LED on/off. Print feedback like:  
- `"LED 5 is now ON"`  
- `"Error: Invalid pin"` (if pin is not 3, 5, or 9).  

**Requirements:**  
1. Use `indexOf()` to find `"On("` or `"Off("`.  
2. Extract the pin number with `substring()`.  
3. Validate the pin (must be 3, 5, or 9).  

**Example:**  
```
Input: "On(5)"  
Output: "LED 5 is now ON" (pin 5 lights up)  
```

---

### **Question 2: Blink an LED X Times**  
**Task:**  
Read a command like `"Blink(3, 4)"` (blink pin 3 four times) and make the LED blink. Print each blink count (`"Blink 1/4"`, etc.).  

**Requirements:**  
1. Extract both numbers from the command (e.g., pin `3`, blink count `4`).  
2. Use a `for` loop to blink the LED.  
3. Print status for each blink.  

**Example:**  
```
Input: "Blink(5, 2)"  
Output:  
"Blinking LED 5 (1/2)"  
"Blinking LED 5 (2/2)"  
```

---

### **Question 3: LED Status Checker**  
**Task:**  
When the user types `"Status"`, print the current state of all LEDs (pins 3, 5, 9) as `ON` or `OFF`.  

**Requirements:**  
1. Use `digitalRead()` to check each pin.  
2. Print in a clean format:  
   ```  
   LED 3: OFF  
   LED 5: ON  
   LED 9: OFF  
   ```  

**Example:**  
```
Input: "Status"  
Output: (see above)  
```

---

### **Why These Fit Your Document:**  
1. All use **Serial input** and `substring()`/`indexOf()` (from 9.1.1, 9.1.2, 9.2.1).  
2. **LED control** matches 9.4 (no new hardware).  
3. **Error handling** (e.g., invalid pins) is based on 9.2.1’s validation logic.  

Let me know if you’d like these simplified further!