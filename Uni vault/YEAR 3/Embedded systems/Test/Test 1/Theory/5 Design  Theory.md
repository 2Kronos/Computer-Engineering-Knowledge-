# Arduino Design 5 — PWM & LED Fading

#arduino #study #PWM #LED

---

## Table of Contents

- [[#Core Concept — What is PWM?]]
- [[#5.2 — Arrays and Loops for Pin Setup]]
- [[#5.3 — Fade LED Brighter (0 → 255)]]
- [[#5.4 — Fade Brighter and Dimmer (Nested Loops)]]
- [[#5.5.1 — One LED at a Time]]
- [[#5.5.2 — Reverse Direction on Last LED]]
- [[#5.5.3 — Removing Duplicate Code with a Function]]
- [[#5.6 — Two LEDs at Opposite Brightness]]
- [[#Quick Reference — All Patterns]]

---

## Core Concept — What is PWM?

> [!info] PWM — Pulse Width Modulation PWM is how Arduino simulates an analog output on a digital pin. It rapidly switches the pin ON and OFF. The longer it stays ON per cycle, the brighter the LED appears.

- `analogWrite(pin, value)` accepts values from **0** (fully off) to **255** (fully on)
- 255 because Arduino uses **8-bit resolution** → 2⁸ = 256 possible values (0–255)
- It does **not** produce a true analog voltage — it simulates one with rapid switching

### PWM-capable pins on Arduino Uno

|Type|Pins|Used for|
|---|---|---|
|**PWM Digital Pins**|3, 5, 6, 9, 10, 11|`analogWrite()` — LED brightness, motor speed|
|**Analog Pins (A0–A5)**|A0–A5|`analogRead()` — reading sensors|

> [!warning] `analogWrite()` will **not work** on non-PWM pins like 2, 4, 7, 8, 12, 13. Always use pins 3, 5, 6, 9, 10, 11 for fading.

---

## 5.2 — Arrays and Loops for Pin Setup

> [!info] Concept Instead of writing `pinMode()` six times, store all pin numbers in an **array** and loop through it once.

```cpp
int DT = 400;                    // DT = Delay Time
int PN[] = {3, 5, 6, 9, 10, 11}; // array of PWM pins

void setup() {
  for (int count = 0; count < 6; count++) {
    pinMode(PN[count], OUTPUT);  // sets each pin as OUTPUT
  }
}
```

### How array indexing works

```
PN[] = { 3,  5,  6,  9,  10,  11 }
index:   0   1   2   3   4    5
```

- `PN[0]` → pin 3
- `PN[3]` → pin 9
- `PN[5]` → pin 11 (last element)

> [!tip] Array index always starts at **0**, not 1. A 6-element array has indices 0–5.

---

## 5.3 — Fade LED Brighter (0 → 255)

> [!info] Concept Loop through brightness values 0 to 255 and write each value to all LEDs simultaneously.

```cpp
for (int brightness = 0; brightness <= 255; brightness++) {
  for (int count = 0; count < 6; count++) {
    analogWrite(PN[count], brightness); // apply same brightness to all LEDs
  }
  delay(DT);
}
```

### Loop structure

- **Outer loop** — controls brightness level (0 → 255)
- **Inner loop** — applies that brightness to every pin in `PN[]`
- `brightness++` increments by 1 each time → smooth gradual fade

> [!warning] This loop only goes **brighter**. After reaching 255 it stops. See 5.4 for fade in + out.

---

## 5.4 — Fade Brighter and Dimmer (Nested Loops)

> [!info] Concept Two separate nested loops — one counts up (0→255), one counts down (255→0). Creates a full breathe/pulse effect.

```cpp
int DT = 10;
int PN[] = {3, 5, 6, 9, 10, 11};

void loop() {

  // Fade IN (brighter)
  for (int brightness = 0; brightness <= 255; brightness++) {
    for (int count = 0; count < 6; count++) {
      analogWrite(PN[count], brightness);
    }
    delay(DT);
  }

  // Fade OUT (dimmer)
  for (int brightness = 255; brightness >= 0; brightness--) {
    for (int count = 0; count < 6; count++) {
      analogWrite(PN[count], brightness);
    }
    delay(DT);
  }

}
```

### Key concepts summary

|Concept|Example|Purpose|
|---|---|---|
|**Variable**|`int DT = 10;`|Store delay time — change one place to affect everything|
|**Array**|`int PN[] = {...}`|Group all LED pins together|
|**for loop**|`for (int count...)`|Repeat for each pin|
|**Nested loop**|`for` inside `for`|Control all LEDs at each brightness level|
|**Increment**|`brightness++`|Increase brightness 0 → 255|
|**Decrement**|`brightness--`|Decrease brightness 255 → 0|

---

## 5.5.1 — One LED at a Time

> [!info] Concept Swap the loop order. The **outer loop** flips through LEDs, the **inner loops** fade each one in then out — one pin at a time.

```cpp
void loop() {
  for (int count = 0; count < 6; count++) {   // outer: each LED

    // Fade IN
    for (int brightness = 0; brightness < 256; brightness++) {
      analogWrite(PN[count], brightness);
      delay(DT);
    }

    // Fade OUT
    for (int brightness = 255; brightness > -1; brightness--) {
      analogWrite(PN[count], brightness);
      delay(DT);
    }

  }
}
```

### 5.4 vs 5.5.1 — Loop order comparison

||Outer loop|Inner loop|Effect|
|---|---|---|---|
|**5.4**|brightness (0→255)|all 6 LEDs|All LEDs fade together|
|**5.5.1**|each LED (0→5)|brightness (0→255, then 255→0)|LEDs fade one at a time|

> [!tip] The **order of nested loops determines the behaviour**. Swapping outer and inner completely changes what happens.

---

## 5.5.2 — Reverse Direction on Last LED

> [!info] Concept After the forward pass (LED 0→5), add a second loop that runs **backwards** (LED 5→0). Copy-paste the loop, change the counter direction.

```cpp
void loop() {

  // Forward: LED 0 → 5
  for (int count = 0; count < 6; count++) {
    // fade in
    for (int brightness = 0; brightness < 256; brightness++) {
      analogWrite(PN[count], brightness);
      delay(DT);
    }
    // fade out
    for (int brightness = 255; brightness > -1; brightness--) {
      analogWrite(PN[count], brightness);
      delay(DT);
    }
  }

  // Reverse: LED 5 → 0
  for (int count = 5; count > -1; count--) {
    // fade in
    for (int brightness = 0; brightness < 256; brightness++) {
      analogWrite(PN[count], brightness);
      delay(DT);
    }
    // fade out
    for (int brightness = 255; brightness > -1; brightness--) {
      analogWrite(PN[count], brightness);
      delay(DT);
    }
  }

}
```

> [!warning] Problem with this code There is **duplicate code** — the fade in/out block appears 4 times. This is inefficient and hard to maintain. See 5.5.3 for the fix.

---

## 5.5.3 — Removing Duplicate Code with a Function

> [!info] Concept Extract the repeated fade in/out block into a **custom function** called `flash()`. Call it from both loops. Change the fade logic in one place only.

```cpp
void loop() {

  // Forward: LED 0 → 5
  for (int count = 0; count < 6; count++) {
    flash(count);
  }

  // Reverse: LED 5 → 0
  for (int count = 5; count >= 0; count--) {
    flash(count);
  }

}

// Custom function — declared outside loop()
void flash(int LED_NUM) {

  // Fade IN
  for (int brightness = 0; brightness < 256; brightness++) {
    analogWrite(PN[LED_NUM], brightness);
    delay(DT);
  }

  // Fade OUT
  for (int brightness = 255; brightness >= 0; brightness--) {
    analogWrite(PN[LED_NUM], brightness);
    delay(DT);
  }

}
```

### Why this matters

||5.5.2|5.5.3|
|---|---|---|
|Fade logic written|4 times|1 time (inside `flash()`)|
|To change fade speed|Edit in 4 places|Edit `DT` once|
|Code length|Long|Short|
|Arduino processor|Works harder|More efficient|

> [!success] Rule If you find yourself copy-pasting the same block of code, that's the signal to **make it a function**.

### Function anatomy

```cpp
void flash(int LED_NUM) {
//   ↑         ↑
// return    parameter
// type      (input the function receives)
```

- `void` — the function returns nothing
- `int LED_NUM` — accepts one integer (the LED index to flash)
- Called with: `flash(0)`, `flash(3)`, `flash(count)`

---

## 5.6 — Two LEDs at Opposite Brightness

> [!info] Concept One LED fades from 0→255 while the other simultaneously fades from 255→0. Calculate the opposite value with `255 - brightness`.

```cpp
void setup() {
  pinMode(3, OUTPUT);
  pinMode(5, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int brightness_1;

  for (int brightness = 0; brightness < 256; brightness++) {
    brightness_1 = 255 - brightness;  // always the opposite

    analogWrite(3, brightness);        // LED 1: gets brighter
    analogWrite(5, brightness_1);      // LED 2: gets dimmer

    Serial.print(brightness);
    Serial.print(" - opposite: ");
    Serial.println(brightness_1);

    delay(10);
  }
}
```

### How the opposite calculation works

|`brightness` (LED 1)|`255 - brightness` (LED 2)|
|---|---|
|0|255|
|64|191|
|128|127|
|191|64|
|255|0|

> [!tip] `brightness + brightness_1` always equals **255**. As one goes up, the other goes down by the exact same amount.

### Serial Monitor output

```
Serial.print()    → prints without a new line
Serial.println()  → prints with a new line at the end
```

Used here to log both brightness values each loop iteration — useful for debugging.

---

## Quick Reference — All Patterns

### Array + loop pin setup

```cpp
int PN[] = {3, 5, 6, 9, 10, 11};
for (int count = 0; count < 6; count++) {
  pinMode(PN[count], OUTPUT);
}
```

### Fade all LEDs together

```cpp
for (int brightness = 0; brightness <= 255; brightness++) {
  for (int count = 0; count < 6; count++) {
    analogWrite(PN[count], brightness);
  }
  delay(DT);
}
```

### Fade one LED at a time

```cpp
for (int count = 0; count < 6; count++) {        // outer: which LED
  for (int brightness = 0; brightness < 256; brightness++) {
    analogWrite(PN[count], brightness); delay(DT);
  }
  for (int brightness = 255; brightness >= 0; brightness--) {
    analogWrite(PN[count], brightness); delay(DT);
  }
}
```

### Custom flash function

```cpp
void flash(int LED_NUM) {
  for (int brightness = 0; brightness < 256; brightness++) {
    analogWrite(PN[LED_NUM], brightness); delay(DT);
  }
  for (int brightness = 255; brightness >= 0; brightness--) {
    analogWrite(PN[LED_NUM], brightness); delay(DT);
  }
}
```

### Opposite brightness (two LEDs)

```cpp
analogWrite(3, brightness);
analogWrite(5, 255 - brightness); // always the inverse
```

---

> [!summary] The Big Picture Design 5 is about **PWM and control flow**. The key insight is that changing the **order of nested loops** changes the entire behaviour — all LEDs together vs one at a time. Once you spot repeated code, extract it into a **function** to keep things clean and efficient.