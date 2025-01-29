# 1.1

![[Pasted image 20250129014119.png]]
## Code 

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

- Set up can be seen as the reboot function
- Once the set up is done it will go into the loop
- If we dont have the delay we will not be able to see the LED flashing 


--- 

```
 pinMode(13, OUTPUT);
```

- Here we will make pin 13 an output in the code which is the same as the `LED_BUILTIN` so know change will occur 
- So when it goes into the loop and now on `digitalwrite` 13 will go high (5V)
- This pin is now used as an input power supply so we dont need to connect the 5V into the bread board because Pin 13 is supplying the power but we will still use the ground the code can be rewritten 

```c++

//
void setup()
{
  pinMode(13, OUTPUT);
}

void loop()
{
  digitalWrite(13, HIGH);
  delay(1000); // Wait for 1000 millisecond(s)
  digitalWrite(13, LOW);
  delay(1000); // Wait for 1000 millisecond(s)
}
```

# 1.2 
