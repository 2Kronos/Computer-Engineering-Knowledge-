
- We went through 3 different ways in which we can count in binary 
  
- It is also important to decide in which algorithm to choose when you decide to count 

### Counting in binary using the & method 


```C++
int count;
int andCount;
int toPower;
int pinNum;

void setup() {
 
  for (int pin = 7; pin >= 2; pin--) {
    pinMode(pin, OUTPUT);
  }
}

void loop()
{
  	
    for(count = 0; count < 16; count++) {
	pinNum =2;
      
        andCount = count & 1;
        if(andCount > 0){
          digitalWrite(pinNum, HIGH);
        }else{
        	digitalWrite(pinNum, LOW);
        }

		pinNum++;
         andCount = count & 2;
        if(andCount > 0){
          digitalWrite(pinNum, HIGH);
        }else{
        	digitalWrite(pinNum, LOW);
        }
      
      pinNum++;
         andCount = count & 4;
        if(andCount > 0){
          digitalWrite(pinNum, HIGH);
        }else{
        	digitalWrite(pinNum, LOW);
        }
      
      
      pinNum++;
         andCount = count & 8;
        if(andCount > 0){
          digitalWrite(pinNum, HIGH);
        }else{
        	digitalWrite(pinNum, LOW);
        }
      
      delay(500);
    }
}


```

-----
### Binary count using Using nested loops

- Here the most inner loop represent the LSB and the outermost loop corresponds to the MSB
- Look at the illustration for a better understanding 
```C++
int count;
int andCount;
int toPower;
int pinNum;
int inner;
int oneCount, twoCount, threeCount, fourCount;

void setup() {
  pinMode(13, INPUT);
  Serial.begin(9600);
  for (int pin = 7; pin >= 2; pin--) {
    pinMode(pin, OUTPUT);
  }
}

void loop()
{
    for(threeCount = 0; threeCount < 2; threeCount++) {
        digitalWrite(4, threeCount);
        for(twoCount = 0; twoCount < 2; twoCount++) {
            digitalWrite(3, twoCount);
            for(oneCount = 0; oneCount < 2; oneCount++) {
                digitalWrite(2, oneCount);
                delay(400);
            }
        }
    }
}
```

---

### Binary count using recursion

```
int count;
int andCount;
int toPower;
int pinNum;
int inner;
int oneCount, twoCount, threeCount, fourCount;

void setup() {
  pinMode(13, INPUT);
  Serial.begin(9600);
  for (int pin = 7; pin >= 2; pin--) {
    pinMode(pin, OUTPUT);
  }
}

void loop()
{
recursion_1(2);
}

void recursion_1(int pinNum) {
    int twoCount;
    for(twoCount = 0; twoCount < 2; twoCount++) {
        digitalWrite(pinNum, twoCount);
        if(pinNum < 4) {
            recursion_1(pinNum + 1);
        } else {
            delay(1000);
        }
    }
}
```