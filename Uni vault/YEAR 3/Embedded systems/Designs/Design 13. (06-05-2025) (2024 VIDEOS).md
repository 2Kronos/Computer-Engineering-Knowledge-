# Class 06 May 2025
Today's Class will mostly indulge in Motors

## DC Motors, Brushless Motors, and Stepper Motors

A **DC motor** is an electro-mechanical device that converts direct current electrical energy into mechanical energy, allowing it to rotate. This rotation is achieved through the interaction of a current-carrying conductor within a magnetic field. For example, DC motors are commonly used in electric toys where the battery provides the direct current to drive the motor. (If i caught what he said correctly).

**Brushless motors** are a type of DC motor that eliminates the need for physical brushes to deliver current to the rotor. Instead, they use electronic , resulting in improved efficiency and longevity. For instance, brushless motors are often found in computer cooling fans due to their quiet and efficient operation.

**Stepper motors** are another type of DC motor that offers precise positioning control. By energizing electromagnets in a specific sequence, stepper motors rotate in discrete steps, making them ideal for applications requiring accuracy, such as 3D printers.

While brushless motors are generally more efficient due to the absence of brush friction, it's important to note that they typically require more complex control circuitry. However, this does not necessarily imply a greater DC energy supply overall. Stepper motors are a distinct category of DC motors, characterized by their ability to move in discrete steps, rather than being a branch of brushless motors.

## Servo Motors

Servo motors are designed for precise positioning and control. They can rotate to a specific angle and hold that position, making them essential in applications requiring accurate movement. Servo motors often utilize feedback mechanisms, such as encoders, to track their position and ensure they reach the desired angle. For example, servo motors are commonly used in remote control cars for steering control, allowing for precise adjustments in the car's direction. In the context of flight systems, servo motors play a crucial role in controlling various components, such as the ailerons and elevators, enabling accurate adjustments and maintaining stability.

## H - bridge circuitry and functionality
Motors require high amount of current and voltage. As we will see on example 1, where A DC motor will be connected to a power supply; A DC Motor can with stand more than 10V and even withstand hundreds of milli-Amps, In contrary, Arduino's Digital pins can only supply a maximum current of just under 50mA and a maximum Voltage of 5V. Also, these measurements decrease significantly when we have more than 1 motor. One point we can deduce here is that, an arduino board cannot reliably power one motor, so the matter worsens when its more than 1 motor driver. To fix this we use an H-Bridge which takes

1. Extras
- The Variances that he lightly mentioned were, Use a potentiometer to increase the speed of the motor, if possible, have a design where you implement this, this could be extracted and re-implemented from example 3.

# 13.1 

# Circuit link

https://www.tinkercad.com/things/gv6UXk1itLA-131
# Code

# Notes

- The`L293D
### **L293D Motor Driver IC: Complete Pin-by-Pin Explanation**  

The **L293D** is a **dual H-bridge motor driver** that allows an Arduino to control **two DC motors** (or one stepper motor) bidirectionally. Below is a detailed breakdown of **all 16 pins**, their functions, and how to connect them.

---

## **🔌 Power Supply Pins**  

| **Pin** | **Name**  | **Purpose**                                                                 | **Connection**                     |
|---------|-----------|-----------------------------------------------------------------------------|------------------------------------|
| **1**   | Enable 1  | Enables Motor A (HIGH = ON, PWM for speed control)                          | Arduino PWM Pin (e.g., D9)         |
| **8**   | VCC2 (Motor Supply) | Powers the motors (5V–36V, must match motor voltage)       | External Power (e.g., 9V battery)  |
| **16**  | VCC1 (Logic Supply) | Powers the L293D’s internal logic (5V)                     | Arduino 5V Pin                     |
| **4,5,12,13** | GND | Ground for both logic and motor power (must be common with Arduino) | Arduino GND + External GND         |

🔹 **Why Two Power Inputs?**  
- **VCC1 (5V)** powers the chip’s control logic.  
- **VCC2 (5V–36V)** supplies the actual motor current.  

---

## **🔄 Motor Control Pins (H-Bridge Logic)**  

### **Motor A (Pins 2,3,6,7)**
| **Pin** | **Name**  | **Purpose**                                                                 | **Truth Table**                    |
|---------|-----------|-----------------------------------------------------------------------------|------------------------------------|
| **2**   | Input 1   | Controls Motor A direction (HIGH/LOW)                                       | `IN1=HIGH, IN2=LOW` → Forward     |
| **7**   | Input 2   | Controls Motor A direction (HIGH/LOW)                                       | `IN1=LOW, IN2=HIGH` → Reverse     |
| **3**   | Output 1  | Connects to Motor A’s **+ terminal**                                        | Motor A Wire (+)                  |
| **6**   | Output 2  | Connects to Motor A’s **- terminal**                                        | Motor A Wire (-)                  |

### **Motor B (Pins 10,11,14,15)**
| **Pin** | **Name**  | **Purpose**                                                                 | **Truth Table**                    |
|---------|-----------|-----------------------------------------------------------------------------|------------------------------------|
| **10**  | Input 3   | Controls Motor B direction (HIGH/LOW)                                       | `IN3=HIGH, IN4=LOW` → Forward     |
| **15**  | Input 4   | Controls Motor B direction (HIGH/LOW)                                       | `IN3=LOW, IN4=HIGH` → Reverse     |
| **11**  | Output 3  | Connects to Motor B’s **+ terminal**                                        | Motor B Wire (+)                  |
| **14**  | Output 4  | Connects to Motor B’s **- terminal**                                        | Motor B Wire (-)                  |

🔹 **How Direction Control Works (H-Bridge Logic)**  
- **Forward**: `IN1=HIGH, IN2=LOW` → Current flows **Output 1 → Output 2**  
- **Reverse**: `IN1=LOW, IN2=HIGH` → Current flows **Output 2 → Output 1**  
- **Brake**: `IN1=IN2=HIGH` (or `LOW`) → Motor stops  

---

## **⚡ Enable Pins (Speed Control via PWM)**  

| **Pin** | **Name**  | **Purpose**                                                                 | **Connection**                     |
|---------|-----------|-----------------------------------------------------------------------------|------------------------------------|
| **1**   | Enable 1  | Enables Motor A (PWM for speed control)                                     | Arduino PWM Pin (e.g., D9)         |
| **9**   | Enable 2  | Enables Motor B (PWM for speed control)                                     | Arduino PWM Pin (e.g., D10)        |

🔹 **How PWM Speed Control Works**  
- **`analogWrite(enablePin, 0-255)`** adjusts speed:  
  - `255` = Full speed  
  - `127` = Half speed  
  - `0` = Motor OFF  

---

## **🔧 Protection & Extra Features**  

| **Pin**             | **Purpose**                                                              |
| ------------------- | ------------------------------------------------------------------------ |
| **4,5,12,13**       | **Ground Pins** – Must be connected to both Arduino and motor power GND. |
| **Built-in Diodes** | Protects against **back EMF** (voltage spikes when motor stops).         |

---

## **🚨 Common Mistakes to Avoid**  
1. **Not connecting all GND pins** → Causes erratic behavior.  
2. **Using weak power supply for motors** → L293D overheats.  
3. **Forgetting PWM on Enable pins** → Motor runs at full speed only.  



### **💡 Key Takeaways**  
✅ **L293D solves:**  
- **Low current** from Arduino pins.  
- **Bidirectional control** (forward/reverse).  
- **PWM speed control**.  
- **Back EMF protection**.  



### **L293D Enable Pins (EN1 & EN2) - Complete Explanation**  

The L293D motor driver IC has **two enable pins** (`EN1` on Pin 1 and `EN2` on Pin 9). These pins are critical for controlling the **activation and speed** of the connected motors. Here’s how they work:

---

## **1. Purpose of Enable Pins**  
Enable pins serve two key functions:  
1. **Motor Activation** (ON/OFF)  
   - When **HIGH**, the corresponding motor channel is **enabled**.  
   - When **LOW**, the motor is **disabled** (stops, even if input pins are active).  

2. **Speed Control** (via PWM)  
   - By applying a **PWM signal** (from an Arduino PWM pin), you can control motor speed.  
   - PWM duty cycle determines speed:  
     - `255` = Full speed  
     - `127` = Half speed  
     - `0` = Motor OFF  

---

## **2. Pin Details**  
| **Pin** | **Name** | **Controls**      | **Connection**              |
|---------|----------|-------------------|-----------------------------|
| **1**   | EN1      | Motor A (Outputs 1 & 2) | Arduino PWM Pin (e.g., D9)  |
| **9**   | EN2      | Motor B (Outputs 3 & 4) | Arduino PWM Pin (e.g., D10) |

---

## **3. How to Use Enable Pins**  
### **A. Simple ON/OFF Control**  
```cpp
digitalWrite(EN1, HIGH);  // Motor A spins (full speed)
digitalWrite(EN1, LOW);   // Motor A stops
```

---
# 13.2 Speed increase slowly
# Circuit link

https://www.tinkercad.com/things/7px9C8dFxZK-132
# Code

# Notes

---
# 13.3 high speed then low speed

# Circuit link

https://www.tinkercad.com/things/0qir0zW9Wla-133
# Code

# Notes

---


# 13.4 both directions increase and decrease slowly
# Circuit link

https://www.tinkercad.com/things/2xDkZ4ufGtX-134
# Code

# Notes

---


# 13.5 #  both motors increase and decrease simultaneously
# Circuit link
https://www.tinkercad.com/things/9YArOxDP8qf-135
# Code

# Notes

---

## Scope
- He said know everything up to this far.
- The project is un-modulated -- Not yet approved by the project manager, might change.
- The demonstration will be done in 2 days, when ready put up your hand, marked then done. If marked first day, you don't have to come the following day.



## Useful Resources
- [Push-Pull Amplifiers](https://www.watelectronics.com/push-pull-amplifiers-circuit-diagram-working-and-applications/)
- [Using The L293D H-Bridge](https://dumblebots.com/blog/controlling-motors-with-arduino-and-h-bridges)
- [DC Motor Start up Tuts](https://www.tutorialspoint.com/arduino/arduino_dc_motor.htm)





