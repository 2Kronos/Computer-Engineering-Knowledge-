✅ **Question 1: Alternating LEDs (Even ↔ Odd)**

Task:

Using your existing circuit and shift register, manually send data so that:

All even-positioned LEDs (Q0, Q2, Q4, Q6) are ON, then OFF.

All odd-positioned LEDs (Q1, Q3, Q5, Q7) are ON, then OFF.

This alternates every 1 second.

**Hint:**

·       Use two arrays: one with the pattern 10101010 and one with 01010101.

·       Loop through each array from MSB to LSB (Q7 to Q0).

·       Use digitalWrite(13, value) to set the data bit.

·       Pulse digitalWrite(11, HIGH then LOW) to clock it in.

·       Pulse digitalWrite(12, HIGH then LOW) to latch and display.

---

**✅ Question 2: Knight Rider Effect**

**Task:**

Make a single LED move from **left to right** (Q0 to Q7) and then back from **right to left** (Q6 to Q1) repeatedly, like the Knight Rider car light.

**Hint:**

Create a blank 8-element array filled with 0s.

Set just one bit to 1 at a time depending on position.

Loop from i = 0 to 7 and then back i = 6 to 0.

For each frame:

Load the bits manually like before.

Pulse the clock and latch like in your LED loading examples.

---

**✅ Question 3: Binary Counter (0–255) (Dont do this** **🔴🔴)**

**Task:**

Write code to manually count from 0 to 255 and display each number in **binary** on the LEDs, updating every 250 milliseconds.

**Hint:**

Use a for loop from 0 to 255.

Use (num >> i) & 1 to extract each bit from MSB to LSB.

Send each bit one at a time using digitalWrite(13, bit), clock it in with pin 11, and latch using pin 12.

This mimics binary counting across the shift register.

