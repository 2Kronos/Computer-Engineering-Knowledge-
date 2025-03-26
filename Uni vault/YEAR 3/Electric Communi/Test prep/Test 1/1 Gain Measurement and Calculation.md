
<u> What is gain </u>
In electronic communications, **gain** refers to the **amplification** of a signal's power, voltage, or current. It represents how much a circuit (such as an amplifier) increases the strength of an input signal.

 <u> Importance of gain </u>
- Amplifies weak signals in communication systems.
- Improves signal transmission over long distances.
- Helps in filtering and processing signals in radios, TVs, and mobile networks.

#### **1.1. Understanding how to measure gain in a broadcast system** 
- Gain is measured in **decibels (dB)** using the formula: 
  $$A_{db}=10\log_{10}(\frac{P_{OUT}}{P_{IN}})$$
	
  
  or, for voltage gain: 
  
  $$A_{db}=10\log_{10}(\frac{V_{OUT}}{V_{IN}})^2$$
 or for current gain 
 
     
- Measured using instruments like `spectrum analyzers, power meters, or oscilloscopes`.

#### **1.1.1 Why is it Important to Measure Gain?**

- Ensures **signal strength** is sufficient for clear transmission.
- Prevents **signal distortion** from excessive gain.
- Helps **optimize efficiency** in power usage.
- Ensures compliance with **broadcasting regulations**.
  
#### 1.1.2 **When Should You Determine Gain?**
    
- **Before transmission** to optimize power levels.
- **During system maintenance** to check for performance issues.
- **When troubleshooting** signal degradation or interference.

### **1.2 When to use instruments (Ammeter, Voltmeter, Multimeter, Wattmeter).**

- **Voltmeter**: Measures input and output voltage to determine **voltage gain**.
- **Ammeter**: Measures input and output current for **current gain**.
- **Multimeter**: Versatile tool to measure **both voltage and current**.
- **Wattmeter**: Measures input and output power to determine **power gain**, crucial for broadcast transmitters.

### **1.3 Under What Conditions Do We Use Multiple Measuring Instruments?**

Using multiple instruments is necessary when measuring **different electrical parameters** simultaneously, such as voltage, current, and power, especially in a **broadcast system** or amplifier setup.

#### **Conditions for Using Multiple Instruments:**

1. **Measuring Different Types of Gain:**
    
    - Voltage Gain → Requires **2 Voltmeters** (Input & Output).
    - Current Gain → Requires **2 Ammeters** (Input & Output).
    - Power Gain → Requires **2 Wattmeters** (Input & Output).
      
2. **High-Precision Measurements:**
    
    - Different instruments specialize in measuring specific parameters accurately.
    - Example: **Wattmeter for power, Voltmeter for voltage, Ammeter for current**.
      
3. **Monitoring a Live System:**
    
    - In a broadcast system, multiple instruments allow **real-time monitoring** of performance.
    - Helps detect **signal loss or distortion** at different points.
4. **Cross-Verification of Readings:**
    
    - Using multiple instruments minimizes errors by **cross-checking values**.
    - Example: **Multimeter vs. Voltmeter readings** can confirm accuracy.

### **1.3.1 Benefits of Using Multiple Instruments**

✅ **Higher Accuracy:** Dedicated instruments provide **precise readings** for each parameter.  
✅ **Real-Time Monitoring:** Helps detect **signal variations** in broadcasting.  
✅ **Cross-Verification:** Ensures **correct measurements** by comparing different instruments.  
✅ **Simultaneous Measurements:** Can measure voltage, current, and power **at the same time**.  
✅ **Safety & Redundancy:** If one instrument fails, another can still provide readings.

### **1.3.2 Benefits of Using a Single Instrument (e.g., Multimeter)**

✅ **Cost-Effective:** Reduces the need for multiple devices.  
✅ **Compact & Portable:** Easier to carry and use in the field.  
✅ **Quick Measurements:** Multimeter can switch between voltage, current, and resistance.  
✅ **Less Setup Time:** Eliminates the need for connecting multiple devices.

**However, a single instrument may lack precision for power gain measurements (e.g., wattmeters are more accurate for power readings in RF systems).**


### **1.4 Calculate gain using dBm, dBW, and dB values.**

![[Pasted image 20250326075451.png]]
- Always use the given   absolute reference as your final answer

- [ ] 1.5 Derive gain while considering resistance for output and input power.


$$P\ = \frac{V^2}{R}$$

$$dB = 10\ log\ \frac{P_2}{P_1}$$
$$P_2 \ = \frac{V_2^2}{R_2}$$
$$P_1 \ = \frac{V_1^2}{R_1}$$
$$dB = 10\ log\ \frac{(\frac{V_2^2}{R_2})}{\frac{V_1^2}{R_1}}$$
$$db\ = \ 10\log\ \frac{V_2^2}{R_2}\ \times \frac{R_1}{V_1^2}$$
$$dB\ = \ 10\ log\ \frac{V_2^2\ R_1}{V_1^2\ R_2}$$
$$dB\ = \ 10\ log\ (\frac{V_2^2}{V_1^2})\ \frac{R_1}{R_2}$$
$$dB =\ 10\log\ (\frac{V_2}{V_1})^2\ +\ 10 \log\ (\frac{R_1}{R_2})$$
$$dB =\ 2\times 10\log\ (\frac{V_2}{V_1})\ +\ 10 \log\ (\frac{R_1}{R_2})$$
$$dB =\ 20\log\ (\frac{V_2}{V_1})\ +\ 10 \log\ (\frac{R_1}{R_2})$$


$$ \text{Since} $$

$$ a\ logb\ =\ logb^a $$
$$10\ log\ \frac{R_1}{R_2}\ =\ 20\ log\ (\frac{R_1}{R_2})^{\frac{1}{2}}$$
$$dB =\ 20\log\ (\frac{V_2}{V_1})\ +\ 20\log\ (\frac{R_1}{R_2})^{\frac{1}{2}}$$
$$dB =\ 20\log\ (\frac{V_2}{V_1})\ +\ 20\log\ (\frac{\sqrt R_1}{\sqrt R_2})$$
$$dB\ = \ 20\ log\ \frac{V_2^2\ \sqrt R_1}{V_1^2\ \sqrt R_2}$$


# 1.6 Explain how resistance affects gain calculations.

- **Gain decrease causes in electronic systems:**  
  - Resistance changes from temperature fluctuations  
  - Aging components  
  - Power instability  

- **Stable temperature benefits:**  
  - Reduces thermal noise  
  - Prevents component degradation  
  - Ensures consistent performance and reliable gain