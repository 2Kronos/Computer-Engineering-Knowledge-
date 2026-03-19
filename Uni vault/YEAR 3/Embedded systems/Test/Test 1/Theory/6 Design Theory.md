# Arduino Design 6 — millis(), Modulo & Phase Shifting

#arduino #study #millis #PWM #timing

---

## Table of Contents

- [[#Core Concept — millis() vs delay()]]
- [[#6.1 — Experimenting with millis()]]
- [[#6.3 — Modulus Operator]]
- [[#6.4 — LED to Maximum Brightness with Modulo Wrapping]]
- [[#6.5 — Make Intensity Change Faster]]
- [[#6.7.1 — Phase Shift Prep (Arrays + Functions + Conditionals)]]
- [[#6.7.2 — Phase Shift (Staggered LEDs)]]
- [[#Quick Reference — All Patterns]]

---

## Core Concept — millis() vs delay()

> [!info] What is millis()? `millis()` returns the number of **milliseconds elapsed since the Arduino was powered on**. It runs in the background and never pauses your code.

```cpp
unsigned long currentTime = millis(); // returns elapsed ms since startup
```

### millis() vs delay() — the key difference

||`delay()`|`millis()`|
|---|---|---|
|Pauses code?|✅ Yes — everything stops|❌ No — code keeps running|
|Can check buttons/sensors during wait?|❌ No|✅ Yes|
|Good for|Simple fixed pauses|Non-blocking timing, intervals|
|Data type needed|`int`|`unsigned long`|

### Standard millis() interval pattern

```cpp
unsigned long previousTime = 0;

void loop() {
  if (millis() - previousTime >= 1000) { // has 1 second passed?
    // do something every 1 second
    previousTime = millis();             // reset the timer
  }
}
```

> [!warning] Never use `==` with `millis()`. It counts so fast it will **skip the exact value**. Always use `>=` or `>` instead.

> [!tip] Why `unsigned long`? `millis()` grows very large very quickly. `int` overflows after ~32 seconds. `unsigned long` holds values up to ~49 days worth of milliseconds.

---

## 6.1 — Experimenting with millis()

> [!info] Concept Use `millis()` to trigger an action after a set amount of time without using `delay()`. The program keeps running while it waits.

```cpp
unsigned long previousTime = 0;

void loop() {
  unsigned long currentTime = millis();

  if (currentTime - previousTime >= 1000) { // 1000ms = 1 second
    digitalWrite(LED_BUILTIN, HIGH);         // action after 1 second
    previousTime = currentTime;              // save the time it triggered
  }
}
```

### How the timer works step by step

```
Start:     previousTime = 0,   millis() = 0    → difference = 0   (not >= 1000, wait)
After 0.5s: previousTime = 0,  millis() = 500  → difference = 500  (not >= 1000, wait)
After 1s:   previousTime = 0,  millis() = 1000 → difference = 1000 (>= 1000 ✅ trigger!)
            previousTime updated to 1000
After 2s:   previousTime = 1000, millis() = 2000 → difference = 1000 (triggers again)
```

---

## 6.3 — Modulus Operator

> [!info] What is modulus? The `%` operator returns the **remainder** after division.

```cpp
7 % 3 = 1   // 3 goes into 7 twice, remainder 1
10 % 4 = 2  // 4 goes into 10 twice, remainder 2
256 % 256 = 0
255 % 256 = 255
```

### 6.3.1 — Division vs Modulus output to Serial

```cpp
unsigned long value1 = millis();
int value2 = 1000;

int result = value1 / value2; // quotient (how many times it divides)
int result = value1 % value2; // remainder (what's left over)

Serial.println(result);
```

### 6.3.3 — Use the result to control LED brightness

```cpp
result = value1 % value2;
analogWrite(3, result); // use remainder directly as brightness (0–255)
```

> [!tip] This works because `%` keeps the result within a predictable range — perfect for feeding into `analogWrite()` which only accepts 0–255.

---

## 6.4 — LED to Maximum Brightness with Modulo Wrapping

> [!info] Core Idea `millis()` grows forever. `analogWrite()` only accepts 0–255. Use `% 256` to **wrap** the ever-growing millis value into a repeating 0–255 cycle.

```cpp
unsigned long value1 = millis();
int value2 = 1;           // controls speed of progression
int result;

result = value1 / value2; // scale the time value
result = result % 256;    // wrap into 0–255 range

analogWrite(3, result);   // drive LED with wrapped value
```

### Why % 256 and not % 255?

- Values go from **0 to 255** — that is **256 possible values** (0 is included)
- `% 256` produces: 0, 1, 2 … 254, 255, 0, 1, 2 … (perfect loop)
- `% 255` would produce: 0, 1, 2 … 253, 254, 0, 1 … (skips 255)

### How modulo wrapping creates a cycle

```
millis()  →  / value2  →  % 256  →  analogWrite
  0              0            0         off
  100            100          100       dim
  255            255          255       full brightness
  256            256          0         back to off ← wraps!
  511            511          255       full brightness again
  512            512          0         wraps again
```

> [!success] Result The LED continuously fades from 0 → 255 → 0 → 255 … in a repeating cycle driven entirely by elapsed time.

---

## 6.5 — Make Intensity Change Faster

> [!info] Concept Dividing `millis()` by a **smaller number** makes the result grow faster, reaching 255 sooner and cycling more quickly.

```cpp
// Slower cycle
value2 = 100;
result = value1 / value2; // takes 25,600ms to complete one full 0-255 cycle

// Faster cycle
value2 = 10;
result = value1 / value2; // takes 2,560ms — 10x faster
```

> [!tip] The relationship Smaller `value2` → larger result for the same `millis()` → reaches 255 faster → faster fade cycle.

```cpp
result = value1 / value2; // scale
result = result % 256;    // wrap — always needed to keep in 0–255 range
analogWrite(3, result);
```

---

## 6.7.1 — Phase Shift Prep (Arrays + Functions + Conditionals)

> [!info] Concept Prep work before phase shifting. Combines multiple concepts: arrays for multiple LEDs, a custom function for reusable brightness control, and a conditional to threshold the LED on/off.

### Arrays for multiple LEDs

```cpp
int pinNum[] = {3, 5, 6}; // store multiple PWM pin numbers

for (int i = 0; i < 3; i++) {
  pinMode(pinNum[i], OUTPUT);
}
```

### Custom function for LED brightness

```cpp
void LED_brightness(int pin, int brightness) {
  analogWrite(pin, brightness);
}

// Called like:
LED_brightness(3, result);
```

### Conditional threshold — on/off at midpoint

```cpp
if (result < 128) {
  digitalWrite(pin, LOW);  // bottom half of cycle = OFF
} else {
  digitalWrite(pin, HIGH); // top half of cycle = ON
}
```

> [!tip] The full 0–255 cycle has a midpoint at 128. This conditional splits the cycle into two equal halves — the LED is off for the first half and on for the second half. This creates a **50% duty cycle flash** timed by millis().

### Full concept chain

```
millis() → / value2 → % 256 → result → if(result < 128) → ON or OFF
                                      → LED_brightness() → analogWrite
```

---

## 6.7.2 — Phase Shift (Staggered LEDs)

> [!info] Concept Multiple LEDs run the same 0–255 brightness cycle but **start at different points** in the cycle. This creates a wave/chase effect across the LEDs.

### The problem — simply adding an offset breaks the 0–255 limit

```cpp
// WRONG — intensity can exceed 255
intensity = result + 85;  // if result = 200, intensity = 285 ❌
```

### The fix — wrap back around if it exceeds 255

```cpp
// Inspired by sine wave / circular arithmetic
// After 360° you return to the same point — same idea here

if (intensity > 255) {
  intensity = intensity - 256; // wrap back into 0–255 range
}
```

### Full phase shift pattern

```cpp
void LED_brightness(int pin, int phase) {
  int intensity = result + phase;  // offset the cycle start

  if (intensity > 255) {
    intensity = intensity - 256;   // wrap if over the limit
  }

  analogWrite(pin, intensity);
}

// In loop() — each LED gets a different phase offset:
LED_brightness(pinNum[0], 0);    // starts at 0   (no offset)
LED_brightness(pinNum[1], 85);   // starts at 85  (1/3 of the way through)
LED_brightness(pinNum[2], 170);  // starts at 170 (2/3 of the way through)
```

### Why offsets of 85?

```
256 / 3 LEDs = ~85 per LED
LED 1 offset:   0   (0/3 of cycle)
LED 2 offset:  85   (1/3 of cycle)
LED 3 offset: 170   (2/3 of cycle)
```

This spaces the three LEDs **evenly** around the 0–255 cycle — like three runners evenly spaced around a track.

### Modulo alternative (cleaner wrapping)

```cpp
intensity = (result + phase) % 256; // same effect, one line
```

> [!tip] `% 256` and `if (intensity > 255) intensity -= 256` do the same thing. The `if` version is easier to read; the `%` version is more concise.

---

## 6.8 — Add a Third LED

> [!info] Concept Call `LED_brightness()` a third time with a new phase offset. No new logic needed — the function handles everything.

```cpp
LED_brightness(pinNum[0], 0);
LED_brightness(pinNum[1], 85);
LED_brightness(pinNum[2], 170); // third LED added here
```

---

## Quick Reference — All Patterns

### Non-blocking interval with millis()

```cpp
unsigned long previousTime = 0;

if (millis() - previousTime >= 1000) {
  // runs every 1 second
  previousTime = millis();
}
```

### Modulo wrapping — keep value in 0–255

```cpp
result = millis() / value2; // scale speed
result = result % 256;      // wrap into PWM range
analogWrite(pin, result);
```

### Speed control

```cpp
value2 = 100; // slow fade
value2 = 10;  // fast fade (10x faster)
// smaller value2 = faster cycle
```

### Phase shift — stagger multiple LEDs

```cpp
void LED_brightness(int pin, int phase) {
  int intensity = result + phase;
  if (intensity > 255) intensity -= 256; // wrap
  analogWrite(pin, intensity);
}

// Evenly spaced across 3 LEDs:
LED_brightness(pin1, 0);
LED_brightness(pin2, 85);
LED_brightness(pin3, 170);
```

### Threshold conditional (ON/OFF at midpoint)

```cpp
if (result < 128) {
  digitalWrite(pin, LOW);
} else {
  digitalWrite(pin, HIGH);
}
```

---

> [!summary] The Big Picture Design 6 is about **time-based control without blocking**. The core chain is always the same: `millis()` gives you ever-growing time → divide to control speed → `% 256` wraps it into a repeating 0–255 cycle → `analogWrite()` drives the LED. Phase shifting is just adding an offset to that cycle for each LED so they all run the same pattern but slightly out of sync — like a wave.