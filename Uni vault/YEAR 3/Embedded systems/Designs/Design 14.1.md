# Binary counting with AND OPERATOR (&) 

# Circuit link
https://www.tinkercad.com/things/bGVro3vONgH-1421
# Code

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

---

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

That's an excellent question, and it gets to the very heart of how computers work.

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

# 14.2 Using loops

# Circuit link


# Code

# 14.3 Using nested loops

# Circuit link


# Code


```C++
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
# 14.3 Recursion

# Circuit link


# Code