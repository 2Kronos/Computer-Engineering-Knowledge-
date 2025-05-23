Here are the key coding concepts and reusable snippets extracted from the Arduino Interrupts design:

---

### **1. Interrupt Basics**
**Concept:** Use hardware interrupts to handle time-sensitive events without blocking main program execution.  
**Reusable Setup:**
```cpp
void setup() {
  pinMode(13, OUTPUT);  // LED pin
  attachInterrupt(digitalPinToInterrupt(2), ISR, RISING);  // Interrupt on pin 2
}
```

---

### **2. Interrupt Service Routine (ISR)**
**Concept:** Keep ISRs short and fast to avoid disrupting main program flow.  
**Reusable Snippet:**
```cpp
volatile bool state = false;  // Use 'volatile' for variables shared with ISRs

void ISR() {
  state = !state;             // Toggle state
  digitalWrite(4, state);     // Control LED
  Serial.println("Interrupt!");  // Optional debug
}
```

---

### **3. Multiple Interrupts**
**Concept:** Attach interrupts to different pins for multi-event handling.  
**Reusable Code:**
```cpp
void setup() {
  attachInterrupt(digitalPinToInterrupt(2), toggleLED, RISING);  // Pin 2
  attachInterrupt(digitalPinToInterrupt(3), turnOffLED, RISING); // Pin 3
}

void toggleLED() { digitalWrite(4, !digitalRead(4)); }  // Toggle
void turnOffLED() { digitalWrite(4, LOW); }            // Force OFF
```

---

### **4. Interrupt Modes**
**Trigger Conditions:**  
```cpp
RISING    // Low-to-High transition
FALLING   // High-to-Low transition
CHANGE    // Any voltage change
LOW       // Pin stays low (not recommended for most cases)
```

---

### **5. Heartbeat Indicator**
**Concept:** Use the main loop to show program activity while interrupts handle events.  
**Reusable Pattern:**
```cpp
void loop() {
  digitalWrite(LED_BUILTIN, HIGH);  // Blink built-in LED
  delay(1000);
  digitalWrite(LED_BUILTIN, LOW);
  delay(1000);
}
```

---

### **6. Best Practices**
1. **Debounce Buttons:** Add a small delay or hardware debouncing to avoid false triggers.  
2. **Global Interrupt Control:**  
   ```cpp
   noInterrupts();  // Pause interrupts (critical sections)
   interrupts();    // Resume
   ```
3. **Volatile Variables:** Always declare shared variables as `volatile`.  
4. **Pin Mapping:** Use `digitalPinToInterrupt(pin)` for cross-board compatibility.

---

### **7. Reusable Template**
```cpp
volatile bool buttonPressed = false;

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT_PULLUP);  // Button to ground
  attachInterrupt(digitalPinToInterrupt(2), handlePress, FALLING);
}

void loop() {
  if (buttonPressed) {
    // Handle button action (non-time-critical)
    buttonPressed = false;
  }
  // Other main tasks...
}

void handlePress() {
  buttonPressed = true;  // Minimal ISR
}
```

---

### **Key Notes**
- **Interrupt Pins:** On UNO, only pins 2 (INT0) and 3 (INT1) support hardware interrupts.  
- **Avoid Delays in ISRs:** Can cause instability. Use flags for deferred processing.  
- **Resource:** [Official Arduino Interrupt Guide](https://www.arduino.cc/reference/en/language/functions/external-interrupts/attachinterrupt/)  
