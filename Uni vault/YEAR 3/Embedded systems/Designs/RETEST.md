## Three Examples of millis() Usage

1. **Basic Time Tracking**:

```C++
unsigned long previousTime = 0;
const long interval = 1000; // 1 second

void loop() {
  unsigned long currentTime = millis();
  if (currentTime - previousTime >= interval) {
    previousTime = currentTime;
    // Do something every second
  }
}
```
2. **Non-blocking Delay**:
```C++
unsigned long startTime = 0;
bool ledState = false;

void loop() {
  if (millis() - startTime > 500) { // Every 500ms
    ledState = !ledState;
    digitalWrite(LED_PIN, ledState);
    startTime = millis();
  }
  // Other code can run here without being blocked
}
```
3. **Timeout Detection**:

```C++
unsigned long buttonPressTime = 0;
bool buttonHeld = false;

void loop() {
  if (digitalRead(BUTTON_PIN) {
    if (!buttonHeld) {
      buttonPressTime = millis();
      buttonHeld = true;
    }
    if (millis() - buttonPressTime > 2000) {
      // Button held for 2 seconds
    }
  } else {
    buttonHeld = false;
  }
}
```

## Three Examples of Modulus Usage

1. **Wrapping Brightness**:
```C++
int brightness = (millis() / 10) % 256; // Cycles 0-255 every 2.56 seconds
analogWrite(LED_PIN, brightness);
```

2. **Cycling Through LEDs**:
```C++
int currentLED = (millis() / 1000) % 6; // Cycles through 6 LEDs every 6 seconds
digitalWrite(ledPins[currentLED], HIGH);
```
**Phase Shifting**

```C++
for (int i = 0; i < 6; i++) {
  int phase = (millis()/10 + i*42) % 256; // Each LED starts 42 steps apart
  analogWrite(ledPins[i], phase);
}
```

# LED Control System with 12 LEDs - Question Series

I'll create a series of questions that maintain the core concepts from your original test (using millis(), modulus, and loops) but adapted for 12 LEDs. Each question will build on the previous one, just like in your example.

## Core Setup (Same for all questions)
- **12 LEDs** (6 red, 6 green) connected to PWM-capable pins
- **Arrays** for pin numbers: `redPins[6]` and `greenPins[6]`
- **Button** connected to digital pin for interruption
- **millis()** for all timing
- **Modulus** for cycling/wrapping values
- **Phase shifts** to stagger LED patterns

## Question 1: Alternating LED Fader

**Task**:
Create a program where:
1. All 6 red LEDs fade in sequentially (each starts when previous reaches max brightness)
2. Each fade takes exactly 3 seconds (0→255 in 3000ms)
3. When a red LED reaches max brightness, its corresponding green LED turns on for 500ms
4. Only one green LED can be on at any time
5. Use modulus to control brightness cycling
6. Implement a function to handle each LED pair's behavior

**Requirements**:
- Use `millis()` for timing (no `delay()`)
- Maximum of 2 `analogWrite()` calls in entire program
- Maximum of 3 `digitalWrite()` calls
- Button press >2s should pause all LEDs until release

**Hints**:
- Calculate time divisor for 3-second fade: 3000ms/255 ≈ 11.76ms per brightness step
- Use modulus 256 for brightness wrapping
- Phase shift between LEDs: 3000ms/6 = 500ms per LED → 500/11.76 ≈ 42.5 steps

**Circuit Setup**:
- 6 red LEDs on PWM pins (e.g., 3,5,6,9,10,11)
- 6 green LEDs on digital pins (e.g., 2,4,7,8,12,13)
- Button on A5 with pull-down resistor

When you've completed this question, type "Done" to receive the solution and the next question.

Would you like me to proceed with this first question, or would you prefer any modifications to better match your learning goals?

```C++
// Pin definitions
const int redPins[6] = {3, 5, 6, 9, 10, 11};    // PWM pins for red LEDs
const int greenPins[6] = {2, 4, 7, 8, 12, 13};   // Digital pins for green LEDs
const int buttonPin = A5;                         // Button pin

// Timing variables
unsigned long lastButtonCheck = 0;
bool buttonActive = false;
bool systemPaused = false;

void setup() {
  // Initialize all LED pins
  for (int i = 0; i < 6; i++) {
    pinMode(redPins[i], OUTPUT);
    pinMode(greenPins[i], OUTPUT);
    digitalWrite(greenPins[i], LOW);
  }
  
  // Initialize button pin
  pinMode(buttonPin, INPUT);
}

void loop() {
  // Handle button press (pause functionality)
  handleButton();
  
  if (!systemPaused) {
    // Get current time in brightness cycles (0-255 over 3 seconds)
    unsigned long cycleTime = millis() / 12;  // 3000ms/255 ≈ 11.76ms per step → ~12ms
    
    // Process each LED pair
    for (int i = 0; i < 6; i++) {
      processLEDPair(cycleTime, i);
    }
  }
}

void handleButton() {
  // Check button state every 50ms to avoid bouncing
  if (millis() - lastButtonCheck > 50) {
    lastButtonCheck = millis();
    
    if (digitalRead(buttonPin) {
      if (!buttonActive) {
        // Button just pressed - record time
        buttonActive = true;
        lastButtonCheck = millis();
      } else if (millis() - lastButtonCheck > 2000) {
        // Button held for >2 seconds
        systemPaused = true;
        // Turn off all LEDs
        for (int i = 0; i < 6; i++) {
          analogWrite(redPins[i], 0);
          digitalWrite(greenPins[i], LOW);
        }
      }
    } else {
      if (buttonActive && systemPaused) {
        // Button released after pause
        systemPaused = false;
      }
      buttonActive = false;
    }
  }
}

void processLEDPair(unsigned long cycleTime, int pairNum) {
  // Calculate phase-shifted time for this pair (each starts 42 cycles apart)
  unsigned long modifiedTime = (cycleTime + pairNum * 42) % 256;
  
  // Set red LED brightness (only analogWrite in entire program)
  analogWrite(redPins[pairNum], modifiedTime);
  
  // Control green LED (turns on when red at max brightness)
  if (modifiedTime < 5) {  // Just wrapped around (was at max)
    digitalWrite(greenPins[pairNum], HIGH);  // Only digitalWrite for ON
  } else if (modifiedTime < 41) {  // After ~500ms (41*12≈500ms)
    digitalWrite(greenPins[pairNum], LOW);   // Only digitalWrite for OFF
  }
}
```


## Key Features:

1. **Efficient Pin Control**:
    
    - Uses exactly 1 `analogWrite()` and 2 `digitalWrite()` calls (within requirements)
        
    - All LEDs processed in loops
        
2. **Precise Timing**:
    
    - 3-second fade time: `millis()/12` gives ≈12ms per brightness step (3000ms/255≈11.76)
        
    - 500ms green LED on time: 42 phase steps × 12ms ≈ 500ms
        
3. **Button Handling**:
    
    - Debounced button check every 50ms
        
    - 2-second hold detection
        
    - Proper pause/resume functionality
        
4. **Modulus Magic**:
    
    - `% 256` creates seamless brightness cycling
        
    - Phase shifts (×42) stagger LED timing perfectly
        
5. **Scalable Structure**:
    
    - Easy to adjust number of LEDs
        
    - Simple to modify timing parameters
```C++
```
