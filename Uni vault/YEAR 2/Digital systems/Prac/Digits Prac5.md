
# Prac 5 

![[Pasted image 20240923162009.png]]

 <u>A - B</u> 
input LSB-MSB respectively
  
  <u>CTEN</u>
- **Function**: This input enables or disables counting. When CTEN is low, the counter is enabled and will count on each clock pulse. When CTEN is high, the counter is disabled and will not count.
- **Connection**: Connect CTEN to ground (logic low) to enable counting. If you want to control counting with a switch, you can connect CTEN to a switch that toggles between ground and Vcc (logic high).
  
<u>LOAD</U> 
- **Function**: This input is used to load a preset value into the counter. When LOAD is low, the value on the preset inputs (A-D) is loaded into the counter. When LOAD is high, the counter operates normally.
- **Connection**: If you are not using the preset feature, connect LOAD to Vcc (logic high). If you want to use the preset feature, connect LOAD to a switch that toggles between ground (to load the preset value) and Vcc (for normal operation)
  
  <u>U/D</u> 
Up/Down Count Control Input. Determines the count direction; when high, it counts up, and when low, it counts down.
  
  <u>QA-QB </u>
Outputs LSB -MSB respectively 

<u>RCO</u> 
Ripple Carry Output/Terminal Count Output. Goes high on terminal count in the selected direction if CTEN is low.

<u>CLK</u>
Clock Input. Clock pulse input that triggers counting on the rising edge if CTEN is low and LOAD is high.

<u>MAX/MIN</u> 
- **Function**: This output indicates when the counter has reached its maximum or minimum count. It goes high for one clock cycle when the counter overflows (from 9 to 0) or underflows (from 0 to 9).
- **Connection**: This pin can be left unconnected if you do not need to use the overflow/underflow indication. If you are cascading counters, connect the MAX/MIN output of the first counter to the clock input of the next counter to enable high-speed cascading.


# 5.4

Certainly! The **74HC193D** is an integrated circuit (IC) that functions as a **presettable synchronous up/down counter**. Let’s break down its inputs:

1. **A, B, C, D (Data Inputs)**:
    
    - These pins allow you to set the initial value of the counter. You can input a binary value (0 or 1) to represent the desired starting count.
    - Together, these inputs form a 4-bit binary number that presets the counter.
2. **~LOAD (Active LOW Load Input)**:
    
    - The tilde (~) symbol indicates that this input is active LOW. When ~LOAD is LOW (0), the counter loads the preset value from A, B, C, and D.
    - Essentially, it “loads” the initial count into the counter.
3. **CLR (Asynchronous Master Reset Input, Active LOW)**:
    
    - CLR stands for “clear.” When CLR is activated (LOW), it resets the counter to zero.
    - This input allows you to reset the counter independently of other operations.
4. **UP (Count Up Input)**:
    
    - When UP is HIGH (1), the counter increments (counts up) by one.
    - If UP is LOW (0), the counter remains unchanged.
5. **DOWN (Count Down Input)**:
    
    - When DOWN is HIGH (1), the counter decrements (counts down) by one.
    - If DOWN is LOW (0), the counter remains unchanged.


1. **Borrow Output (BO)**:
    
    - The BO output produces a **low-level pulse** when the count is **zero** (all outputs are low) and the **DOWN** input is low.
    - Essentially, it indicates that the counter has reached its minimum value (0) and is about to decrement further.
    - You can think of it as a “borrow” signal when counting down.
2. **Carry Output (CO)**:
    
    - The CO output produces a **low-level pulse** when the count is **maximum** (either 9 or 15, depending on the specific configuration) and the **UP** input is low.
    - It signifies that the counter has reached its maximum value and is about to increment further.
    - You can consider it as a “carry” signal when counting up.

These outputs are useful for cascading multiple counters together. By connecting the BO output of one counter to the DOWN input of the next counter and the CO output to the UP input, you can create larger multi-bit counters. If you have any more questions, feel free to ask! 😊