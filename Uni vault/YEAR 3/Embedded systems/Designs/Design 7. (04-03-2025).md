# Shift register 

![Pasted image 20250310235528](https://github.com/user-attachments/assets/17f2d993-e715-4ae4-aab0-894bb751d874)


- The number will be shifted then it will be passed on 

The **74HC595** is an 8-bit serial-in, parallel-out shift register with an **output latch**. It has **16 pins**, each serving a specific function:

### **Pin Configuration & Functions**

|**Pin**|**Name**|**Function**|
|---|---|---|
|**1**|**QB**|Output pin 2nd bit|
|**2**|**QC**|Output pin 3rd bit|
|**3**|**QD**|Output pin 4th bit|
|**4**|**QE**|Output pin 5th bit|
|**5**|**QF**|Output pin 6th bit|
|**6**|**QG**|Output pin 7th bit|
|**7**|**QH**|Output pin 8th bit|
|**8**|**GND**|Ground (0V)|
|**9**|**QH'**|Serial data out (cascading to another 74HC595)|
|**10**|**MR**|Master Reset (Active LOW) – Clears all shift register data when LOW|
|**11**|**SHCP (SRCLK)**|Shift Register Clock – Shifts data on the rising edge|
|**12**|**STCP (RCLK)**|Storage Register Clock – Latches the output on the rising edge|
|**13**|**OE**|Output Enable (Active LOW) – Enables/disables output pins (LOW = enabled)|
|**14**|**DS**|Serial Data Input – Feeds data into the shift register|
|**15**|**QA**|Output pin 1st bit|
|**16**|**VCC**|Power supply (typically **+5V**)|

### **How Each Pin Works**

- **Serial Data (DS, Pin 14)**: Accepts data one bit at a time.
- **Shift Register Clock (SHCP, Pin 11)**: Moves data into the register on the rising edge.
- **Storage Register Clock (STCP, Pin 12)**: Latches shifted data to output pins when HIGH.
- **Outputs (QA-QH, Pins 1-7, 15)**: Hold the stored parallel output.
- **QH' (Pin 9)**: Serial output for cascading multiple shift registers.
- **Master Reset (MR, Pin 10)**: Clears all stored data when LOW.
- **Output Enable (OE, Pin 13)**: Controls if output is active (LOW = enabled).
- **Power (VCC & GND, Pins 16 & 8)**: Provides power to the chip.

This shift register is often used in **expanding I/O pins** of microcontrollers and for **LED control** in projects like **LED matrices**.

- One clock is to shift up
- Need a pulse to shift it and a pulse to clock it into the bottom
- They have to follow each 

---
Yes, the **74HC595 shift register shifts data on every rising edge** of the **Shift Register Clock (SHCP / SRCLK, Pin 11)**.

### **How the Shifting Works**

- When **SHCP (SRCLK)** receives a **rising edge** (LOW to HIGH transition), the shift register **moves all stored bits one position to the right**.
- The new bit from **DS (Serial Data Input, Pin 14)** enters the first position (**QA**), while the last bit (**QH**) moves to the **QH' (Pin 9)** output for cascading.

### **Key Notes**

- The **Storage Register Clock (STCP / RCLK, Pin 12)** **does NOT affect shifting**. It only **updates the outputs (QA–QH) on its rising edge**.
- **Shifting happens only when SHCP gets a rising edge**, not continuously.
- If SHCP is held HIGH or LOW, the shift register holds its current state.

---
# 7.1 Make all the LED high

## **Circuit link and image 

https://www.tinkercad.com/things/fpw2t9vZDdS-design-71

![Pasted image 20250508210040](https://github.com/user-attachments/assets/f1e4a4e3-fcdb-4093-a749-4565a5973506)

## **Code
```C++

void setup()
{
  pinMode(11, OUTPUT); //Connected to the clock
  pinMode(12, OUTPUT);//Connectewd to the output clock this will control what is diplayed on output pins
  pinMode(13, OUTPUT); //This will be where we input data
  digitalWrite(13, HIGH);// We want to fill everything with one 
  // Information we want to pump in 
  
  
}

void loop()
{
  digitalWrite(11, HIGH);
  delay(100);//We still have another pulse 
  digitalWrite(11, LOW);
  delay(100);
  
  digitalWrite(12, HIGH);
  delay(100);//This is to see the outpit  
  digitalWrite(12, LOW);
  delay(100);
   
}
```

## **Notes 

Yes — in the **74HC595 shift register**, the **Output Register Clock** (often called **RCLK** or **STCP**) controls when the data in the internal shift register is **copied to the output pins (Q0–Q7)**.

Here’s how it works:

- The 74HC595 has two main internal registers:
    
    1. **Shift register** — this holds the data you shift in serially (via DS and SHCP).
        
    2. **Storage (or output) register** — this holds the data that actually drives the output pins Q0–Q7.
        
- You shift data into the shift register using the **Shift Clock** (SHCP, also called SRCLK).
    
- But **the outputs (Q0–Q7) don’t change until you pulse the Output Register Clock (RCLK/STCP)**. When you pulse RCLK:
    
    - The contents of the shift register are **latched (copied)** into the storage register.
        
    - The storage register then drives the Q0–Q7 outputs.
        

So, **RCLK controls when the outputs update**. This allows you to load new data in the background without changing the outputs until you’re ready.

✅ Summary:  
Yes — the Output Register Clock (RCLK/STCP) controls when the data in the shift register is copied to the output pins. Without pulsing it, the outputs will keep showing the previous latched values, even if you shift in new data.

----
# 7.2.1 Switch only the first 4 LEDs

## **Circuit link
https://www.tinkercad.com/things/7ijpx5QnMqZ-design-721
## **Code

```c++
int count;
void setup()
{
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
 // We want to fill everything with one 
  // Information we want to pump in
}

void loop()
{
  
  for(count = 0; count<4; count++){
    digitalWrite(11, HIGH);
    delay(100);//We still have another pulse 
    digitalWrite(11, LOW);
    delay(100);

    digitalWrite(12, HIGH);
    delay(100);//We still have another pulse 
    digitalWrite(12, LOW);
    delay(100);

  }
  while(true){}
   
}
```

## **Notes

- The sequence (pins 11 and 12 blinking) repeats indefinitely every 4 counts, but since the `loop()` restarts, it's hard to notice the "4 times" behavior because it just keeps repeating.

#### With `while(true)` Added

When you add `while(true){}` at the end of the `loop()`:

1. The `for` loop still runs 4 times exactly as before
2. After completing 4 iterations, the code hits `while(true)`
3. This creates an infinite loop that does nothing, preventing the `loop()` function from restarting

**Result**: The sequence runs exactly 4 times and then stops completely, making the "4 times" behavior clearly observable.
#### Why the Difference?

- Without `while(true)`, Arduino's natural behavior is to continuously restart the `loop()` function, making the 4-iteration limit less noticeable.
- With `while(true)`, you're forcing the program to stop after exactly 4 iterations by creating an infinite loop that blocks further execution.

If you want to run the sequence exactly 4 times and then stop, the `while(true)` approach works. If you want it to repeat every 4 iterations indefinitely, you should keep the original version without `while(true)`.

## Version 2

- You can also just put the piece of code into `stetup()`

```c++
int count;
void setup()
{
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
 // We want to fill everything with one 
  // Information we want to pump in 
  for(count = 0; count<4; count++){
    digitalWrite(11, HIGH);
    delay(100);//We still have another pulse 
    digitalWrite(11, LOW);
    delay(100);

    digitalWrite(12, HIGH);
    delay(100);//We still have another pulse 
    digitalWrite(12, LOW);
    delay(100);

  }
}

void loop()

   
}
```

-----
# 7.3 Show the input via LED

## **Circuit link and image 

https://www.tinkercad.com/things/bjFzTe4CXM8-design-73

![Pasted image 20250512213347](https://github.com/user-attachments/assets/208733b7-d528-440a-b835-154c25f48cc2)

## **Notes**

- We will show the input of the `input`, `Outout regicter clock`, `Register clock` via led in order to understand how the shift register is working
- This new arrangement will enable us to see how the register clock and the register output clock work together in order to display the 4 LEDs

# 7.4 Shift by 2 bits every time 

## **Circuit link**

https://www.tinkercad.com/things/518UaYQAiJ1-design-74

## **Code**

```c++
int count;
void setup()
{
  pinMode(11, OUTPUT); //shift register clock
  pinMode(12, OUTPUT); // Output register clock
  pinMode(13, OUTPUT); //Input
  digitalWrite(13, HIGH); // Input 1s into the register 
 // We want to fill everything with one 
  // Information we want to pump in 
  
  digitalWrite(13, LOW);//Fill it with zeros 
  for(count = 0; count<4; count++){
    digitalWrite(11, HIGH);
    delay(100);//
    digitalWrite(11, LOW);
    delay(100);

    digitalWrite(12, HIGH);
    delay(100);//
    digitalWrite(12, LOW);
    delay(100);

  }
  
   digitalWrite(13, HIGH);//Fill it with  1
    for(count = 0; count<2; count++){// here we will pulse 2 times
    digitalWrite(11, HIGH);
    delay(1000);//
    digitalWrite(11, LOW);
    delay(1000);


  }
  
  //here we pulse it once to diplay the output 
    digitalWrite(12, HIGH);
    delay(1000);//
    digitalWrite(12, LOW);
    delay(1000);

}

void loop()
{
 
}
```

## **Notes**

* The blue led is for the register clock 
	* The register clock will store the input on each clock pulse 
	  
* The yellow led is for the output register clock 
	* This pin will display the input that was stored onto the register 
	* It will push the store input out to the output pins at every pulse

- So in this case where we want the blue to flash two times 
	- This will result in two 1s being stored onto the shift register 

- The yellow must then flash 1 time
	- This will result in the stored input which in this case is two 1s that will be displayed onto the output which is the leds
	- By doing this we will be shifting 2 bits every time 

---
# 7.5 Two on two off
