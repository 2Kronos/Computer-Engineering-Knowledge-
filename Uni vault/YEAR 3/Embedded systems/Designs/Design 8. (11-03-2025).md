# 8.1 Generating random numbers 
### **Circuit link**

### **Code**

```C++
// C++ code
//

long randVal;
void setup()
{
  pinMode(A5, INPUT);
  Serial.begin(2000000);
   randVal = analogRead(A5);
  randomSeed(randVal);
  
    
}

void loop()
{
  randVal = random(20);
  Serial.println(randVal);
  delay(400);	
}
```

### **Notes**

##### Key Variables and Functions

- **randVal**: A long variable used to:
    1. Store the initial analog reading from pin A5 to seed the random number generator.
    2. Store the random numbers generated in the loop function.
- **randomSeed(randVal)**: 
	- Initializes the random number generator with a seed value to ensure the sequence of random numbers isn’t the same every time the Arduino restarts.
- **random(20)**: Generates a pseudo-random number between 0 and 19 (inclusive).

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

