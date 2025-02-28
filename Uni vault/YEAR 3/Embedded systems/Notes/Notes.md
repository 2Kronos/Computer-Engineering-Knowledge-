
- Course available at [Arduino Course for Beginners - Open-Source Electronics Platform - YouTube](https://www.youtube.com/watch?v=zJ-LqeX_fLU&t=4934s)
# Basic syntax 

```C
// C++ code
//
void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop()
{
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1000); // Wait for 1000 millisecond(s)
  digitalWrite(LED_BUILTIN, LOW);
  delay(1000); // Wait for 1000 millisecond(s)
}
```
- `PinMode`: This configures the specified pin to act as input or an output 
	- Built in fucntion which has two arguments firts is pin number, second the configuration we want it to act as 
- `void setup()`: We want this to run once while setting up theArduino 
-  Arduino language is case sensitive 
- `void loop`
	- `digitalWrite` is used to manipulate the pins(Including analog pins )
	- `delay()` nothing happens the state is preserved 

## Variables 
- We can use variable instead which are declared on top
- This will be easier to chnage the pins later 
- We use camelCase for our variables
```c++
int myDelayValue = 700
int ledPin = 13

Void loop(){
 digitalWrite(ledpin, HIGH);
 delay(myDelayValue);
}
```

<u> Functions </u>

1. `Serial.begin(9600)`: Enables the serial communication between arduino and computer 
2. `Serial.print()`: Used to print
3. `Serial.println()`: Used to pint with a newline
## Data type of variables used in Arduino

### Basic Data Types**

- **`void`**: Indicates a function returns no value.
- **`bool`**: Stores a `true` or `false` value.
- **`char`**: Stores a single character (1 byte, typically -128 to 127 for signed, 0 to 255 for unsigned).
- **`byte`**: Stores an unsigned 8-bit number (0 to 255).
- **`int`**: Stores a signed 16-bit integer (-32,768 to 32,767).
- **`unsigned int`**: Stores an unsigned 16-bit integer (0 to 65,535).
- **`long`**: Stores a signed 32-bit integer (-2,147,483,648 to 2,147,483,647).
- **`unsigned long`**: Stores an unsigned 32-bit integer (0 to 4,294,967,295).
- **`float`**: Stores a 32-bit floating-point number (~6-7 decimal places of precision).
- **`double`**: Treated the same as `float` on the Arduino Uno (32-bit).

### **Advanced Types**

- **`word`**: Stores a 16-bit unsigned number (0 to 65,535).
- **`String`**: Stores strings using dynamic memory allocation (easier but less efficient).
- **`char[]`**: Stores strings as null-terminated character arrays (manual memory control).

### **Specialized Types**

- **`size_t`**: Used for sizes and array indexing, typically unsigned.
- **`boolean`**: Alias for `bool`, used for backward compatibility.

### **Other**

- **`enum`**: Allows you to create enumerated constants.
- **`struct`**: Used to group related variables of different types into one.


---

### **What Are Variables?**

- Variables are containers used to store data.
- They must have a **type** (e.g., `int`, `float`, `bool`) that defines the kind of data they can store.
- Variables are given a **name** to identify them.

#### **Types of Variables in Arduino**

1. **Global Variables**:
    
    - Declared outside any function.
    - Accessible from any part of the code.
2. **Local Variables**:
    
    - Declared inside a function.
    - Only accessible within that function.

---

### **What Are Functions?**

- Functions are reusable blocks of code that perform a specific task.
- In Arduino, every program must have two main functions:
    1. **`setup()`**: Runs once when the board powers up or resets. Used to initialize settings.
    2. **`loop()`**: Repeats forever after `setup()`. It contains the main code to be executed.

---

### **Examples of Variables and Functions in Arduino**

#### **Example 1: Using Variables**

```cpp
int ledPin = 13;   // Global variable to store the pin number for the LED
bool ledState = false; // Global variable to store LED's state (on/off)

void setup() {
  pinMode(ledPin, OUTPUT); // Set pin 13 as an OUTPUT
}

void loop() {
  ledState = !ledState;  // Toggle the LED state
  digitalWrite(ledPin, ledState); // Turn the LED ON or OFF
  delay(1000); // Wait for 1 second
}
```

**Explanation**:

- **`int ledPin = 13;`**: Stores the pin number where the LED is connected.
- **`bool ledState`**: Tracks if the LED is ON (`true`) or OFF (`false`).
- The `setup()` function initializes the pin.
- The `loop()` function toggles the LED ON/OFF repeatedly.

---

#### **Example 2: Writing Your Own Function**

```cpp
int buttonPin = 2;   // Button connected to pin 2
int ledPin = 13;     // LED connected to pin 13

void setup() {
  pinMode(buttonPin, INPUT);   // Set button pin as INPUT
  pinMode(ledPin, OUTPUT);     // Set LED pin as OUTPUT
}

void loop() {
  if (isButtonPressed()) {   // Call the custom function
    digitalWrite(ledPin, HIGH);  // Turn the LED ON
  } else {
    digitalWrite(ledPin, LOW);   // Turn the LED OFF
  }
}

// Custom function to check if the button is pressed
bool isButtonPressed() {
  return digitalRead(buttonPin) == HIGH; // Return true if button is pressed
}
```

**Explanation**:

- **Custom Function**: `bool isButtonPressed()` returns `true` if the button is pressed.
- `setup()` configures the pins.
- `loop()` checks the button state using the custom function and turns the LED ON or OFF.

---

#### **Example 3: Local and Global Variables**

```cpp
int globalCount = 0;  // Global variable to count button presses

void setup() {
  Serial.begin(9600); // Start serial communication
}

void loop() {
  int localVariable = 10; // Local variable inside loop()
  
  globalCount++;   // Increment the global variable
  Serial.print("Global Count: ");
  Serial.println(globalCount);

  Serial.print("Local Variable: ");
  Serial.println(localVariable);

  delay(1000); // Wait for 1 second
}
```

**Explanation**:

- **`globalCount`** is a global variable accessible anywhere.
- **`localVariable`** only exists inside the `loop()` function.

---

#### **Example 4: Passing Variables to Functions**

```cpp
int ledPin = 13;

void setup() {
  pinMode(ledPin, OUTPUT);
  blinkLED(ledPin, 3); // Call the function to blink the LED 3 times
}

void loop() {
  // Empty loop
}

// Function to blink an LED a given number of times
void blinkLED(int pin, int times) {
  for (int i = 0; i < times; i++) {
    digitalWrite(pin, HIGH); // Turn LED ON
    delay(500);              // Wait
    digitalWrite(pin, LOW);  // Turn LED OFF
    delay(500);              // Wait
  }
}
```

**Explanation**:

- The `blinkLED()` function takes two arguments: the pin number and the number of times to blink.
- It blinks the LED connected to `ledPin`.

---

### **Key Points to Remember**

- Variables store data; functions perform tasks.
- **`setup()`** and **`loop()`** are mandatory functions in Arduino programs.
- Global variables are accessible everywhere, but local variables exist only within the function where they are declared.
- Functions can take **arguments** (inputs) and **return values** (outputs).

Let me know if you'd like me to clarify or expand on anything!

