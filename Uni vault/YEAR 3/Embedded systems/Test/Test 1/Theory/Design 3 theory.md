# Arduino Button Study Guide

#arduino #study #embedded

---

## Table of Contents

- [[#1. How a Button Press is Detected]]
- [[#2. The h_delay() Function]]
- [[#3. Button as a Toggle Switch]]
- [[#4. Using millis() for Timing]]
- [[#5. Loops and Conditions]]
- [[#6. Quick Reference — All Patterns]]

---

## 1. How a Button Press is Detected

> [!info] Core Concept `digitalRead(pin)` returns `HIGH` (1) or `LOW` (0) depending on whether the button is currently pressed.

### Setup (always required)

```cpp
void setup() {
  pinMode(2, INPUT);   // button on pin 2
  Serial.begin(9600);  // open serial monitor
}
```

### Method 1 — Simple check (fires while held)

```cpp
bool userIn;

userIn = digitalRead(2);
if (userIn == true) {
  Serial.println("Button pressed");
}
```

> [!warning] Problem Because of the `delay()` calls in the rest of `loop()`, the button check is only reached after all other code finishes. **You have to hold the button** to catch it.

---

### Method 2 — Rising Edge Detection (fires once per press)

Detects the exact moment the button transitions **LOW → HIGH**.

```cpp
bool userIn;
bool user_prev = false;  // tracks the previous state

if (userIn == HIGH && user_prev == LOW) {
  // Triggered ONCE at the instant of press
  Serial.println("Button pressed");
}
user_prev = userIn;  // ⚠️ always update at the end
```

> [!tip] Key Rule Always update `user_prev = userIn` at the **end** of every check. If you forget, the edge detection breaks.

---

### Method 3 — Falling Edge Detection (fires once on release)

Detects the moment the button transitions **HIGH → LOW**.

```cpp
else if (userIn == LOW && user_prev == HIGH) {
  // Triggered ONCE at the instant of release
  Serial.println("Button released");
}
```

### Edge Detection Summary

|Condition|Meaning|
|---|---|
|`userIn == HIGH`|Button is currently held down|
|`userIn == HIGH && user_prev == LOW`|Rising edge — just pressed|
|`userIn == LOW && user_prev == HIGH`|Falling edge — just released|

---

## 2. The h_delay() Function

> [!info] Why it exists `delay(400)` freezes **all** code for 400ms — button presses during this time are completely missed. `h_delay()` replaces it with a loop of 1ms waits, checking the button on each iteration.

### How it works

```cpp
void h_delay(int time) {
  for (int c = 0; c < time; c++) {
    delay(1);                       // wait 1ms
    userIn = digitalRead(2);        // check button state
    if (userIn == HIGH && user_prev == LOW) {
      // button was pressed at millisecond c
      String msg = String("Button pressed at ms: ") + String(c);
      Serial.println(msg);
    }
    user_prev = userIn;             // update previous state
  }
}
```

### The `c` variable (loop counter)

- Counts from `0` to `time - 1`
- Each iteration = 1 millisecond (because of `delay(1)`)
- `h_delay(400)` runs the loop **400 times** ≈ 400ms total
- If the button is pressed at iteration 328, it prints `"Button pressed at ms: 328"`

### Walkthrough Example — h_delay(400), button pressed at iteration 328

```
Iterations 0–327:   userIn = false → condition not met → nothing printed
Iteration 328:      userIn = true, user_prev = false → CONDITION MET → prints message
                    user_prev updated to true
Iterations 329–399: userIn = true, user_prev = true → condition NOT met → nothing more printed
```

> [!success] Result Only **one** message printed per press, at the exact millisecond it happened.

---

## 3. Button as a Toggle Switch

> [!info] Concept A `bool` variable holds the LED state. Each rising edge **flips** the state. The LED stays on or off until the next press.

```cpp
bool userIn;
bool user_prev = false;
bool led_on = false;     // holds the saved LED state

void h_delay(int time) {
  for (int c = 0; c < time; c++) {
    delay(1);
    userIn = digitalRead(2);

    if (userIn == HIGH && user_prev == LOW) {
      led_on = !led_on;    // toggle: true→false or false→true

      if (led_on == true) {
        Serial.println("LED is now ON");
      } else {
        Serial.println("LED is now OFF");
      }

      delay(50);           // debounce delay
    }
    user_prev = userIn;
  }

  // Apply the saved state to the physical LED
  if (led_on == true) {
    digitalWrite(3, HIGH);
  } else {
    digitalWrite(3, LOW);
  }
}
```

### Key concepts

**Toggling**

```cpp
led_on = !led_on;
// false → true (LED turns on)
// true  → false (LED turns off)
```

**Debouncing**

```cpp
delay(50); // after detecting a press, ignore 50ms of noise
```

Mechanical buttons "bounce" — they rapidly open and close for a few milliseconds when pressed. Without debouncing, one press can register as many presses.

**State retention** — `led_on` keeps its value between calls to `h_delay()`, so the LED stays in whatever state it was last set to.

---

## 4. Using millis() for Timing

> [!info] What is millis()? `millis()` returns the number of **milliseconds since the Arduino started**. It runs in the background and never pauses your code.

### delay() vs millis()

||`delay()`|`millis()`|
|---|---|---|
|Pauses code?|✅ Yes — everything stops|❌ No — code keeps running|
|Good for|Simple fixed waits|Measuring durations, non-blocking timing|
|Button checks during wait?|❌ Missed|✅ Possible|

### Why use `unsigned long` instead of `int`?

```cpp
unsigned long pressStart = 0;
unsigned long pressDuration = 0;
```

|Type|Max value|Max time before overflow|
|---|---|---|
|`int`|32,767|~32 seconds|
|`unsigned long`|4,294,967,295|~49 days|

> [!warning] `millis()` returns large values quickly. Using `int` causes overflow bugs after just 32 seconds.

### Measuring how long a button is held

```cpp
unsigned long pressStart = 0;
unsigned long pressDuration = 0;

// Inside h_delay loop:

// Rising edge → save start time
if (userIn == HIGH && user_prev == LOW) {
  pressStart = millis();
}

// Falling edge → calculate duration
else if (userIn == LOW && user_prev == HIGH) {
  pressDuration = millis() - pressStart;
  Serial.print("Button held for: ");
  Serial.print(pressDuration / 1000.0);  // convert ms → seconds
  Serial.println(" seconds");
}
```

> [!tip] `pressDuration / 1000.0` — the `.0` forces **decimal division**. e.g. 1500ms ÷ 1000.0 = `1.5 seconds` (without it you'd get `1`)

---

## 5. Loops and Conditions

### for loop — used in h_delay

```cpp
for (int c = 0; c < time; c++) {
  // runs 'time' times
  // c goes: 0, 1, 2, ... time-1
}
```

### if / else if / else

```cpp
if (userIn == HIGH) {
  count++;                      // button held → count up
} else if (userIn == LOW && user_prev == HIGH) {
  Serial.println(count);        // released → print total
  count = 0;                    // reset
} else {
  // default — button not pressed, nothing to do
}
```

### void setup() and void loop()

```cpp
void setup() {
  // runs ONCE at startup
  pinMode(2, INPUT);    // set pin 2 as input (button)
  pinMode(3, OUTPUT);   // set pin 3 as output (LED)
  Serial.begin(9600);   // start serial monitor
}

void loop() {
  // runs FOREVER — Arduino's built-in infinite loop
}
```

### Custom functions

```cpp
void h_delay(int time) {
  // 'void' means no return value
  // 'int time' is the parameter (input)
  // called like: h_delay(400);
}
```

---

## 6. Quick Reference — All Patterns

### Count up while held, reset on release (3.4)

```cpp
if (userIn == HIGH) {
  count++;
  Serial.println(count);
} else {
  count = 0;
}
```

### Count up while held, print total on release (3.6.1)

```cpp
if (userIn == HIGH) {
  count++;
} else if (userIn == false && user_prev == true) {
  Serial.println(count);   // print on release
  count = 0;
}
user_prev = userIn;
```

### Variable delay time (3.5)

```cpp
int dt = 50;  // dt = delay time — change this one variable to adjust speed
h_delay(dt);
```

### 3.7 — Hold N seconds → flash N times (combining everything)

```
Logic:
1. Measure how long the button is held using millis() (from 3.6.2)
2. On release, calculate: int flashes = pressDuration / 1000
3. Use a for loop to flash the LED 'flashes' times
```

```cpp
// On release:
else if (userIn == LOW && user_prev == HIGH) {
  pressDuration = millis() - pressStart;
  int flashes = pressDuration / 1000;  // 4000ms → 4 flashes

  for (int i = 0; i < flashes; i++) {
    digitalWrite(3, HIGH);
    delay(300);
    digitalWrite(3, LOW);
    delay(300);
  }
}
```

---

> [!summary] The Big Picture All these exercises build on one idea: **the Arduino's `loop()` runs continuously**, so every technique is about _when_ in that loop you check the button, and _what state you remember_ between checks. Rising/falling edge detection, `h_delay()`, `millis()`, and toggle variables are all solutions to that core challenge.