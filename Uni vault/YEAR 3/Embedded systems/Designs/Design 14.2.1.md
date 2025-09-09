# 14.2.1
# Binary counting with AND OPERATOR (&) 

# Circuit link
https://www.tinkercad.com/things/bGVro3vONgH-1421
# Code

```C++
int count;
int andCount;
int toPower;
int pinNum;

void setup() {
  pinMode(13, INPUT);
  Serial.begin(9600);
  for (int pin = 7; pin >= 2; pin--) {
    pinMode(pin, OUTPUT);
  }
}

void loop()
{
  	
    for(count = 0; count < 16; count++) {
	pinNum =2;
      
        andCount = count & 1;
        if(andCount > 0){
          digitalWrite(pinNum, HIGH);
        }else{
        	digitalWrite(pinNum, LOW);
        }

		pinNum++;
         andCount = count & 2;
        if(andCount > 0){
          digitalWrite(pinNum, HIGH);
        }else{
        	digitalWrite(pinNum, LOW);
        }
      
      pinNum++;
         andCount = count & 4;
        if(andCount > 0){
          digitalWrite(pinNum, HIGH);
        }else{
        	digitalWrite(pinNum, LOW);
        }
      
      delay(500);
    }
}


```

# Notes 

### 1. The Operator: `&` (Bitwise AND)

The `&` is the **bitwise AND** operator. It works directly on the binary (base-2) representations of numbers.

*   **How it works:** It compares each corresponding bit of two numbers.
*   **The Rule:** The result for a bit position is `1` **only if** both input bits are `1`. Otherwise, the result is `0`.

| Input A | Input B | Output (A & B) |
| :-----: | :-----: | :------------: |
|    0    |    0    |       0        |
|    0    |    1    |       0        |
|    1    |    0    |       0        |
|    1    |    1    |       1        |

### 2. The Operation: `count & 1`

Let's apply this to your line of code. We are performing a bitwise AND between the variable `count` and the constant number `1`.

*   The number `1` in binary is **`0001`** (assuming 4 bits for simplicity).
*   The variable `count` is changing (0, 1, 2, 3, ...15).

Because `1` has zeros in all bit positions except the rightmost one (the Least Significant Bit, or LSB), the result of the AND operation will be **zero everywhere except the rightmost bit**. The value of the rightmost bit in the result depends entirely on the rightmost bit of `count`.

**Let's look at examples as `count` increases:**

| count (Decimal) | count (Binary) | 1 (Binary) | andCount = count & 1 (Binary) | andCount (Decimal) |
| :-------------: | :------------: | :--------: | :---------------------------: | :---------------: |
|        0        |      `0000`    |   `0001`   |            `0000`             |         **0**         |
|        1        |      `0001`    |   `0001`   |            `0001`             |         **1**         |
|        2        |      `0010`    |   `0001`   |            `0000`             |         **0**         |
|        3        |      `0011`    |   `0001`   |            `0001`             |         **1**         |
|        4        |      `0100`    |   `0001`   |            `0000`             |         **0**         |
|        5        |      `0101`    |   `0001`   |            `0001`             |         **1**         |

---

### 3. The Practical Result: Checking for Odd/Even

As you can see from the table above:
*   If `count` is **even** (0, 2, 4...), its least significant bit is `0`. Therefore, `count & 1` returns **`0`**.
*   If `count` is **odd** (1, 3, 5...), its least significant bit is `1`. Therefore, `count & 1` returns **`1`**.

### In Your Code:

```cpp
andCount = count & 1; // This sets andCount to 1 for odd numbers, 0 for even.
if(andCount > 0) {    // If andCount is 1 (true)...
    digitalWrite(2, HIGH); // Turn the LED ON (for odd counts)
} else {              // If andCount is 0 (false)...
    digitalWrite(2, LOW);  // Turn the LED OFF (for even counts)
}
```

**In summary: `count & 1` is a very fast and efficient way for a computer to check if a number is odd or even by examining its least significant bit.** The LED on pin 2 will blink on and off, staying on for 500ms when `count` is odd and off for 500ms when `count` is even.


----

 ## What does the operator even do?
 
The short answer is: **No, the `&` operator does not "change" `count` into binary.** The computer is *already* storing the value of `count` in binary form internally.

### The Longer Explanation:

When you write `int count = 5;`, you are writing in **decimal** notation because it's easy for *humans* to read.

However, the microcontroller's memory (where the variable `count` is stored) doesn't store the digits "5". It stores electricity as either "on" or "off", which we represent as **1** or **0**. So, the number `5` is automatically stored in its binary form:

*   **Decimal `5`** = **Binary `101`**

The `&` (bitwise AND) operator is a fundamental instruction for the processor. The processor works directly on these binary patterns. It doesn't need to convert them because they are *already* in the correct form.

### The Analogy:

Think of it like this: You can say the word "five" in English or "cinco" in Spanish. The meaning (the value) is the same, but the representation is different.

*   **Decimal (`5`)**: This is the "English" representation for humans.
*   **Binary (`101`)**: This is the "Spanish" representation the computer uses internally.

The `&` operator is like a native Spanish speaker. It only understands the "Spanish" (binary) that the computer is already using. It doesn't hear "five", it only sees `101`.

### So what actually happens?

1.  **Storage:** `count` is always stored in memory as a binary number.
2.  **Operation:** The `&` operator tells the processor: "Take the binary pattern of `count` and perform a bitwise AND with the binary pattern of `1` (which is `...00000001`)."
3.  **Result:** The processor does this lightning-fast hardware operation and puts the resulting binary pattern back into the `andCount` variable.

You, the programmer, can *think* and *write* in decimal, but the computer *operates* in binary. The `&` operator is a direct window into that binary-level operation.

---

# 14.2.2 Using loops

# Circuit link

https://www.tinkercad.com/things/lPXMmrab8DS-1422
# Code


----


# 14.2.3 Using nested loops

# Circuit link
https://www.tinkercad.com/things/dFMrW9f25iU-1423

# Code


```C++
int count;
int andCount;
int toPower;
int pinNum;
int inner;
int oneCount, twoCount, threeCount, fourCount;

void setup() {
  pinMode(13, INPUT);
  Serial.begin(9600);
  for (int pin = 7; pin >= 2; pin--) {
    pinMode(pin, OUTPUT);
  }
}

void loop()
{
    for(threeCount = 0; threeCount < 2; threeCount++) {
        digitalWrite(4, threeCount);
        for(twoCount = 0; twoCount < 2; twoCount++) {
            digitalWrite(3, twoCount);
            for(oneCount = 0; oneCount < 2; oneCount++) {
                digitalWrite(2, oneCount);
                delay(400);
            }
        }
    }
}

```

# Notes 

We have three loops, each controlling one LED:
*   **Inner loop:** `oneCount` controls **Pin 2** (Least Significant Bit - 1s place)
*   **Middle loop:** `twoCount` controls **Pin 3** (2s place)
*   **Outer loop:** `threeCount` controls **Pin 4** (Most Significant Bit - 4s place)

The binary number being displayed is **(threeCount, twoCount, oneCount)**.

---

### Walkthrough Example

Let's trace the program's execution. Remember, the inner loop completes all its cycles before the middle loop increments, and the middle loop completes all its cycles before the outer loop increments.

**Initial State:** `threeCount = 0`, `twoCount = 0`, `oneCount = 0`

| # | threeCount (Pin 4) | twoCount (Pin 3) | oneCount (Pin 2) | Action                                                                                             | Binary Display (4,3,2) | Decimal Value |
|:-:|:------------------:|:----------------:|:----------------:|:---------------------------------------------------------------------------------------------------|:----------------------:|:-------------:|
| 1 |         0          |        0         |        0         | `digitalWrite(4, 0); digitalWrite(3, 0); digitalWrite(2, 0);` → All LEDs **OFF**                  |         `0 0 0`        |       0       |
|   |         0          |        0         |        0         | `delay(400);`                                                                                      |                        |               |
| 2 |         0          |        0         |        1         | **Inner loop increments.** `digitalWrite(2, 1);` → Pin 2 LED **ON**                                |         `0 0 1`        |       1       |
|   |         0          |        0         |        1         | `delay(400);`                                                                                      |                        |               |
|   |         0          |        0         |        -         | **Inner loop ends** (`oneCount < 2` is false). Returns to **middle loop**.                         |                        |               |
| 3 |         0          |        1         |        0         | **Middle loop increments.** `digitalWrite(3, 1);` → Pin 3 LED **ON**. Inner loop resets.           |         `0 1 0`        |       2       |
|   |         0          |        1         |        0         | `digitalWrite(2, 0);` → Pin 2 LED **OFF**                                                          |                        |               |
|   |         0          |        1         |        0         | `delay(400);`                                                                                      |                        |               |
| 4 |         0          |        1         |        1         | **Inner loop increments.** `digitalWrite(2, 1);` → Pin 2 LED **ON**                                |         `0 1 1`        |       3       |
|   |         0          |        1         |        1         | `delay(400);`                                                                                      |                        |               |
|   |         0          |        1         |        -         | **Inner loop ends**. Returns to **middle loop**.                                                   |                        |               |
|   |         0          |        -         |        -         | **Middle loop ends** (`twoCount < 2` is false). Returns to **outer loop**.                         |                        |               |
| 5 |         1          |        0         |        0         | **Outer loop increments.** `digitalWrite(4, 1);` → Pin 4 LED **ON**. Middle & inner loops reset.   |         `1 0 0`        |       4       |
|   |         1          |        0         |        0         | `digitalWrite(3, 0); digitalWrite(2, 0);` → Pins 3 & 2 **OFF**                                    |                        |               |
|   |         1          |        0         |        0         | `delay(400);`                                                                                      |                        |               |
| 6 |         1          |        0         |        1         | **Inner loop increments.** `digitalWrite(2, 1);` → Pin 2 LED **ON**                                |         `1 0 1`        |       5       |
|   |         1          |        0         |        1         | `delay(400);`                                                                                      |                        |               |
|   |         1          |        0         |        -         | **Inner loop ends**. Returns to **middle loop**.                                                   |                        |               |
| 7 |         1          |        1         |        0         | **Middle loop increments.** `digitalWrite(3, 1);` → Pin 3 LED **ON**. Inner loop resets.           |         `1 1 0`        |       6       |
|   |         1          |        1         |        0         | `digitalWrite(2, 0);` → Pin 2 LED **OFF**                                                          |                        |               |
|   |         1          |        1         |        0         | `delay(400);`                                                                                      |                        |               |
| 8 |         1          |        1         |        1         | **Inner loop increments.** `digitalWrite(2, 1);` → Pin 2 LED **ON**                                |         `1 1 1`        |       7       |
|   |         1          |        1         |        1         | `delay(400);`                                                                                      |                        |               |
|   |         1          |        1         |        -         | **Inner loop ends**. Returns to **middle loop**.                                                   |                        |               |
|   |         1          |        -         |        -         | **Middle loop ends**. Returns to **outer loop**.                                                   |                        |               |
|   |         -          |        -         |        -         | **Outer loop ends** (`threeCount < 2` is false). The entire `loop()` function restarts from 0.     |                        |               |

### Summary

This sequence of nested loops causes the three LEDs to count upward in binary from 0 to 7, holding each number for 400ms before moving to the next. The pattern will repeat forever because everything is inside the Arduino's `loop()` function.

| Step | Binary | Decimal | Visual (O=OFF, I=ON) |
| :--: | :----: | :-----: | :------------------: |
|  1   |  000   |    0    |       O, O, O        |
|  2   |  001   |    1    |       O, O, I        |
|  3   |  010   |    2    |       O, I, O        |
|  4   |  011   |    3    |       O, I, I        |
|  5   |  100   |    4    |       I, O, O        |
|  6   |  101   |    5    |       I, O, I        |
|  7   |  110   |    6    |       I, I, O        |
|  8   |  111   |    7    |       I, I, I        |

----
# 14.2.4 Recursion

# Circuit link
https://www.tinkercad.com/things/94rIS3WS8QL-1424
# Code
```C++
int count;
int andCount;
int toPower;
int pinNum;
int inner;
int oneCount, twoCount, threeCount, fourCount;

void setup() {
  pinMode(13, INPUT);
  Serial.begin(9600);
  for (int pin = 7; pin >= 2; pin--) {
    pinMode(pin, OUTPUT);
  }
}

void loop()
{
recursion_1(2);
}

void recursion_1(int pinNum) {
    int twoCount;
    for(twoCount = 0; twoCount < 2; twoCount++) {
        digitalWrite(pinNum, twoCount);
        if(pinNum < 4) {
            recursion_1(pinNum + 1);
        } else {
            delay(1000);
        }
    }
}
```
# Notes

Imagine the recursive function is a **team of workers**, each assigned to one light switch (pin). Their goal is to show every possible combination of the lights being ON (1) or OFF (0).

*   **Worker A** is in charge of **Pin 2**
*   **Worker B** is in charge of **Pin 3**
*   **Worker C** is in charge of **Pin 4**

The rule is simple: **A worker can only flip their own switch after the worker to their right has finished showing every possible combination for the current switch position.**

---

### Step-by-Step Walkthrough (The "Worker" Analogy)

**Step 1: Starting the Process**
*   The boss (`loop()`) tells Worker A: "Start with Pin 2".

**Step 2: Worker A's First Move (Pin 2 = 0)**
*   Worker A sets his switch (Pin 2) to **0** (OFF).
*   He then tells the next worker (B): "Your turn! Show me every combination for Pin 3 and Pin 4 **while I hold my switch at 0**."

**Step 3: Worker B's First Move (Pin 3 = 0)**
*   Worker B sets his switch (Pin 3) to **0** (OFF).
*   He then tells the next worker (C): "Your turn! Show me every combination for Pin 4 **while I hold my switch at 0**."

**Step 4: Worker C's Job (Pin 4)**
*   Worker C is the last worker. He doesn't need to hand off the task.
*   He sets his switch (Pin 4) to **0** (OFF). **→ Combination: 0 0 0**
*   He waits 1 second (`delay(1000)`) so we can see this number.
*   He then sets his switch (Pin 4) to **1** (ON). **→ Combination: 0 0 1**
*   He waits 1 second. He has now shown both possibilities for his switch (0 and 1).
*   His job is done. He reports back to Worker B: "I'm finished!"

**Step 5: Worker B's Second Move (Pin 3 = 1)**
*   Worker B hears that Worker C is finished. This means he has shown all combinations for his *current* switch position (0).
*   So, he now flips his *own* switch (Pin 3) to **1** (ON).
*   He again tells Worker C: "Your turn again! Show me every combination for Pin 4 **while I hold my switch at 1**."

**Step 6: Worker C's Job Again (Pin 4)**
*   Worker C obediently starts over.
*   He sets his switch (Pin 4) to **0** (OFF). **→ Combination: 0 1 0**
*   He waits 1 second.
*   He sets his switch (Pin 4) to **1** (ON). **→ Combination: 0 1 1**
*   He waits 1 second. His job is done again. He reports back to Worker B.

**Step 7: Worker B is Finished**
*   Worker B has now shown all combinations for *his* switch (both 0 and 1) **while Worker A's switch was held at 0**.
*   His job is done. He reports back to Worker A: "I'm finished!"

**Step 8: Worker A's Second Move (Pin 2 = 1)**
*   Worker A hears that Worker B is finished. This means he has shown all combinations for his *current* switch position (0).
*   So, he now flips his *own* switch (Pin 2) to **1** (ON).
*   He tells Worker B: "Your turn again! Show me every combination for Pins 3 and 4 **while I hold my switch at 1**."

**Steps 9-12: The Cycle Repeats**
*   Worker B and C now do their exact same dance again, but this time **with Pin 2 always ON**.
    *   Worker B sets Pin 3 to 0, Worker C shows 0 and 1. **→ Combinations: 1 0 0 and 1 0 1**
    *   Worker B sets Pin 3 to 1, Worker C shows 0 and 1. **→ Combinations: 1 1 0 and 1 1 1**

### The Final Result (The Binary Count)

By following this recursive process, the workers automatically generate all 8 possible binary numbers in perfect order:

| Step | Pin 2 | Pin 3 | Pin 4 | Binary Number | Decimal |
| :--: | :---: | :---: | :---: | :-----------: | :-----: |
|  1   |   0   |   0   |   0   |      000      |    0    |
|  2   |   0   |   0   |   1   |      001      |    1    |
|  3   |   0   |   1   |   0   |      010      |    2    |
|  4   |   0   |   1   |   1   |      011      |    3    |
|  5   |   1   |   0   |   0   |      100      |    4    |
|  6   |   1   |   0   |   1   |      101      |    5    |
|  7   |   1   |   1   |   0   |      110      |    6    |
|  8   |   1   |   1   |   1   |      111      |    7    |

**In your original code,** there are just more "workers" (for pins 5, 6, and 7), so it counts all the way from `000000` (0) to `111111` (63) before starting over. The `delay(1000)` only happens on the final pin (Worker G for Pin 7), which is why each number is displayed for a full second.
