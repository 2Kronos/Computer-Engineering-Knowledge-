


## Practice Question 1: Rainbow Fade (Easy)

**Concept Focus:** Arrays, `analogWrite()`, PWM pins, single for loop

You've learned that `analogWrite()` takes values from 0–255 on PWM pins (3, 5, 6, 9, 10, 11).

**Circuit Layout:**

- Connect 3 LEDs (Red, Green, Blue) to PWM pins **3, 5, 6** respectively
- Each LED needs a **220Ω resistor** in series to GND
- That's it — 3 LEDs, 3 resistors

**Task:** Create an array `int PN[] = {3, 5, 6}` for your 3 LEDs. Write a loop that fades **each LED in one at a time** (0→255), but **never fades them out** — once an LED reaches full brightness it stays on while the next one fades in. After all 3 are fully bright, turn them all off at once and repeat.

**Hint:** You'll need one outer loop for each LED, one inner loop for the brightness fade, and `digitalWrite(pin, LOW)` to reset all at the end.

---

## Practice Question 2: Breathing LED (Medium)

**Concept Focus:** Nested loops, `brightness++` / `brightness--`, `delay()`, single pin

You've learned in 5.4 that you can fade up and then fade down using two separate for loops.

**Circuit Layout:**

- Just **1 LED** on PWM pin **9**
- **220Ω resistor** in series to GND
- Simple as it gets

**Task:** Make the LED "breathe" — fade from 0 to 255, then from 255 back to 0, **but** the fade-in must be **slow** (delay of 15ms) and the fade-out must be **fast** (delay of 3ms). It should feel like a slow inhale and a quick exhale. Use two separate for loops inside `loop()`.

**Hint:** Your two for loops will have different `delay()` values. You do not need an array for this one — just use `analogWrite(9, brightness)` directly.

---

## Practice Question 3: Ping-Pong Bounce (Medium)

**Concept Focus:** Functions (like 5.5.3), arrays, nested loops, forward and reverse direction

You've learned in 5.5.3 how to extract repeated code into a `void flash(int LED_NUM)` function to avoid duplication.

**Circuit Layout:**

- **6 LEDs** on PWM pins **3, 5, 6, 9, 10, 11**
- Each with a **220Ω resistor** to GND
- Line them up in a row on your breadboard so the bounce effect is visible

**Task:** Create a function called `void ping(int LED_NUM)` that fades a single LED **up to full brightness only** (0→255) and then **immediately turns it off** (`analogWrite(pin, 0)`). In `loop()`, call `ping()` forward across all 6 LEDs (0→5), then backward (5→0), creating a bouncing dot of light. Use `int DT = 5` for a snappy effect.

**Hint:** This is like 5.5.3 but your function only fades **up** — no fade down. The LED turns off sharply after reaching 255, making it look like a moving dot rather than a slow glow.

---

## Practice Question 4: Duelling LEDs with Serial Monitor (Medium-Hard)

**Concept Focus:** Serial Monitor output, opposite brightness, two pins, variables

You've learned in 5.6 how to use `brightness_1 = 255 - brightness` to keep two LEDs at opposite brightnesses, and how to use `Serial.print()` to display values.

**Circuit Layout:**

- **2 LEDs** — one Red on PWM pin **3**, one Green on PWM pin **5**
- Each with a **220Ω resistor** to GND
- Add `Serial.begin(9600)` in `setup()`

**Task:** Extend the 5.6 concept: fade LED 1 (Red) from 0→255 while LED 2 (Green) goes from 255→0 as before. **But add a third LED on pin 6** that always stays at the **average brightness** of the two (`average = (brightness + brightness_1) / 2`). Print all three values to the Serial Monitor on one line, separated by commas, like: `45,210,127`

**Hint:** Calculate `average` inside your for loop. Use `Serial.print()` for the first two values with a comma, and `Serial.println()` for the last one so each set of readings appears on its own line.

---

## Practice Question 5: LED Alarm Pulse (Hard)

**Concept Focus:** Custom functions, speed control, arrays, combining concepts from 5.4 and 5.5.3

You've learned how to use functions to remove duplicate code (5.5.3) and how nested loops control multiple LEDs (5.4).

**Circuit Layout:**

- **4 LEDs** on PWM pins **3, 5, 6, 9**
- Each with a **220Ω resistor** to GND
- Line them up in a row

**Task:** Write a function `void alarm(int speed)` where `speed` is a delay time in milliseconds. This function must flash **all 4 LEDs at once** — fade them all up together (0→255) then all down together (255→0). In `loop()`, call `alarm()` **three times getting faster each time**: `alarm(15)`, then `alarm(7)`, then `alarm(2)` — simulating an alarm that speeds up. After the three pulses, pause for 1 second (`delay(1000)`) and repeat forever.

**Hint:** Inside `alarm()`, use one for loop for fade-up and one for fade-down. Each loop uses a nested inner loop to write to all 4 pins in `PN[]`. The `speed` parameter replaces `DT` as your delay value.
