

 
# 12.1 Determine how difference light result in difference in voltage and when you change the light intensity of Photodiode and Photoresistor 

- You have to have a voltage indication on the multi-meter that indicates the brightness of the light  
	falling on it. The voltage should also very from less than 1V to more than 4 volt with the 5 volts used  
	from the Arduino. For this you will need to connect other components to the light sensing devices.  
	Also, consider that the control of current in a BJT transistor happens where the transistor is reversed  
	biased.

# Circuit link

# Code

```
int Ldr,in_photo;
void setup(){
 Serial.begin(9600);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
}

void loop(){
  Ldr = analogRead(A3);
in_photo = analogRead(A2);
  
  Serial.print("LDR = ");
  Ldr = map(Ldr, 969, 49, 0, 100);
  Serial.print(Ldr);
  
  
  Serial.print("% Photo Diode = ");
  in_photo = map(in_photo, 46, 964, 0, 100);
  Serial.print(in_photo);
  Serial.println("%");

}
```

# Notes

- Using a photo diode
- It like a little solar polar
- Photo resistor has no + or - pin
- The bigger the resistanc the bigger voltgae
# Photo resistor
- Pip analogy
	- Thick pip goes into a narrow pipe
		- If you have a thick conductor and you make it thin it will have a higher resistance
	- Therefore you will have more resistance 
	- The thiner the pip is the more the pressure must be to have the same amount of water coming threw
	- Flow of water is current
	- Pressure is the volatage
	- So the thinner it is the more volatage needed
	- So bigger resistance more voltage
	- So we make the second resistor have more resistance because the photo resistor is a variable resistor
	- We will the other resisor be 10k
## Photo diode
- We want volatge reading to be in the range of less than 1 volt and bigger than 4v so we can use it in the arduino
- If its forward biased the voltage is small across the Photo diode when reverse biased it is high volatge (even though it a negative)
- It changes the current
- If we have a bigger resitor a small change in current will reflect as  big change in voltage because we have a bigger resistor so we will use 47k
### **Photodiode vs. Photoresistor (LDR) in Arduino**  
Both components detect light but work differently. Here’s how they function and how to use them with Arduino:

---

## **1. Photoresistor (LDR)**  
#### **How It Works**  
- A **Light-Dependent Resistor (LDR)** changes its resistance based on light intensity:  
  - **Bright light** → **Low resistance** (~1kΩ).  
  - **Darkness** → **High resistance** (~1MΩ).  

#### **Arduino Circuit & Code**  
**Wiring:**  
- Connect one LDR leg to **5V**, the other to an **analog pin (e.g., A0)**.  
- Add a **10kΩ pull-down resistor** to **GND** (creates a voltage divider).  

**Code Example:**  
```cpp
int ldrPin = A0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int ldrValue = analogRead(ldrPin);  // Read light level (0–1023)
  Serial.print("LDR Value: ");
  Serial.println(ldrValue);
  delay(200);
}
```
**Behavior:**  
- Higher values = **darker** (more resistance).  
- Lower values = **brighter** (less resistance).  

---

## **2. Photodiode**  
#### **How It Works**  
- A **photodiode** converts light into **current** (not resistance).  
- Operates in **two modes**:  
  1. **Photovoltaic Mode** (0V bias, generates voltage).  
  2. **Photoconductive Mode** (reverse bias, faster response).  



### Optimized Light Sensor Circuits for Arduino

1. **Photoresistor (LDR) Circuit**
- *Operation Principle*:
  - Resistance varies inversely with light intensity (≈1kΩ in bright light to ≈1MΩ in darkness)
  - Non-polarized component (no +/- terminals)

- *Voltage Divider Design*:
  - LDR connected between 5V and analog pin (A0)
  - 10kΩ fixed resistor between A0 and GND
  - Produces voltage range: 0.05V (dark) to 4.5V (bright)

- *Water Pipe Analogy*:
  - LDR acts like a variable valve:
    - Bright light = Wide open valve (low resistance, high current)
    - Darkness = Nearly closed valve (high resistance, low current)
  - Fixed resistor maintains minimum flow (current) restriction

2. **Photodiode Circuit**
- *Operation Principle*:
  - Reverse-biased configuration (cathode to 5V, anode to resistor)
  - Generates current proportional to light intensity
  - Much faster response than LDR (microsecond vs millisecond)

- *Signal Conditioning*:
  - 47kΩ resistor converts current to measurable voltage
  - Dark condition: ≈0V (nanoampere leakage current)
  - Bright light: ≈4.7V (with 100μA photocurrent)

- *Key Advantage*:
  - High-value resistor (47kΩ) amplifies small current changes into measurable voltage swings


4. **Design Verification**
- *Photoresistor Calculation*:
  Dark: 5V × (10kΩ/(10kΩ+1MΩ)) ≈ 0.05V
  Bright: 5V × (10kΩ/(10kΩ+1kΩ)) ≈ 4.5V

- *Photodiode Calculation*:
  V = I × R = 100μA × 47kΩ = 4.7V

5. **Component Selection Guide**

| Parameter       | Photoresistor | Photodiode |
|-----------------|---------------|------------|
| Response Time   | 10-100ms      | <1μs       |
| Best For        | Ambient light | Precision  |
| Resistor Value  | 10kΩ          | 47kΩ       |
| Voltage Range   | 0.05-4.5V     | 0-4.7V     |

# Display as percenatge use the map()





---
# Liquid crystal display
# 12.2 Using the display

# Circuit link

# Code

```C++
#include <LiquidCrystal_I2C.h>
#include <Wire.h>

LiquidCrystal_I2C serial_LDR(0x27, 16, 2);
int Ldr,in_photo;



void setup(){
 Serial.begin(9600);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  
  serial_LDR.init();
  serial_LDR.backlight();
  serial_LDR.setCursor(0,0);// this is where to set the cursors
  serial_LDR.print("Your name");
  
}

void loop(){
  

}
```

# Notes

# Liquid Crystal Display (LCD) with Arduino: Complete Guide

## How LCDs Work with Arduino

Liquid Crystal Displays (LCDs) work by controlling the alignment of liquid crystal molecules between two polarized panels. When voltage is applied, the crystals twist to either block or allow light to pass through, creating visible characters. The I2C interface simplifies wiring by reducing the required connections from 16 to just 4.

## LCD Pin Purposes (I2C Version)

The I2C module attached to your LCD has these key pins:

1. **GND** - Ground connection
2. **VCC** - Power supply (5V)
3. **SDA** - I2C data line (serial data)
4. **SCL** - I2C clock line (serial clock)

The I2C interface handles all the complex communication with the actual LCD, which normally requires:
- 8 data pins (D0-D7)
- RS (Register Select)
- RW (Read/Write)
- EN (Enable)
- Backlight control
- Contrast adjustment



```cpp
LiquidCrystal_I2C serial_LDR(0x27, 16, 2);
```
- Creates an LCD object named `serial_LDR`
- `0x27` is the I2C address (may need adjustment)
- `16` is the number of columns
- `2` is the number of rows

### Setup Function
```cpp
void setup(){
  Serial.begin(9600);
  pinMode(A2, INPUT);  // Configure A2 as input
  pinMode(A3, INPUT);  // Configure A3 as input
  
  serial_LDR.init();   // Initialize the LCD
  serial_LDR.backlight();  // Turn on backlight
  serial_LDR.setCursor(0,0);  // Position cursor at column 0, row 0
  //serial_LDR.print("Your name")  // Example text display (commented out)
}
```

## Key LCD Functions

1. **init()** - Initializes the display
2. **backlight()** - Turns on the backlight
3. **noBacklight()** - Turns off the backlight
4. **setCursor(col, row)** - Positions the text cursor
   - Columns are numbered 0-15 (for 16x2 display)
   - Rows are numbered 0-1 (for 16x2 display)
5. **print("text")** - Displays text at current cursor position
6. **clear()** - Clears the entire display
7. **home()** - Returns cursor to (0,0) position
8. **createChar(num, data)** - Creates custom characters


---

### **Why SDA/SCL Must Connect to Analog Pins (A4/A5 on Uno)**
1. **Hardware Design Constraint**:  
   - On Arduino Uno/Nano, the **I2C interface is hardwired** to:  
     - **SDA → A4**  
     - **SCL → A5**  
   - These pins double as:  
     - **Analog inputs** (when used with `analogRead()`)  
     - **I2C communication pins** (when using the Wire library)  

2. **Technical Reason**:  
   - The ATmega328P microcontroller has **dedicated hardware I2C circuitry** that's only accessible through these specific pins.  
   - You *cannot* remap I2C to other pins on these boards without software emulation (which is inefficient).  

3. **Exception for Other Boards**:  
   - Some Arduino models (like Leonardo, Mega) have SDA/SCL on different pins.  
   - Always check your board's pinout diagram.  

---

### **What Happens If You Use Wrong Pins?**
- The I2C communication **will fail** because:  
  - The hardware I2C controller won't receive/send signals.  
  - The LCD or other I2C devices won't respond.  

---

### **Why Are They Labeled as Analog Pins?**  
- These pins are **multipurpose**:  
  - They can function as:  
    1. **Analog inputs** (for sensors like LDRs).  
    2. **Digital I/O** (for general use).  
    3. **I2C pins** (for communication with LCDs, RTCs, etc.).  
- The label "A4/A5" emphasizes their analog capability, but their I2C role is primary for communication.  

---

### **Key Points to Remember**  
1. **For I2C Devices (LCD, Sensors, etc.)**:  
   - Always use **A4 (SDA) and A5 (SCL)** on Uno/Nano.  
   - No exceptions unless you're using a board with different I2C pins.  

2. **For Analog Sensors**:  
   - If you need to use A4/A5 for analog sensors, you must:  
     - Disconnect I2C devices temporarily.  
     - Or use different analog pins (A0-A3).  

3. **Wiring Example**:  
   ```plaintext
   Arduino Uno       I2C LCD
   --------------------------
   A4 (SDA)  →  SDA
   A5 (SCL)  →  SCL
   5V        →  VCC
   GND       →  GND
   ```

---

### **Troubleshooting Tip**  
If your I2C LCD isn't working:  
1. Verify connections to **A4/A5**.  
2. Check the I2C address with a scanner sketch.  
3. Ensure no other devices are conflicting on the I2C bus.  

This hardware design ensures efficient communication while maintaining pin flexibility for other functions when I2C isn't in use.



---

# 12.3 Display the Photo resistor and photo diode percentages 

# Circuit link

# Code

# Notes

---

# 12.4

# Circuit link

# Code

# Notes

---

# 12.5

# Circuit link

# Code

# Notes

---
https://www.tinkercad.com/things/14jFlP66t9B-design-125

# 12.6 
https://www.tinkercad.com/things/ePyEOprHXe1-design-126

```

```
## LCD

- The 16 is for the 16 columns 
- The 2 is for the two rows 