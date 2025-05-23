
Here are the key coding concepts and reusable snippets extracted from the Math Functions (Sensors, Graphs) design:

---

### **1. Waveform Generation**
**Concept:** Create mathematical waveforms (sawtooth, sine) for signal simulation.  
**Reusable Snippets:**

#### **Sawtooth Wave:**
```cpp
void loop() {
  for(int i = 0; i < 50; i++) {
    Serial.println(i);  // Linear ramp (0-49)
    delay(100);
  }
}
```

#### **Sine Wave:**
```cpp
void loop() {
  for(int i = 0; i < 200; i++) {
    float angle = i * 2 * PI / 200;  // 0 to 2π radians
    float value = 10 * sin(angle);   // Amplitude = 10
    Serial.println(value);
    delay(200);
  }
}
```

---

### **2. Ultrasonic Distance Sensor**
**Concept:** Measure distance using time-of-flight of sound waves.  
**Reusable Code:**
```cpp
const int trigPin = 6, echoPin = 7;

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  
  long duration = pulseIn(echoPin, HIGH);
  float distance = duration * 0.034 / 2;  // cm
  Serial.print("Distance: "); Serial.println(distance);
  delay(100);
}
```

---

### **3. Mapping Values with `map()`**
**Concept:** Convert sensor ranges to usable outputs (e.g., distance to brightness).  
**Reusable Snippet:**
```cpp
int brightness = map(distance, 0, 200, 255, 0);  // Invert range (close = bright)
brightness = constrain(brightness, 0, 255);      // Clamp to valid PWM range
analogWrite(3, brightness);
```

---

### **4. Potentiometer Percentage Conversion**
**Concept:** Read a potentiometer and map its value to 0-100%.  
**Reusable Code:**
```cpp
int potValue = analogRead(A5);
int percent = map(potValue, 4, 1023, 0, 100);  // Ignore low-noise (4)
Serial.println(percent);
```

---

### **5. Cosine-Based LED Intensity**
**Concept:** Use trigonometric functions to create smooth brightness transitions.  
**Reusable Snippet:**
```cpp
int angle = map(potValue, 4, 1023, 0, 360);
float rad = angle * PI / 180.0;                // Degrees → radians
int intensity = 1000 * cos(rad);               // Scale to -1000 to 1000
int pwm = map(intensity, -1000, 1000, 0, 255); // Fit to PWM range
analogWrite(3, pwm);
```

---

### **6. Phase-Shifted LEDs**
**Concept:** Create multiple LEDs with fixed phase differences.  
**Reusable Code:**
```cpp
int pins[] = {3, 5, 6, 9, 10, 11};  // LED pins
int phaseShift = 60;                 // Degrees between LEDs

void loop() {
  int potValue = analogRead(A5);
  for(int i = 0; i < 6; i++) {
    int angle = map(potValue, 4, 1023, i * phaseShift, 360 + i * phaseShift);
    float rad = angle * PI / 180.0;
    int pwm = map(1000 * cos(rad), -1000, 1000, 0, 255);
    analogWrite(pins[i], pwm);
  }
}
```

---

### **Key Notes**
1. **Precision Timing:** Use `delayMicroseconds()` for sensors requiring µs precision (e.g., ultrasonic).  
2. **Trigonometric Functions:** Convert angles to radians for `sin()`, `cos()`.  
3. **Hardware Constraints:**  
   - PWM range: 0-255  
   - `analogRead()` range: 0-1023  
4. **Phase Shifts:** Adjust `map()` input ranges to offset waveforms.  

---

### **Best Practices**
- **Debounce Inputs:** Add `delay(10)` after reading potentiometers to reduce noise.  
- **Modularize Code:** Use functions (e.g., `calculatePWM()`) for reusable logic.  
- **Debugging:** Print intermediate values (`angle`, `intensity`) to Serial Monitor.  

