# 8.1 Generating random numbers 

Here's your analysis in the requested format:

>[!KEY CONCEPT]
>
>RANDOM NUMBER GENERATION
>
>SEEDING

**Detailed Concept Breakdown:**

1. **RANDOM NUMBER GENERATION**
   - `random(20)` produces unpredictable values (0-19)
   - Used to create non-repeating patterns
   - Essential for simulations/variability

2. **SEEDING**
   - `randomSeed(randVal)` initializes the random sequence
   - `analogRead(A5)` provides unconnected pin noise for true randomness
   - Ensures different sequences on each power-up

**Key Program Behavior:**
- Generates a new random number every 400ms
- Uses analog pin noise for true randomness
- Outputs values to serial monitor at high baud rate
- Demonstrates basic entropy collection technique

All hardware-specific details excluded. Focus is on the random number generation principles.

# 8.2 LED flashing in a random fashion

https://www.tinkercad.com/things/0YLCV267Irc-design-82

```C++
  analogWrite(3,randVal);
```

# 8.3 fill up array with 10 values

https://www.tinkercad.com/things/c6xtDkaG0QY-design-83

```c++
// C++ code
//

long randVal;
int intArray[10];
void setup()
{
  pinMode(5, INPUT);
   pinMode(6, INPUT);
   pinMode(3, INPUT);
  pinMode(A5, INPUT);
  Serial.begin(2000000);
   randVal = analogRead(A5);
  randomSeed(randVal);
  
    
}

void loop()
{
 
  randVal = random(255);
  analogWrite(3,randVal);
  
    randVal = random(255);
  analogWrite(5,randVal);
  
    randVal = random(255);
  analogWrite(6,randVal);
  
  //Serial.println(randVal);
   
  delay(400);
  
  fillArrayWithRandom();
  printArray();
}



void fillArrayWithRandom(){
int index;
  //Serial.println(sizeof(intArray)/2);// divide by 2 because each v
  for(index = 0; index <(sizeof(intArray)/2); index++){
  intArray[index] = random(256);
  }
  
}

void printArray(){
int index;
  //Serial.println(sizeof(intArray/2));// divide by 2 because each v
  for(index = 0; index <(sizeof(intArray)/2); index++){
	Serial.print(index);
    Serial.print("]=");
    Serial.println(intArray[index]);
  }
  
}
```

>[!KEY CONCEPT]
>
>RANDOM NUMBER GENERATION
>
>ARRAY MANIPULATION
>
>FUNCTIONS
>
>ITERATION



**Detailed Concept Breakdown:**

1. **RANDOM NUMBER GENERATION**
   - `random(255)` generates values 0-254 for PWM
   - Used for both LED control and array filling
   - `randomSeed()` ensures true randomness from analog noise

2. **ARRAY MANIPULATION**
   - `intArray[10]` stores collection of random values
   - Size calculated using `sizeof()` operation
   - Values accessed/modified via index

3. **FUNCTIONS**
   - `fillArrayWithRandom()` encapsulates array population
   - `printArray()` handles serial output formatting
   - Demonstrates modular code organization

4. **ITERATION**
   - `for` loops process array elements sequentially
   - Used for both filling and printing array
   - Enables batch operations on data structures

**Key Program Behavior:**
- Generates random PWM signals for 3 LEDs
- Maintains separate random number array
- Uses functions for clean code organization
- Implements proper array size calculation
- Demonstrates serial debugging techniques

All hardware-specific implementation details remain excluded. Focus is on the programming concepts and data handling patterns. The array manipulation shows how to work with collections of values while maintaining clean code structure through functions.

# 8.4 shift left into array

