# Approach 
<u>1. The system should vary the motor speed according to a sine wave pattern, creating a smooth oscillating motion.</u>

- We have created cos wave oscillations  in design 11.6
```C++
  potIn = analogRead(A5);
  angle = map(potIn, 4, 1023, 0, 360);
  angle_R = angle * PI / 180.0; // Convert degrees to radians
  intensity = 1000 * cos(angle_R); // Calculate cosine-based intensity (-1000 to 1000)
  inten_LED_1 = map(intensity, -1000, 1000, 0, 255); // Map to PWM range (0-255)
  Serial.println(inten_LED_1); // Debug output
  analogWrite(3, inten_LED_1); // Control LED/motor on Pin 3
```
- As you can see in the above code 
	- We mapped the pot input to degrees (0-360)
	- We converted that angle into radians 
	- We use the cos function and remember that the cosine function will give us values between -1 and 1 and then we scale that to a 1000 because we do not want to work with decimals using the map function
		- Then convert those values into  the analog range 0-255

<u>2. The direction of the motor should change when the sine wave crosses zero</u>

- This can be done using design 11.6 again
  
  #### **Step 4: Calculate Cosine Intensity**
```cpp
intensity = 1000 * cos(angle_R);
```
- Computes the cosine of the angle (range: `-1` to `1`), then scales it to `-1000` to `1000`.  
  - **Cosine Values**:  
    - `0°` → `cos(0) = 1` → `intensity = 1000`  
    - `180°` → `cos(π) = -1` → `intensity = -1000`  
    - `90°`/`270°` → `cos(π/2) = 0` → `intensity = 0`

- Keep in mind that we use two pins for direction control and 1 pin for speed control
- This can be seen in design 13.1

## **🔄 Motor Control Pins (H-Bridge Logic)**  

### **Motor A (Pins 2,3,6,7)**
| **Pin** | **Name** | **Purpose**                           | **Truth Table**               |
| ------- | -------- | ------------------------------------- | ----------------------------- |
| **2**   | Input 1  | Controls Motor A direction (HIGH/LOW) | `IN1=HIGH, IN2=LOW` → Foward  |
| **7**   | Input 2  | Controls Motor A direction (HIGH/LOW) | `IN1=LOW, IN2=HIGH` → reverse |
| **3**   | Output 1 | Connects to Motor A’s **+ terminal**  | Motor A Wire (+)              |
| **6**   | Output 2 | Connects to Motor A’s **- terminal**  | Motor A Wire (-)              |

### **Motor B (Pins 10,11,14,15)**
| **Pin** | **Name** | **Purpose**                           | **Truth Table**               |
| ------- | -------- | ------------------------------------- | ----------------------------- |
| **10**  | Input 3  | Controls Motor B direction (HIGH/LOW) | `IN3=HIGH, IN4=LOW` → Forward |
| **15**  | Input 4  | Controls Motor B direction (HIGH/LOW) | `IN3=LOW, IN4=HIGH` → Reverse |
| **11**  | Output 3 | Connects to Motor B’s **+ terminal**  | Motor B Wire (+)              |
| **14**  | Output 4 | Connects to Motor B’s **- terminal**  | Motor B Wire (-)              |

🔹 **How Direction Control Works (H-Bridge Logic)**  
- **Forward**: `IN1=HIGH, IN2=LOW` → Current flows **Output 1 → Output 2**  
- **Reverse**: `IN1=LOW, IN2=HIGH` → Current flows **Output 2 → Output 1**  
- **Brake**: `IN1=IN2=HIGH` (or `LOW`) → Motor stops  

<u>3. The system should allow for user adjustment of both the maximum speed (via potentiometer) and

oscillation frequency (via serial commands).</u>

- Since in number 1 we are already doing this because we are using the pot

- To change the oscillation frequency  we can experiment the behaviour of the sine wave in design 11.2 
- To change the frequency we need to divide the angle `sin(angle)` by how many oscillation the user wants
- We need to convert the user input into a string using `toInt()` (from design 9.4 )

![[Pasted image 20250522205417.png]]
- `0°` → `cos(0) = 0`
- `90°` → `cos(π/2) = 1` (Change direction)
- `180°  ` →cos(π) = 0` 
- `270°` → `cos(3π/2) = -1`  (Change direction)
- `360°` → `cos(π) = 0` 

# Attempt 1 

- Use the arduino 5v for pot
- When you convert into radians make sure the that variable assigned must be in radians
- Keep in mind that this is a sine wave 

