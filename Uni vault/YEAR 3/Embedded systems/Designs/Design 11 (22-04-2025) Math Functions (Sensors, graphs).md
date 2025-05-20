
# Graphs
# 11.1  saw tooth wave

# Circuit link

https://www.tinkercad.com/things/97jHLx7H8Mn-design-111

# Code

```C++
// C++ code
//
int samples;
void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(2000000);
}

void loop()
{
  for(samples = 0; samples < 50; samples++){
 Serial.println(samples);
 delay(100);
  }
}
```

# Notes


---


# 11.2 sine wave

# Circuit link

https://www.tinkercad.com/things/kygIWPffmee-design-112


# Code

```C++
int samples, amplitude_I;
double amplitude_F, angle;

void setup() {
    Serial.begin(2000000);
}

void loop() {
    for(samples = 0; samples < 200; samples++) {
        angle = samples * 2 * PI / 200;
        amplitude_F = 10 * sin(angle);
        Serial.println(amplitude_F);
        delay(200);
    }
}

```

# Notes

### **1. Key Components**
| Variable      | Purpose                               |
| ------------- | ------------------------------------- |
| `samples`     | Counter for loop iterations (0 to 49) |
| `angle`       | Angle in radians (0 to 2π)            |
| `amplitude_F` | Calculated sine wave value            |
| `amplitude_I` | *Unused in this code*                 |

---

### **2. How the Sine Wave is Generated**
#### **Step 1: Angle Calculation**
```cpp
angle = samples * 2 * PI / 50;
```
- Divides a full sine wave cycle (`2π` radians) into **50 points**.
- **Example**:
  - When `samples = 0`: `angle = 0`
  - When `samples = 25`: `angle = π` (halfway point)
  - When `samples = 49`: `angle ≈ 2π` (cycle completes).

#### **Step 2: Sine Value Calculation**
```cpp
amplitude_F = 100 * sin(angle);
```
- `sin(angle)` computes the sine of the angle (range: `-1` to `1`).
- Multiplied by `100` to scale the output to **±100** (larger amplitude).

#### **Step 3: Output**
```cpp
Serial.println(amplitude_F);
```
- Prints each sine wave point to the Serial Monitor.
- **Baud Rate**: `2000000` (very fast to handle rapid data).

#### **Step 4: Delay**
```cpp
delay(100);
```
- Adds a 100ms pause between samples (slows down wave generation for visibility).

---

### **3. Visualization of the Sine Wave**
The code produces **one full sine wave cycle** with 50 points:  

### **6. Key Takeaways**
- The loop generates **50 discrete points** per sine wave cycle.
- `sin(angle)` creates smooth oscillations.
- Scaling (`*100`) makes the wave easier to observe.
- `delay(100)` controls the speed of wave generation (remove for faster output).


---





---
====================================
# **Sensors**

========================================
# 11.5 distance sensing

![[Pasted image 20250519163018.png]]

# Circuit link

# Code

```C++
const int trigPin = 6;  // Trigger pin
const int echoPin = 7; // Echo pin

void setup() {
  Serial.begin(9600);   // Start serial communication
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop() {
  // Clear the trigPin

  // Send 10μs pulse to trigger
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  
  // Measure echo pulse duration in microseconds
  long duration = pulseIn(echoPin, HIGH);
  
  // Calculate distance (in cm)
  // Speed of sound = 343m/s = 0.0343cm/μs for mm it is 0.343
  // Divide by 2 (round trip)
  float distance = duration * 0.034 / 2;
  
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");
  
  delay(100);  // Short delay between readings
}
```

# Notes

## 🧠 **Core Concept**

The ultrasonic sensor measures **distance** by sending a **sound pulse** and timing how long it takes to **reflect back** from an object. This is called **time-of-flight** measurement.

---

## 🧩 **Pin Roles**

- **`trigPin` (Trigger Pin)**: Sends the **trigger pulse** (starts the measurement).
    
- **`echoPin` (Echo Pin)**: Listens for the **reflected echo** (ends the measurement).
    

---

## 🔄 **Step-by-Step Working**

### 1. **Trigger Pulse**

```cpp
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
```

- A **10-microsecond pulse** is sent to the trigger pin.
    
- This causes the ultrasonic sensor to emit an **8-cycle sound wave** at 40 kHz.
    

---

### 2. **Echo Reception**

```cpp
long duration = pulseIn(echoPin, HIGH);
```

- The sensor sets the `echoPin` **HIGH** when it sends the pulse.
    
- It stays HIGH until the echo is received back.
    
- `pulseIn()` measures how long the `echoPin` stays HIGH (i.e., time taken for the sound to go to the object **and** come back).
    

---

### 3. **Distance Calculation**

```cpp
float distance = duration * 0.034 / 2;
```

- **Speed of sound** in air ≈ **0.034 cm/µs**.
    
- Multiply duration by 0.034 to get **total distance traveled** by sound (there and back).
    
- Divide by **2** to get **one-way** distance (sensor → object).
    

---

## 📏 Example Calculation

If `duration = 500 µs`:

```text
Distance = 500 * 0.034 / 2 = 8.5 cm
```

The object is 8.5 cm away.

---

## 🔁 Full Loop Behavior

1. Arduino sends a 10µs pulse from `trigPin`.
    
2. Sensor sends a sound wave.
    
3. Echo reflects off an object and returns.
    
4. Arduino measures how long `echoPin` stays HIGH.
    
5. Distance is calculated and printed.
    

### ⏱️ `delayMicroseconds()` vs `delay()`

|Function|Time Unit|Precision|Use Case|
|---|---|---|---|
|`delay(milliseconds)`|**Milliseconds** (1 ms = 1,000 µs)|Lower (min: ~1 ms)|Longer waits (e.g., pauses, UI)|
|`delayMicroseconds(µs)`|**Microseconds** (1 µs = 0.000001 s)|**High precision** (1–999 µs)|Short pulses, timing signals|

---

### 🔧 Why Use Microseconds in Ultrasonic Sensors?

- The ultrasonic sensor requires a **10-microsecond HIGH pulse** on the `trigPin` to initiate the sound burst.
    
    ```cpp
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);  // precisely 10 µs pulse
    digitalWrite(trigPin, LOW);
    ```
    
- If you used `delay(1);` instead, it would send a **1000-microsecond pulse**, which is **too long** and may cause:
    
    - Incorrect distance readings.
        
    - Misfires or multiple echo pulses.
        
    - Sensor not triggering properly.
        

---

### 📏 Timing Is Critical

Ultrasonic sensors measure time-of-flight in **microseconds** — even a small error can lead to **centimeter-level inaccuracies** in distance.

For example:

- Sound travels ~**0.034 cm per µs**.
    
- A 100 µs error = **3.4 cm** mistake.
    

---

### ✅ Summary

We use `delayMicroseconds(10)` because:

- The sensor **requires a short, precise pulse** to work properly.
    
- `delay()` is **too coarse** (minimum ~1 ms = 1000 µs).
    
- Accurate microsecond-level timing ensures **reliable distance measurements**.

---





# 11.7  map function

# Circuit link

https://www.tinkercad.com/things/i1K93DNUONZ-117

# Code

# Notes

the `map()` function in Arduino takes an **input value from one range** and produces an **output value scaled to a new range**, based on the relative position of the input
.
In Arduino, the `map()` function is used to **remap a number from one range to another**, which is especially useful when working with sensors or input values that need to be translated to a different scale (e.g., sensor input to PWM output).

### **Syntax**

```arduino
map(value, fromLow, fromHigh, toLow, toHigh)
```

### **Parameters**

- **value**: The number you want to map.
    
- **fromLow**: The lower bound of the value’s current range.
    
- **fromHigh**: The upper bound of the value’s current range.
    
- **toLow**: The lower bound of the value’s target range.
    
- **toHigh**: The upper bound of the value’s target range.
    

### **Returns**

- A new value mapped proportionally from the original range (`fromLow`–`fromHigh`) to the target range (`toLow`–`toHigh`).
    

---

### **How It Works**

The `map()` function uses **linear interpolation** to calculate the new value. It preserves the ratio between the input and output ranges.

The formula it uses internally is:

```arduino
mappedValue = (value - fromLow) * (toHigh - toLow) / (fromHigh - fromLow) + toLow;
```

---

### **Example**

Suppose you're reading analog input from a potentiometer and want to map it to an LED brightness level:

```arduino
int sensorValue = analogRead(A0); // returns a value from 0 to 1023
int brightness = map(sensorValue, 0, 1023, 0, 255); // maps it to 0–255 for PWM
analogWrite(9, brightness); // sets PWM output on pin 9
```

Here, `map()` converts the sensor's 0–1023 range to the LED’s 0–255 brightness range.

---

### **Important Notes**

- `map()` returns a **long integer**, not a float—so it doesn't work well for decimal precision.
    
- It does **not** constrain the output. If the input is outside `fromLow` to `fromHigh`, the output might also be outside `toLow` to `toHigh`. To keep it within bounds, use `constrain()`.

======================================================
# Potentiometer

=====================================================

# 11.8 potentiometer in percentage

# Circuit link

# Code

# Notes


---



# 11.9 angle cos light intensity

# Circuit link

# Code

# Notes





---

# 11.10 phase difference between LEDs.

# Circuit link

# Code

# Notes


---



# 11.11 multiple LEDs

# Circuit link

# Code

# Notes


---


# 11.12 All LEDs out of phase

# Circuit link

# Code

# Notes


---