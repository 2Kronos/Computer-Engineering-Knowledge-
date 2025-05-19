
## Arduino Interrupts Explained

Interrupts in Arduino allow you to pause the normal execution of your program to handle time-sensitive events. When an interrupt occurs, the processor stops what it's doing, executes a special function called an Interrupt Service Routine (ISR), then returns to what it was doing before.

## Key Interrupt Functions

### 1. attachInterrupt()
Enables a hardware interrupt on a specific pin.

```cpp
attachInterrupt(digitalPinToInterrupt(pin), ISR, mode);
```

**Parameters:**
- `digitalPinToInterrupt(pin)`: Converts the pin number to the specific interrupt number
- `ISR`: The function to call when interrupt occurs (must be short and fast)
- `mode`: When the interrupt should trigger:
  - `LOW`: Trigger when pin is low
  - `CHANGE`: Trigger when pin value changes
  - `RISING`: Trigger when pin goes from low to high
  - `FALLING`: Trigger when pin goes from high to low

### 2. detachInterrupt()
Disables an interrupt.

```cpp
detachInterrupt(digitalPinToInterrupt(pin));
```

### 3. interrupts() and noInterrupts()
Enable/disable all interrupts globally.

```cpp
interrupts();    // Enable all interrupts
noInterrupts();  // Disable all interrupts
```



# 10. 1 Using the interrupt When you press the button the led must go on



# Circuit link

https://www.tinkercad.com/things/fX6nKlKbS4V-design-101
# Code

```

void setup() {

 attachInterrupt(0, function_1, RISING);//this will sp
//ecify will go high 
pinMode(13, OUTPUT); 
Serial.begin(9600);
pinMode(4, OUTPUT);
}

void loop() {
       
digitalWrite(LED_BUILTIN, HIGH);
delay(1000);
digitalWrite(LED_BUILTIN, LOW);
delay(1000);

  }
  
  void function_1(){
  Serial.println("Button 1 pressed");
    digitalWrite(4, HIGH);
  }
```

# Notes

- Since its Rising it will go from a 1 to a zero 
```C++
 attachInterrupt(0, function_1, RISING);//this 
```

- The function in the code will always be looking for call thats why it not being called 

## Purpose of Pulsing the LED

The pulsing LED in the `loop()` serves two main purposes:

1. **Visual Heartbeat Indicator**:
    
    - The blinking LED (1 second on, 1 second off) shows that the main program is running normally
        
    - If the LED stops blinking, you know the program has frozen or crashed
        
    - This is a common debugging technique called a "heartbeat" indicator
        
2. **Demonstrate Interrupt Independence**:
    
    - The LED blinking continues uninterrupted even when the ISR (`function_1`) runs
        
    - This visually proves that interrupts don't block the main loop execution
        
    - The `delay()` calls in the loop don't affect the interrupt responsiveness

# 10.2 Switch the second LED

# Circuit link

https://www.tinkercad.com/things/jPvIGZR9bDR-design-102

# Code

```C++
bool previousOn;
void setup() {

 attachInterrupt(0, function_1, RISING);//this will sp
 attachInterrupt(1, swithOffLED, RISING);//this will sp
//ecify will go high 
pinMode(13, OUTPUT); 
Serial.begin(9600);
pinMode(4, OUTPUT);
}

void loop() {
       
digitalWrite(LED_BUILTIN, HIGH);
delay(1000);
digitalWrite(LED_BUILTIN, LOW);
delay(1000);

  }
  
  void function_1(){
    
 previousOn = !previousOn;
    digitalWrite(4, previousOn);
    Serial.println("Button 1 pressed");
  }

void swithOffLED(){
   digitalWrite(4, LOW);
   Serial.println("Button 2 pressed");
}
```

# Notes

## Interrupt Numbers vs. Pin Numbers

### On Arduino UNO (and most ATmega328P boards):

- **Interrupt 0** is **hardwired to Digital Pin 2**
    
- **Interrupt 1** is **hardwired to Digital Pin 3**
    

This is a hardware mapping in the microcontroller itself - it's not something you define in code.

## Rising Edge Detection

The rising edge detection happens in hardware when you use:


```C++
attachInterrupt(0, function_1, RISING);
// or
attachInterrupt(digitalPinToInterrupt(2), function_1, RISING);
```

### How the Hardware Detects Rising Edge:

1. The microcontroller constantly monitors the voltage on pins 2 and 3
    
2. When voltage transitions:
    
    - From LOW (≤ 1.5V) to HIGH (≥ 3V)
        
    - At the exact moment this transition completes → hardware interrupt triggers
        
3. The processor then:
    
    - Immediately pauses your main program
        
    - Jumps to your ISR (Interrupt Service Routine)
        
    - Executes that code
        
    - Returns to where it left off
        

## Your Specific Code Explanation

Your code uses two forms of the same thing:

### Option 1 (Using interrupt numbers directly):

```C++
attachInterrupt(0, function_1, RISING);  // Pin 2
attachInterrupt(1, swithOffLED, RISING); // Pin 3
```

### Option 2 (More readable, recommended):

```
attachInterrupt(0, function_1, RISING);  // Pin 2
attachInterrupt(1, swithOffLED, RISING); // Pin 3
```

Both do exactly the same thing, but Option 2 is clearer because:

- Shows which physical pin you're using
    
- Works across different Arduino boards where interrupt numbers might differ
    
- Makes your code more maintainable
    

## Why You Don't See Explicit Edge Detection Code

The actual edge detection happens in hardware - you don't write code to check for it. The `RISING` parameter in `attachInterrupt()` configures the hardware to:

# 10.3 Boolean counting

# Circuit link

# Code

# Notes

- When the first led goes on and then off the otherone must change state 
- We will use an array for all the led we will use 
# 10.4 Add another led 

# Circuit link

# Code

# Notes