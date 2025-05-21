
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

# **Sensors**

- Below is the documentation of the Ultrasonic sensor.
- Use this as a guide 

[Getting Started with the HC-SR04 Ultrasonic sensor | Arduino Project Hub](https://projecthub.arduino.cc/Isaac100/getting-started-with-the-hc-sr04-ultrasonic-sensor-7cabe1)

# 11.3 Distance sensing

![[Pasted image 20250519163018.png]]

# Circuit link

https://www.tinkercad.com/things/3T6H0s7ZTJF-113
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
# 11.4  map function

# Circuit link

https://www.tinkercad.com/things/i1K93DNUONZ-114

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
  // Speed of sound = 343m/s = 0.0343cm/μs for mm it is 03.3
  // Divide by 2 (round trip)
  float distance = duration * 0.034 / 2;
  
  int brightness = map(distance, 0, 200, 255, 0);
  brightness = constrain(brightness, 0, 255); // keep within bounds
 
  analogWrite(3, brightness);
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");
  Serial.print("Brightness: ");
  Serial.println(brightness);
  
  delay(100);  // Short delay between readings
}
```

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

----
# Potentiometer

![Screenshot 2025-05-21 021619](https://github.com/user-attachments/assets/3b8ba6e7-24b5-4120-9c44-db4a630b7b68)


![Screenshot 2025-05-21 021732](https://github.com/user-attachments/assets/7cd993cd-67b5-42d8-a717-a1d537efa789)


A **potentiometer** (often called a "pot") is a type of **variable resistor** used to control electrical resistance manually. It works by adjusting the voltage division in a circuit, allowing precise control over electrical signals. Here’s how it works:

### **1. Basic Structure**
A potentiometer consists of three terminals:
- **Terminal 1 (Input/V+)** – Connected to the voltage source.
- **Terminal 2 (Wiper/Variable Output)** – Moves along the resistive track to vary output.
- **Terminal 3 (Ground/GND)** – Connected to the circuit's ground or reference.

Inside, it has:
- A **resistive track** (usually made of carbon, cermet, or conductive plastic).
- A **sliding contact (wiper)** that moves along the track when the knob is turned.

### **2. How It Works**
- When voltage is applied between **Terminal 1 (V+)** and **Terminal 3 (GND)**, current flows through the resistive track.
- The **wiper (Terminal 2)** taps into a specific point on the resistive track, dividing the voltage.
- By moving the wiper, you change the resistance between **Terminal 1 & 2** and **Terminal 2 & 3**, altering the output voltage.

### **3. Operating Modes**
Potentiometers can function in two main ways:
1. **As a Variable Resistor (Rheostat Mode)**  
   - Only **two terminals** are used (wiper + one end).  
   - Adjusts resistance in a circuit (e.g., dimming lights, motor speed control).

2. **As a Voltage Divider**  
   - All **three terminals** are used.  
   - Provides an adjustable voltage output (e.g., volume control in audio devices).

### **4. Types of Potentiometers**
- **Rotary Potentiometer** – Adjusted by turning a knob (common in volume controls).  
- **Linear/Slider Potentiometer** – Adjusted by sliding a control (used in audio mixers).  
- **Digital Potentiometer** – Electronically controlled (used in microcontrollers).  
- **Trimpot (Trim Potentiometer)** – Small, screw-adjusted for fine-tuning circuits.

### **5. Applications**
- **Volume & tone controls** in audio devices.  
- **Brightness/dimming controls** in lighting.  
- **Position/speed sensors** in robotics.  
- **Calibration & tuning** in electronic circuits.  

### **Key Formula**
The output voltage (**Vout**) in voltage divider mode is:  
$V_{out} = V_{in} \times \frac{R_{2}}{R_{1} + R_{2}}$
Where:
- \(R_1\) = Resistance between **Terminal 1 & Wiper**  
- \(R_2\) = Resistance between **Wiper & Terminal 3**  

### **Summary**
A potentiometer works by varying resistance through a movable wiper, allowing precise control over voltage or current in a circuit. Its simplicity and versatility make it essential in electronics.

# 11.5 Make the reading of the potentiometer in %

# Circuit link

https://www.tinkercad.com/things/42vTppMm0aw-115

# Code

```C++
int potIn;

void setup() {
    Serial.begin(9600);
    pinMode(3, OUTPUT);
    pinMode(A5, INPUT);
}

void loop() {
    potIn = analogRead(A5);
    potIn = map(potIn, 4, 1023, 0, 100);
    Serial.println(potIn);
}
```

# Notes

- We will use the `map` function to do this 
-  **Total resistance** (Terminal 1 to 3) **never changes**—only the split between R₁ and R₂ does.
- **If using 2 terminals**, resistance can decrease/increase based on the wiper’s direction.


---



# 11.6 angle cos light intensity

# Circuit link

https://www.tinkercad.com/things/g2OiEZGkWNB-116

# Code

```C++
int potIn;
int angle, intensity, inten_LED_1;
double angle_R;

void setup() {
  Serial.begin(9600);
  pinMode(3, OUTPUT);
  pinMode(A5, INPUT);
}

void loop() {
  potIn = analogRead(A5);
  angle = map(potIn, 4, 1023, 0, 360);
  angle_R = angle * PI / 180.0; // Convert degrees to radians
  intensity = 1000 * cos(angle_R); // Calculate cosine-based intensity (-1000 to 1000)
  inten_LED_1 = map(intensity, -1000, 1000, 0, 255); // Map to PWM range (0-255)
  Serial.println(inten_LED_1); // Debug output
  analogWrite(3, inten_LED_1); // Control LED/motor on Pin 3
}
```

# Notes

- Map the values of the potentiometer to degrees 0-360
- `cos(angle) ` this will give you a value between -1 and 1 it they give us decimal values we need whole numbers for the intensity 
- Keep in mind that  `cos(angle)` gives a number from -1 and 1 so what ever value we put into `cos` will have a positive and negative counter part
- We can use multiply by a 1000 to get hole values and not decimal values
- The `angle` should be radians so we will need to use $\frac{\pi}{180}$
- Keep in mind LED work with values from 0 -255 so we will use the map function to map the -1000 to 1000 values to 0 -255 values used by an LED



###  `loop()` Function Workflow**
#### **Step 1: Read Potentiometer Value**
```cpp
potIn = analogRead(A5);   // Read raw value (0–1023) from potentiometer
```
- The potentiometer voltage is read as a **10-bit ADC value** (0–1023).

#### **Step 2: Map to Angle (0°–360°)**
```cpp
angle = map(potIn, 4, 1023, 0, 360);
```
- Maps the raw value (`4–1023`) to degrees (`0–360`).  
- The minimum (`4`) ignores near-zero noise.

#### **Step 3: Convert Angle to Radians**
```cpp
angle_R = angle * PI / 180.0;
```
- Converts degrees to radians (required for `cos()` in C++).

#### **Step 4: Calculate Cosine Intensity**
```cpp
intensity = 1000 * cos(angle_R);
```
- Computes the cosine of the angle (range: `-1` to `1`), then scales it to `-1000` to `1000`.  
  - **Cosine Values**:  
    - `0°` → `cos(0) = 1` → `intensity = 1000`  
    - `180°` → `cos(π) = -1` → `intensity = -1000`  
    - `90°`/`270°` → `cos(π/2) = 0` → `intensity = 0`  

#### **Step 5: Map to PWM Range (0–255)**
```cpp
inten_LED_1 = map(intensity, -1000, 1000, 0, 255);
```
- Rescales `-1000` to `1000` to the PWM range (`0–255`).  
  - **Result**:  
    - `1000` → `255` (max brightness)  
    - `-1000` → `0` (LED off)  
    - `0` → `127` (half brightness)  

#### **Step 6: Output PWM Signal**
```cpp
analogWrite(3, inten_LED_1);  // Send PWM signal to Pin 3 (LED/motor)
```
- Controls brightness/speed based on the cosine wave.

#### **Step 7: Serial Debugging**
```cpp
Serial.println(inten_LED_1);   // Print PWM value to Serial Monitor
```
- Helps monitor values in real-time (e.g., `0`, `127`, `255`).




---


# 11.7 Lighting up 2 LEDs and then create a 60 degrees phase shift  between the 2

# Circuit link

https://www.tinkercad.com/things/hWENEqbM2b5-117

# Code

```C++
int potIn;
int angle, intensity, inten_LED_1;
double angle_R;

void setup() {
  Serial.begin(9600);
  pinMode(3, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(A5, INPUT);
}

void loop() {
  potIn = analogRead(A5);
  angle = map(potIn, 4, 1023, 0, 360);
  angle_R = angle * PI / 180.0; // Convert degrees to radians
  intensity = 1000 * cos(angle_R); // Calculate cosine-based intensity (-1000 to 1000)
  inten_LED_1 = map(intensity, -1000, 1000, 0, 255); // Map to PWM range (0-255)

  analogWrite(3, inten_LED_1); // Control LED/motor on Pin 3
  
   angle = map(potIn, 4, 1023, -60, 300);
  angle_R = angle * PI / 180.0; // Convert degrees to radians
  intensity = 1000 * cos(angle_R); // Calculate cosine-based intensity (-1000 to 1000)
  inten_LED_1 = map(intensity, -1000, 1000, 0, 255); // Map to PWM range (0-255)

  analogWrite(5, inten_LED_1); // Control LED/motor on Pin 3
}
```

# Notes

- Minus 60 from from both the minimum range and the maximum range we are trying to map the the second led  numbers(0-1023) to

### **Key Changes for Phase Shift**
1. **Original LED (Pin 3)**:
   - Angle range: `0° to 360°` (full rotation).
   - Follows `cos(θ)` directly.

2. **Phase-Shifted LED (Pin 5)**:
   - Angle range: **`-60° to 300°`** (shifted backward by 60°).
   - Follows `cos(θ - 60°)`, creating a **60° lag** compared to the first LED.

---

### **How the 60° Phase Shift Works**
#### **1. Angle Remapping**
```cpp
angle = map(potIn, 4, 1023, -60, 300);  // Shift range to -60° to 300°
```
- **Why `-60° to 300°`?**  
  - A 60° shift is equivalent to starting the second LED’s cycle **60° earlier** (or the first LED’s cycle 60° later).  
  - The total span remains 360° (`300 - (-60) = 360`), ensuring seamless transitions.

#### **2. Cosine Calculation**
- The second LED uses:
  ```cpp
  cos(angle_R)  // Where angle_R = (θ - 60°) in radians
  ```
  - This means the second LED’s brightness pattern is **identical** to the first LED’s, but **delayed by 60°**.

---

### **Behavior Visualization**
| Pot Position (θ) | LED 1 (Pin 3) | LED 2 (Pin 5) | Phase Difference |
|------------------|---------------|---------------|------------------|
| 0°               | `cos(0°)` = 1  | `cos(-60°)` ≈ 0.5 | LED 2 **lags** by 60° |
| 60°              | `cos(60°)` ≈ 0.5 | `cos(0°)` = 1  | LED 2 "catches up" |
| 180°             | `cos(180°)` = -1 | `cos(120°)` = -0.5 | LED 2 brighter |
| 360°             | `cos(360°)` = 1 | `cos(300°)` ≈ 0.5 | Cycle repeats |

-----
# 11.8 Use multiple LEDs and make them all out of phase

# Circuit link


https://www.tinkercad.com/things/6uVBjoeWuGc-118
# Code

```C++
int potIn;
int angle_D, intensity, inten_LED_1;
int pinNum[] = {3, 5, 6, 9, 10, 11};
//double angle_R;

void setup() {
  Serial.begin(9600);
  pinMode(3, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(A5, INPUT);
}

void loop() {
  potIn = analogRead(A5);
  
 for (int led_num = 0; led_num < 6; led_num++) {
    int new_angle = led_num * 60;  // Phase shift each LED by 60°
    int angle_D = map(potIn, 4, 1023, 0 + new_angle, 360 + new_angle);
    switchLED(led_num, angle_D);    // Custom function to control LEDs
}

}

void switchLED(int led_num, int angleInDegrees){
  double angle_R;
  int intensity, inten_LED_1;
  
angle_R =angleInDegrees  * PI / 180.0; // Convert degrees to radians
  intensity = 1000 * cos(angle_R); // Calculate cosine-based intensity (-1000 to 1000)
  inten_LED_1 = map(intensity, -1000, 1000, 0, 255); // Map to PWM range (0-255)
  analogWrite(pinNum[led_num], inten_LED_1);
}
```
# Notes


---


[^1]: 
