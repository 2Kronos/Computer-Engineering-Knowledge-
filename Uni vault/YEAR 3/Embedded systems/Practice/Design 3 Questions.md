

## Practice Question 1: Button Press Logger (Easy)

**Concept Focus:** `digitalRead()`, `if` statements, Serial Monitor, rising edge detection

You've learned in 3.2 that checking `userIn == true && user_prev == false` detects only the **moment** the button is pressed, not while it's held down.

**Circuit Layout:**

- **1 button** connected to pin **2** (one leg to pin 2, other leg to GND, use `INPUT_PULLUP` or a 10kΩ pull-down resistor to GND)
- **1 LED** on pin **13** (built-in LED is fine)
- No resistor needed for the built-in LED

**Task:** Using the rising edge detection method from 3.2, every time the button is pressed print a message to the Serial Monitor that includes a **press number** that counts up each time. For example: `"Press number: 1"`, `"Press number: 2"`, etc. The counter must never reset — it keeps climbing as long as the Arduino is running. Use `h_delay()` so the button is checked even during delays.

**Hint:** You'll need a global `int pressCount = 0` that increments each time a rising edge is detected. Increment it inside the `if (userIn == HIGH && user_prev == LOW)` block, then print it.

---

## Practice Question 2: Hold or Tap? (Easy-Medium)

**Concept Focus:** `millis()`, `unsigned long`, rising and falling edge detection, Serial Monitor

You've learned in 3.6.2 that `millis()` lets you measure how long a button is held without freezing the program like `delay()` does.

**Circuit Layout:**

- **1 button** on pin **2** with a 10kΩ pull-down resistor to GND
- **1 LED** on pin **13** (built-in)
- No extra components needed

**Task:** Measure how long the button is held. When the button is released (falling edge), check the duration:

- If held for **less than 500ms**, print `"Tap detected"` to the Serial Monitor
- If held for **500ms or more**, print `"Hold detected"` to the Serial Monitor

Use `millis()` to record `pressStart` on the rising edge and calculate `pressDuration` on the falling edge, exactly as shown in 3.6.2.

**Hint:** Your `else if (userIn == LOW && user_prev == HIGH)` block is where you calculate the duration and use an `if/else` to decide which message to print.

---

## Practice Question 3: Button Brightness Control (Medium)

**Concept Focus:** Toggle state, `led_on` pattern from 3.3, `analogWrite()`, PWM

You've learned in 3.3 how a button can toggle an LED on and off by saving state in a `bool led_on` variable. You've also learned that `analogWrite()` controls brightness on PWM pins.

**Circuit Layout:**

- **1 button** on pin **2** with a 10kΩ pull-down resistor to GND
- **3 LEDs** on PWM pins **9, 10, 11**
- Each LED needs a **220Ω resistor** in series to GND

**Task:** Each time the button is pressed (rising edge only), cycle through **4 brightness levels** for all 3 LEDs at the same time: `0`, `85`, `170`, `255` — then back to `0` on the next press. Print the current brightness level to the Serial Monitor on every press, like: `"Brightness: 85"`. Use `h_delay()` so button presses are never missed.

**Hint:** Use an `int` variable like `int stage = 0` that goes from 0 to 3 and resets to 0 after 3. Use an array `int levels[] = {0, 85, 170, 255}` and write `levels[stage]` to each pin.

---

## Practice Question 4: Reaction Timer (Medium-Hard)

**Concept Focus:** `millis()`, `unsigned long`, Serial Monitor, random LED, button timing

You've learned in 3.6.2 that `millis()` records timestamps accurately without stopping your program, and in 3.4 that the button state can be read continuously.

**Circuit Layout:**

- **1 button** on pin **2** with a 10kΩ pull-down resistor to GND
- **1 LED** on pin **13** (built-in is fine)
- Optional: add a second LED on pin **12** to signal "too slow"

**Task:** Build a simple reaction timer:

1. When the Arduino starts, wait a **random delay** between 2 and 5 seconds (`random(2000, 5000)`)
2. Turn the LED **on** — this is the signal to press the button
3. Record the time the LED turned on using `millis()`
4. When the button is pressed, record the time again and calculate the reaction time
5. Print to Serial Monitor: `"Reaction time: 1.243 seconds"` (converted from ms using `/ 1000.0`)
6. Turn the LED off and repeat from step 1

**Hint:** Use `unsigned long ledOnTime` and `unsigned long reactionTime`. You do not need `h_delay()` here — use a simple `while (digitalRead(2) == LOW)` loop to wait for the button press after the LED turns on.

---

## Practice Question 5: Morse Code Dot-Dash Detector (Hard)

**Concept Focus:** `millis()`, falling edge, duration thresholds, Serial Monitor, combining 3.6.1 and 3.6.2

You've learned in 3.6.1 that a falling edge (`userIn == LOW && user_prev == HIGH`) means the button was just released, and in 3.6.2 that `millis()` gives you the exact duration of a press.

**Circuit Layout:**

- **1 button** on pin **2** with a 10kΩ pull-down resistor to GND
- **1 LED** on pin **13** — it must light up **while the button is held** and turn off when released
- That's all — keep it simple

**Task:** When the button is pressed, the LED on pin 13 turns on immediately. When the button is released (falling edge), measure how long it was held:

- If held for **less than 400ms** → print `"."` (dot)
- If held for **400ms or more** → print `"-"` (dash)

After **5 button presses**, print `"--- End of sequence ---"` on a new line and reset the press counter back to 0 so a new sequence can begin.

**Hint:** Use `unsigned long pressStart` set on the rising edge, and calculate `millis() - pressStart` on the falling edge. Use a global `int pressCount` to track how many presses have happened in the current sequence.