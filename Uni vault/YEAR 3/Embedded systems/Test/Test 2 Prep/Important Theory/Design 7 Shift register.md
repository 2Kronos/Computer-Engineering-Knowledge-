
## ✅ Summary of Important Concepts

### 🔌 Circuit Concepts:

- **Shift Register (74HC595)**: Used to control multiple outputs (like LEDs) with fewer Arduino pins.
    
- **Pin Connections**:
    
    - 74HC595 pins:
        
        - **DS (Data Pin)** → Arduino digital pin (e.g., 11)
            
        - **SH_CP (Shift Clock Pin)** → Arduino digital pin (e.g., 12)
            
        - **ST_CP (Storage Clock Pin)** → Arduino digital pin (e.g., 8)
            
    - **Q0-Q7**: Connected to 8 LEDs with current-limiting resistors.
        
    - **GND and VCC**: Connected to ground and 5V.
        
    - **OE (Output Enable)**: Tied to ground (active low).
        
    - **MR (Master Reset)**: Tied to 5V (inactive high).
        

### 💻 Coding Concepts:

- **ShiftOut Function**: Arduino function that sends data serially to the 74HC595 register.
    
- **Bit Manipulation**: You control which LEDs are on by sending an 8-bit binary number.
    
- **Delays and Looping**: Used to create patterns or animations with the LEDs.
    
- **Modular Code**: Often uses functions to organize repeated actions like sending data or blinking LEDs.
    

---

## 🧠 Practice Coding Questions (Using the Same Circuit)

### 1. **Alternating LEDs Pattern**

> Write a sketch that alternates between turning on the even-positioned LEDs and the odd-positioned LEDs every second.

💡 _Hint_: Use binary values like `0b10101010` and `0b01010101` with `shiftOut()`.

---

### 2. **Knight Rider Effect**

> Write a sketch that creates a "bouncing" LED effect from left to right and back, like the Knight Rider car.

💡 _Hint_: Use bit-shifting (`<<` and `>>`) to move a single "1" across the LED positions.

---

### 3. **Count in Binary**

> Write a sketch that counts from 0 to 255 in binary and displays the count on the LEDs, updating every 250 milliseconds.

💡 _Hint_: Loop from 0 to 255 and `shiftOut()` each value.

---
