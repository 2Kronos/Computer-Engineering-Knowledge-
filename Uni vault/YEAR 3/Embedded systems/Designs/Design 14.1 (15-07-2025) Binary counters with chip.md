
# 2023

# Theory Chip counter


## 🔹 What is the 74HC93?

The **74HC93** is a **4-bit binary ripple counter** (sometimes called a “divide-by-N counter”).

- It takes in a clock pulse and counts in **binary** (0, 1, 2, 3… up to 15, then wraps around).
    
- “Ripple counter” means each flip-flop inside the chip triggers the next one, so the output bits don’t all change at exactly the same time.
    

### **74HC93 / 74LS93 Notes: The Divide-by-16 Counter**

#### **1. Core Function**
*   The 74HC93 is a **4-bit asynchronous binary counter**.
*   It counts from **0 to 15** in binary and then **resets back to 0**.
*   It's a **"ripple" counter**—the count ripples from one flip-flop to the next.
*   The chip contains **two separate counters** internally:
    *   A **divide-by-2** counter (single flip-flop, output Q0).
    *   A **divide-by-8** counter (three flip-flops, outputs Q1, Q2, Q3).

#### **2. How to Configure it as a 4-Bit Counter**
To make the chip count from 0 to 15 (divide-by-16):
1.  **Chain the counters:** Connect the **Q0 output (Pin 12)** to the **CLK1 input (Pin 1)**.
2.  **Feed the clock:** Apply your input clock signal to the **CLK0 input (Pin 14)**.
3.  **Disable reset:** Connect **both reset pins (R1 and R2)** to **GND (LOW)**.

#### **3. Pinout (14-Pin DIP Package)**
| Pin # | Name  | Type   | Description                                                                 |
| :---- | :---- | :----- | :-------------------------------------------------------------------------- |
| 1     | CLK1  | Input  | Clock input for the internal divide-by-8 counter (Q1, Q2, Q3). Active LOW.  |
| 2     | NC    | -      | **No Connection.** Leave unconnected.                                       |
| 3     | R1    | Input  | **Reset Input 1 (Active HIGH).** Must be HIGH *with R2* to clear the count. |
| 4     | R2    | Input  | **Reset Input 2 (Active HIGH).** Must be HIGH *with R1* to clear the count. |
| 5     | VCC   | Power  | **Positive Supply Voltage.** Connect to +5V (or 2V-6V for HC version).      |
| 6     | NC    | -      | **No Connection.** Leave unconnected.                                       |
| 7     | NC    | -      | **No Connection.** Leave unconnected.                                       |
| 8     | Q2    | Output | Output Bit 2 (2's place in binary).                                         |
| 9     | Q1    | Output | Output Bit 1 (1's place in binary).                                         |
| 10    | GND   | Power  | **Ground.** Connect to 0V.                                                  |
| 11    | Q3    | Output | Output Bit 3 (4's place in binary, the Most Significant Bit - MSB).         |
| 12    | Q0    | Output | Output Bit 0 (8's place in binary, the Least Significant Bit - LSB).        |
| 13    | NC    | -      | **No Connection.** Leave unconnected.                                       |
| 14    | CLK0  | Input  | Clock input for the internal divide-by-2 counter (Q0). Active LOW.          |

#### **4. Key Specifications**
*   **Power Supply (VCC):**
    *   **74HC93:** Supports **2V to 6V**.
    *   **74LS93:** Supports **5V** only.
*   **Output Current:**
    *   **74LS93:** Can **source** 0.8 mA (output HIGH) or **sink** 16 mA (output LOW).
    *   **74HC93:** Can typically **source/sink** around 4 mA. *(Always check the datasheet for your specific model).*

#### **5. Reset Function**
*   The reset is **asynchronous** and **active HIGH**.
*   To **clear the count** (set all outputs Q0-Q3 to 0), apply a **HIGH** signal to **BOTH R1 (Pin 3) and R2 (Pin 4)** simultaneously.
*   For **normal counting**, keep **both R1 and R2 connected to GND (LOW)**.

#### **6. Equivalent & Alternative Chips**
*   **Equivalents:** 74HCT93, 74LVC93, 74AC93, 74ALS93, 74F93, 74C93. (Prefixes like "SN" from Texas Instruments are common, e.g., SN74HC93).
*   **Functional Alternatives (if unavailable):**
    *   CD4018 – Presettable divide-by-N counter
    *   CD4059 – Programmable divide-by-N counter
    *   CD4522 – Programmable BCD divide-by-N counter

#### **7. Quick-Start Connection Guide**
1.  **VCC (Pin 5)** → +5V
2.  **GND (Pin 10)** → 0V
3.  **R1 (Pin 3)** → GND
4.  **R2 (Pin 4)** → GND
5.  **Q0 (Pin 12)** → **CLK1 (Pin 1)**
6.  **Your Clock Signal** → **CLK0 (Pin 14)**
7.  **Outputs:** Monitor **Q0, Q1, Q2, Q3** (Pins 12, 9, 8, 11) for the 4-bit binary count.
-----
### The "Divide-By" Concept: The Clapping Analogy

Imagine you are clapping your hands to a steady beat. You clap **once every second**. This is your **input speed**.

Now, imagine you have a friend who is lazy and only claps **every other time** you clap.

*   **You clap:** 16 times.
*   **Your friend claps:** 8 times.

Your friend's clapping is **half** as fast as yours. We say your friend's clap is your clap **divided by 2**.

This is exactly what the **Q0** output pin does. For every two clock pulses it receives, it gives one output pulse. It **divides the input frequency by 2**.

---

### Now, Let's Add Another Friend (The Divide-by-8 Counter)

Now, imagine your lazy friend has an even lazier friend. This new friend only claps **every time your lazy friend claps 8 times**.

*   **You clap:** 16 times (the original input).
*   **Your lazy friend claps:** 8 times (Divide-by-2).
*   **The super lazy friend claps:** 1 time (Divide-by-8).

This super lazy friend's clap is **divided by 8** from your lazy friend's clap. But compared to your original clapping, it's **divided by 16** (2 x 8 = 16).

This is what the **Q3** output pin does. It's the "super lazy friend" of the chip.

---

### How the 74HC93 Does This

The chip has two sections inside:

1.  **The "Lazy Friend" (Divide-by-2):** This is the part connected to **CLK0** and **Q0**.
    *   You give it your fast clock (your clapping) at **CLK0**.
    *   It gives you a slower clock (your lazy friend's clapping) at **Q0**.

2.  **The "Super Lazy Friend" (Divide-by-8):** This is the part connected to **CLK1** and **Q1, Q2, Q3**.
    *   It needs its own clock signal to know when to count.

### The Magic Connection: `Q0` → `CLK1`

This wire is like telling your lazy friend, "Okay, your clap will now be the signal for the super lazy friend to clap."

*   **Input (Your Clap):** Goes into **CLK0**.
*   **Lazy Friend's Clap (Divide-by-2):** Comes out of **Q0**.
*   **This signal is fed directly** into the super lazy friend's ear (**CLK1**).
*   **Super Lazy Friend's Clap (Divide-by-8):** Comes out of **Q3**.

### The Final Result: Divide-by-16

What happens?
*   For the **super lazy friend (Q3)** to clap **once**...
*   ...the **lazy friend (Q0)** must clap **8 times**.
*   But for the **lazy friend (Q0)** to clap **8 times**...
*   ...**you (the original input)** must clap **16 times**.

**2 (from the first division) x 8 (from the second division) = 16**

So, the signal on **Q3** is your original clock signal **divided by 16**. It takes 16 of your fast input pulses to create just 1 output pulse on Q3. The chip counts through all 16 states (0 to 15) to accomplish this.

**In simple terms: "Divide-by" just means "slow down by a factor of."**
*   **Divide-by-2** = Twice as slow.
*   **Divide-by-16** = Sixteen times slower.


-----

## How does it actually count in binary 
### The Light Switch Analogy

Imagine you have **four light switches** in a row: **Q0, Q1, Q2, and Q3**.
*   **Q0** is the right-most switch (the 1's place).
*   **Q3** is the left-most switch (the 8's place).

**OFF (0)** means the light is off.
**ON (1)** means the light is on.

The pattern they follow is the same pattern you use when counting in binary on your fingers!

---

### The Counting Rule: How the Switches Flip

The rule for the 74HC93 is this:
1.  **The Q0 switch (the 1's place) flips (ON→OFF or OFF→ON) on every single clock pulse.** It's the most active.
2.  **Any other switch (Q1, Q2, Q3) only flips when the switch to its right goes from ON to OFF.**

Think of it like a car's odometer, but in binary! When one digit rolls over from 9 to 0, it forces the next digit to increase by 1. In this case, when a bit rolls over from 1 to 0, it forces the next bit to flip.

---

### Step-by-Step Counting Example

Let's see this rule in action. We'll start at 0 (`0000`) and watch the outputs change with each clock pulse.

| Clock Pulse | Action                                                                                             | Q3 (8's) | Q2 (4's) | Q1 (2's) | Q0 (1's) | Decimal # |
| :---------- | :------------------------------------------------------------------------------------------------- | :------- | :------- | :------- | :------- | :-------- |
| Start       | All switches are OFF.                                                                              | **0**    | **0**    | **0**    | **0**    | 0         |
| #1 📉       | **Q0 flips** (0→1). (Others don't flip because Q0 turned ON, not OFF).                             | 0        | 0        | 0        | **1**    | 1         |
| #2 📉       | **Q0 flips** (1→0). This is an OFF event, so **Q1 flips** (0→1).                                   | 0        | 0        | **1**    | **0**    | 2         |
| #3 📉       | **Q0 flips** (0→1). (Q1 stays 1 because Q0 turned ON).                                             | 0        | 0        | 1        | **1**    | 3         |
| #4 📉       | **Q0 flips** (1→0). This is an OFF event, so **Q1 flips** (1→0). Q1 turning OFF makes **Q2 flip** (0→1). | 0        | **1**    | **0**    | **0**    | 4         |
| #5 📉       | **Q0 flips** (0→1).                                                                                | 0        | 1        | 0        | **1**    | 5         |
| #6 📉       | **Q0 flips** (1→0). OFF event → **Q1 flips** (0→1).                                                | 0        | 1        | **1**    | **0**    | 6         |
| #7 📉       | **Q0 flips** (0→1).                                                                                | 0        | 1        | 1        | **1**    | 7         |
| #8 📉       | **Q0 flips** (1→0). OFF event → **Q1 flips** (1→0). Q1 OFF → **Q2 flips** (1→0). Q2 OFF → **Q3 flips** (0→1). | **1**    | **0**    | **0**    | **0**    | 8         |

...and this pattern continues all the way up to 15 (`1111`). On the 16th pulse, all bits ripple back to zero (`0000`).

### Why This is Called "Ripple" Counting

Notice how on clock pulse #8, changing Q0 caused a chain reaction that "rippled" all the way through Q1 and Q2 to finally change Q3. This doesn't happen instantly; there's a tiny delay as the change moves through each flip-flop. This is why it's called a **ripple counter**.

### Simple Takeaway

The chip counts in binary by following a very mechanical rule:
*   **The first bit (Q0) toggles every time.**
*   **Every other bit toggles only when the bit before it falls from 1 to 0.**

This simple rule creates the entire binary counting sequence automatically


-----

## Setup:
1.  The input clock signal is connected to **CLK0 (Pin 14)**.
2.  The output **Q0 (Pin 12)** is connected to the input **CLK1 (Pin 1)**.
3.  Both reset pins are connected to GND (LOW), so the chip is allowed to count.

We'll track what happens after each falling edge (📉) of the **original input clock** on CLK0.

### Step-by-Step Counting Example

The chip's state is shown as a 4-bit binary number: **Q3 Q2 Q1 Q0**

| Input Clock # | Action on CLK0 | Q0 (Pin 12) | What happens to CLK1? | Q3 Q2 Q1 (Pins 11, 8, 9) | Full Count (Q3 Q2 Q1 Q0) |
| :---: | :--- | :---: | :--- | :---: | :---: |
| **Start** | - | `0` | (LOW, no trigger) | `000` | `0000` (0) |
| #1 📉 | Falling Edge | **Toggles to `1`** | (LOW→HIGH, **no trigger**) | `000` | `0001` (1) |
| #2 📉 | Falling Edge | **Toggles to `0`** | (HIGH→LOW, **📉 TRIGGER!**) | `000` → `001` | `0010` (2) |
| #3 📉 | Falling Edge | **Toggles to `1`** | (LOW→HIGH, no trigger) | `001` | `0011` (3) |
| #4 📉 | Falling Edge | **Toggles to `0`** | (HIGH→LOW, **📉 TRIGGER!**) | `001` → `010` | `0100` (4) |
| #5 📉 | Falling Edge | Toggles to `1` | (LOW→HIGH, no trigger) | `010` | `0101` (5) |
| #6 📉 | Falling Edge | Toggles to `0` | (HIGH→LOW, **📉 TRIGGER!**) | `010` → `011` | `0110` (6) |
| #7 📉 | Falling Edge | Toggles to `1` | (LOW→HIGH, no trigger) | `011` | `0111` (7) |
| #8 📉 | Falling Edge | Toggles to `0` | (HIGH→LOW, **📉 TRIGGER!**) | `011` → `100` | `1000` (8) |
| #9 📉 | Falling Edge | Toggles to `1` | (LOW→HIGH, no trigger) | `100` | `1001` (9) |
| #10 📉 | Falling Edge | Toggles to `0` | (HIGH→LOW, **📉 TRIGGER!**) | `100` → `101` | `1010` (10) |
| #11 📉 | Falling Edge | Toggles to `1` | (LOW→HIGH, no trigger) | `101` | `1011` (11) |
| #12 📉 | Falling Edge | Toggles to `0` | (HIGH→LOW, **📉 TRIGGER!**) | `101` → `110` | `1100` (12) |
| #13 📉 | Falling Edge | Toggles to `1` | (LOW→HIGH, no trigger) | `110` | `1101` (13) |
| #14 📉 | Falling Edge | Toggles to `0` | (HIGH→LOW, **📉 TRIGGER!**) | `110` → `111` | `1110` (14) |
| #15 📉 | Falling Edge | Toggles to `1` | (LOW→HIGH, no trigger) | `111` | `1111` (15) |
| #16 📉 | Falling Edge | **Toggles to `0`** | (HIGH→LOW, **📉 TRIGGER!**) | `111` → `000` | `0000` (0) |
| **#1** | ...and the cycle repeats! | | | | |

---

### Key Things to Notice:

1.  **Q0 Toggles Every Time:** The first flip-flop (Q0) changes state (0→1 or 1→0) on **every single falling edge** of the input clock. It divides the clock by 2.

2.  **The "Trigger" for the Higher Bits:** The divide-by-8 section (Q1, Q2, Q3) **only advances when Q0 falls from 1 to 0**. This happens on every *other* input clock pulse (on clock pulses #2, #4, #6, #8, etc.).

3.  **It's a Ripple Counter:** The counting action "ripples" through the chip. The first flip-flop (Q0) changes first, and that change triggers the next ones. This is why it's called an *asynchronous* counter.

4.  **The Final Output (Q3):** Look at the value of **Q3**. It started at 0, and it only changed to 1 after the **8th input pulse**. It changed back to 0 after the **16th input pulse**. This means the signal on Q3 is your original clock signal, **divided by 16**.

### Simple Takeaway:

Imagine the input clock is a metronome ticking 16 times.

*   **Q0** (Pin 12) will clap **8 times**.
*   **Q1** (Pin 9) will clap **4 times**.
*   **Q2** (Pin 8) will clap **2 times**.
*   **Q3** (Pin 11) will clap **only once**.

This is why it's such a useful chip for slowing down digital signals!


# Circuit link 

https://www.tinkercad.com/things/8VAII1RfjvN-141

```C++
// C++ code
//
void setup()
{
  pinMode(12, OUTPUT);
}

void loop()
{
  digitalWrite(12, HIGH);
  delay(1000); // Wait for 1000 millisecond(s)
  digitalWrite(12, LOW);
  delay(1000); // Wait for 1000 millisecond(s)
}
```