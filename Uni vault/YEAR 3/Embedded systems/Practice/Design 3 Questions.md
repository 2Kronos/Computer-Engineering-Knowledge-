

### Practice Question 1: The Reliable Press (Easy)

**Concept Focus:** Creating a basic function, button debouncing, `if` statements.

You have learned that mechanical buttons "bounce," causing multiple false readings. In Design 3.4, the counter increased rapidly because it counted every bounce.

**Task:**
Create a function called `bool isButtonPressed(int pin)` that reads the state of a button on pin 2. This function should return `true` only if the button is pressed and it has been at least 50 milliseconds since the last press (a simple debounce). In your `loop()`, call this function. If it returns `true`, print "Reliable Press Detected" to the Serial Monitor and toggle the built-in LED on pin 13 on or off. The LED should stay in its new state until the next reliable press.

**Hint:** You will need to remember the time of the last valid press. You might use a `static` variable inside the function, or a global variable like `unsigned long lastPressTime = 0;`.

---

### Practice Question 2: The Blinking Beacon (Easy/Medium)

**Concept Focus:** `for` loops, creating a function with a parameter, `digitalWrite()`.

In Design 3.5, you made an LED flash faster by changing a variable. Now, let's use a function to create a specific flashing pattern.

**Task:**
Write a function called `void flashLED(int pin, int numberOfFlashes)` that takes an LED pin number and the number of times to flash as input. The function should:
1.  Turn the LED on for 200ms.
2.  Turn the LED off for 200ms.
3.  Repeat steps 1 and 2 for `numberOfFlashes` times.
4.  After the loop finishes, ensure the LED is off.

In your `loop()`, read a button on pin 2. Every time the button is **pressed and released** (just once), call the `flashLED` function to make an LED on pin 13 flash **5 times**.

**Hint:** You will need a method to detect the "release" of the button, similar to what was shown in Design 3.6.1. The `flashLED` function should contain the `for` loop that controls the flashing.

---

### Practice Question 3: The Long Press Loop (Medium)

**Concept Focus:** `while` loops, `millis()` for timing, button states.

Design 3.7 introduced the idea of an action being tied to how long a button is held. Let's expand on that.

**Task:**
- A button is connected to pin 2.
- An LED is connected to pin 13.
- Write code so that when you **press and hold** the button, the LED flashes rapidly (100ms on, 100ms off) for the entire time the button is held down.
- The moment you **release** the button, the flashing stops and the LED turns off.
- Print "Held for: X seconds" to the Serial Monitor when the button is released, where X is the duration it was held down (in seconds, with one decimal place, e.g., "2.5 seconds").

**Hint:**
- Use a `while` loop in your main `loop()`. The condition for the `while` loop should be `digitalRead(buttonPin) == HIGH`.
- Inside the `while` loop, you can flash the LED.
- You'll need to record the time the button press started (`millis()`) before entering the `while` loop, and calculate the duration after the `while` loop finishes.

---

### Practice Question 4: The Operator Counter (Medium)

**Concept Focus:** Compound operators (`++`, `--`), modulus operator (`%`), functions with return values.

You've used `count++` to increment. Now let's use other operators to create a state machine.

**Task:**
- You have two buttons: one on pin 2 (Button A) and one on pin 3 (Button B).
- You have an LED on pin 13.
- Create a function called `int updateMode(int currentMode, int buttonAState, int buttonBState)` that takes the current mode and the states of both buttons, and returns a new mode number based on the following rules:
    - A **single press** of Button A should increment the mode by 1 (using `++`).
    - A **single press** of Button B should decrement the mode by 1 (using `--`).
    - The mode should always be a number between 0 and 3. If it goes above 3, it should wrap around to 0. If it goes below 0, it should wrap around to 3. (Hint: Use the `%` operator to help with this).
- In your `loop()`, manage the button states to detect single presses. Call the `updateMode` function when a button press is detected.
- Print the current mode to the Serial Monitor whenever it changes.
- Make the LED blink in a pattern that corresponds to the mode:
    - Mode 0: LED off.
    - Mode 1: Blink once per second (500ms on, 500ms off).
    - Mode 2: Blink twice per second (250ms on, 250ms off).
    - Mode 3: Blink four times per second (125ms on, 125ms off).

---

### Practice Question 5: The Function Composer (Medium)

**Concept Focus:** Combining multiple custom functions, passing variables between functions, boolean logic.

Let's bring several concepts together.

**Task:**
- A button is connected to pin 2.
- An LED is connected to pin 9 (a PWM pin for dimming).
- You will create two helper functions and one main action function.

1.  **Function 1:** `bool isLongPress(int pin, unsigned long duration)`
    - This function should wait for a button press on the given pin. It should return `true` if the button is held down for at least `duration` milliseconds, and `false` if it is released before that time. (It should only return after the button is released).

2.  **Function 2:** `int mapPressTimeToBrightness(int pin)`
    - This function should call `isLongPress(pin, 2000)`.
    - If `isLongPress` returns `true` (button held for 2+ seconds), this function should return a brightness value of `255` (full brightness).
    - If `isLongPress` returns `false` (short press), this function should measure the actual time the button was held (in milliseconds) and map that time to a brightness value between 0 and 255. For example, a press of 100ms could be a brightness of 12, and a press of 1900ms could be a brightness of 242. (You can use the `map()` function for this).

3.  **In your `loop()`:**
    - Wait for a button press.
    - Call `mapPressTimeToBrightness(2)` and store the result in a variable called `brightness`.
    - Use `analogWrite(9, brightness)` to set the LED to that brightness.
    - Print the brightness value to the Serial Monitor.
    - The LED should stay at that brightness until the next button press changes it.

**Hint:** For `isLongPress`, you'll need a `while` loop that constantly checks the button state and `millis()`. If the button is released before the target duration, you can return `false` immediately after doing some math. If the duration is met, you can wait for the release and then return `true`.