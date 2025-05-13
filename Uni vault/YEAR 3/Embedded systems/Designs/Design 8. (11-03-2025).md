# 8.1 Generating random numbers 
### **Circuit link**

https://www.tinkercad.com/things/0OzbR6ZOkqN-design-81
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
#### Purpose of randomSeed and randVal

- **randomSeed**:
    - Ensures the random() function generates a different sequence of numbers each time the Arduino runs.
    - By using an analog reading from A5 (which is noisy if unconnected), the seed is unpredictable, mimicking true randomness.
    - If you omitted randomSeed or used a fixed seed (e.g., randomSeed(42)), the random sequence would be identical every time the Arduino restarts.
- **randVal**:
    - Serves dual purposes:
        1. Captures the initial noisy analog reading to seed the random number generator.
        2. Stores the random numbers generated in the loop for printing.
    - Its value changes from the initial analog reading (0–1023) in setup() to a random number (0–19) in loop().

----
# 8.2 LED flashing in a random fashion

### **Circuit link**

https://www.tinkercad.com/things/0YLCV267Irc-design-82

### **Code**

```C++
// C++ code
//

long randVal;
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
  
  delay(400);
}
```

-----
# 8.3 fill up array with 10 values

### **Circuit 
https://www.tinkercad.com/things/c6xtDkaG0QY-design-83

### **Code**

```c++
// C++ code
//

long randVal;
int intArray[10];
void setup()
{
  pinMode(3, INPUT);
   pinMode(6, INPUT);
   pinMode(3, INPUT);
  pinMode(A5, INPUT);
  Serial.begin(2000000);
   randVal = analogRead(A5);
  randomSeed(randVal);
  
    
}

void loop()
{
  
  fillArrayWithRandom();
  printArray();
  delay(400);
}

void fillArrayWithRandom(){
int index;
  //Serial.println(sizeof(intArray)/2);// 
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

### **Notes**

- In arduino when using the `sizeof()` function you will get the size but it will be in bytes 

| Type            | Size (Bytes) | Bit Width | Signed Range                    |
| --------------- | ------------ | --------- | ------------------------------- |
| `bool`          | 1            | 8         | `false` (0) or `true` (1)       |
| `char`          | 1            | 8         | –128 to 127                     |
| `unsigned char` | 1            | 8         | 0 to 255                        |
| `int`           | 2            | 16        | –32,768 to 32,767               |
| `unsigned int`  | 2            | 16        | 0 to 65,535                     |
| `long`          | 4            | 32        | –2,147,483,648 to 2,147,483,647 |
| `unsigned long` | 4            | 32        | 0 to 4,294,967,295              |
| `float`         | 4            | 32        | ~±3.4×10⁺³⁸, 6–7 decimal digits |
- So inorder for us to get the length of  the array or how many variables when using int we must divide by 2
	`sizeof(intArray)/2`



| Loop | Function              | Action                                        | Range (Index) | Value Range              |
| ---- | --------------------- | --------------------------------------------- | ------------- | ------------------------ |
| 1    | `fillArrayWithRandom` | Fills array with random numbers               | `0` to `9`    | `0`–`255`                |
| 2    | `printArray`          | Prints each index and value to Serial monitor | `0` to `9`    | (Displays stored values) |

Both loops run **10 times** (once for each array element). The first populates the array, and the second displays it.

----
# 8.4 Shift left info in array

### **Circuit link**

### **Code**


### **Notes**


---

# 8.5 Shift right info in array

### **Circuit link**

### **Code**

### **Notes**

---

# 8.6 begin index

### **Circuit link**

### **Code**

### **Notes**

---

# 8.7 Serial input

### **Circuit link**

### **Code**

### **Notes**

---


# 8.8 string to integer 

### **Circuit link**

### **Code**

### **Notes**

---

# 8.9 User choose starting point  

### **Circuit link**

### **Code**

### **Notes**

---
