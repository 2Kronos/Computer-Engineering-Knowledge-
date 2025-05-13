# 1. Micromachines 

## Key Focus
- A high-precision robotic arm system for agricultural tasks (e.g., fruit picking) 

- combines a data glove with bending sensors and an OptiTrack motion-capture system. 

# Methodology:

##  **Hardware
    
- Data glove with 10 bending sensors  to measure finger flexing.
        
- OptiTrack cameras track reflective markers on the glove for 3D spatial data.
	
- Raspberry Pi for real-time control.
        
## Software
    
- Convolutional Neural Networks and Bidirectional Long Short-Term Memory model processes sensor data for gesture classification 
        
- Linear regression aligns human and robotic arm trajectories to minimize errors.
        

## **Results**:

- **Gesture Recognition**: 96.43% accuracy 
    
    
- **Latency**: 0.325 s average delay.
    
# What I learned

- **Bluetooth (HC-05) Limitations**:
    
    - Lateny
        
    - It would ne be enough for **real-time responsiveness** for industrial applications.
        

# What I can apply

- Test Bluetooth range/latency early. If delays exceed 0.5s, consider **RF modules** as a backup 
    
- Implement **modular code for  separate gesture detection and motor control to simplify debugging.

# 2. Design and Development of Gesture Controlled Robotic Arm" (2023) – UCAT

# **Key Focus**:  
- This paper presents a wireless, gesture-controlled robotic arm designed for applications in healthcare, defense, and industrial automation. 
- The system uses flex sensors embedded in a glove to capture hand gestures, which are transmitted via Arduino Nano and RF modules to control a 3D-printed robotic arm with servo motors.

# **Methodology**:

- **Hardware**: Flex sensors detect finger movements, while an ESP32 microcontroller processes and wirelessly transmits data to the robotic arm. 
  
- Servo motors replicate gestures in real time.
    
- **Software**: The system maps flex sensor resistance changes to servo motor movements, enabling precise control.
    
# Results

- Achieved 100% accuracy in basic directional movements with a 5-second response delay.
    
- The robotic arm successfully replicated hand signs but showed minor performance variations 
    

# **Limitations**:

- Limited to predefined gestures; struggles with user-specific variations.
	- Meaning it has to know beforehand the gestures that you will do
	- so it only responds to specific gestures
    
- Requires calibration for different hand sizes.

    
        
# What I can do based on this report

- Combine flex sensors (for finger movements) and the MPU6050 (for wrist orientation) to replicate the hybrid approach in Micromachines, but at a lower cost.

# 3. A Study on Hand Motion Controlled Robotic Arm" (2023) – Propulsion Tech Journal

# Key Focus
 The study evaluates hardware design, motion-tracking algorithms, and user interfaces for a robotic arm

# Methodology

- **Sensors**: Combines accelerometers, gyroscopes, and depth cameras for gesture tracking.
    
- **Control System**: Algorithms translate gestures into robotic arm movements with real-time feedback.
      
# Results

- Demonstrated real-time responsiveness and adaptability to diverse gestures.
    
- Highlighted precision in tasks like pick-and-place and assembly.
    

## Challenges:

- Latency and calibration for different hand sizes.
    
- Safety protocols to prevent unintended movements.

# What I learned from them

- **Servo Selection**:
    
    - We both use MG996R servos (high torque, 180°) but Micromachines uses steppers for precision).
        
    - The **NEMA 17 steppers** for smoother axis movement.
        

# What I can do

- Use MG996R for gripper/base rotation (high torque) but reserve budget for **one stepper motor** (NEMA 17) for critical axes if precision falters.

# In Conclusion 

<u>I must consider applying the following </u>

- Test Bluetooth range/latency early
  
- Implement separate code gesture detection and motor control
  
- Combine flex sensors for finger movements and the MPU6050 for wrist orientation

- Use MG996R for gripper/base rotation (high torque)
	
-  **one stepper motor** (NEMA 17) for critical axes if precision falters.