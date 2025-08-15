
### **1. Progress Made So Far**  
**a. Research & Planning**  
- I completed an in-depth review of **sensor-based robotic arm systems**, focusing on non-ML approaches.  

- I then Identified and finalized the core components which are the 

  - **Arduino Nano** as the microcontroller (cost-effective and versatile).  This would be used as the main controller for glove that will send signal's to the arm 

  - The **MG996R servo motors** for joint movement (high torque and reliability). 
  
  - **HC-05 Bluetooth module** for wireless control (tested range: up to 10 meters).  

**b. Simulation & Virtual Prototyping**  
- In my simulation I broken down the robotic arm into several modules which include  
  - **Servo motor control** (simulated grip and arm movements).  
  - **Flex sensor emulation** using potentiometers to mimic finger bending.  
  - **Bluetooth command parsing** via Tinkercad’s Serial Monitor.  
- I Resolved initial issues like **servo jitter** by adjusting signal delays and **Bluetooth lag** by optimizing data transmission.  

---

### **2. Current Project Status**  
- **Finalizing the virtual design**:  
  - Refining the arm’s range of motion based on Tinkercad tests.  
  - Validating control logic for smooth, real-time gesture tracking.  
- **Preparing for hardware assembly 

---

### **3. Challenges Encountered**  
**a. Simulation Limitations**  
- Tinkercad lacks an **IMU sensor component**, so I used an accelerometer as a placeholder to test tilt-based controls.  
- **Bluetooth latency** in simulations required reducing data payloads to ensure responsive movement.  

**b. Power Management**  
- Discovered that **multiple servos** demand a dedicated 6V power supply to avoid Arduino overload.  
- Addressed this in simulations by adding virtual voltage regulators.  

---

### **4. Next Steps**  
**a. Immediate Actions (Next 2 Weeks)**  
1. **Procure hardware**: Prioritize servos and Bluetooth modules from local suppliers.  
2. **Assemble the physical prototype**: Start with the base and shoulder joints.  
3. **Test real-world performance**: Validate servo responsiveness and Bluetooth range.  

**b. Long-Term Goals**  
- Integrate **flex sensors** into the glove for precise grip control.  
- Explore **kinematic modeling** to enhance arm movement accuracy.  

---

### **Closing Remarks**  
"I’m excited to transition from simulations to physical testing. If anyone has experience with **affordable servo suppliers** or **3D printing services**, I’d love your advice!"  

---

### **Key Strengths to Highlight**  
- **Problem-solving**: Emphasize how you debugged simulation issues (e.g., Bluetooth lag).  
- **Planning**: Showcase your structured approach (research → simulation → hardware).  
- **Engagement**: End with a specific ask to encourage peer input.  

Tl
