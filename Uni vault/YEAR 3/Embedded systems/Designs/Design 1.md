# 1.1 Led flashing

![Image](https://github.com/user-attachments/assets/56dd4ac6-e308-418a-bb5c-7758087c5734)

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

# 1.2 Two led flashing in sync 

![image](https://github.com/user-attachments/assets/c5056150-89c6-431b-9fdd-49aa76f49c15)

- Now we will use another led but we will use pin 10 to control it(Same set up as the first).

```c++
//
void setup()
{
  pinMode(13, OUTPUT);
  pinMode(10, OUTPUT);
}

void loop()
{
  
  digitalWrite(13, HIGH);
  digitalWrite(10, HIGH);

  delay(700); // Wait for 1000 millisecond(s)

  digitalWrite(13, LOW);
  digitalWrite(10, LOW);
  
  delay(700);
}
```

- Here we made `Pin 10` an output as as this what we will use to control the led
- In this code both pin will go high and then low by using delays and the loop the LED will appear to flash in sync

# 1.3 LED flashing while other is off

- Set up will remain the same but the code will be the only thing to change.
- We can control when the LED turn off and on by manipulating the code we can keep one LED off while the other one is flashing (Goes high or low).

```c++
void loop()
{ 
  digitalWrite(13, HIGH);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(13, LOW);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(13, HIGH);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(13, LOW);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(13, HIGH);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(13, LOW);
  
 
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(10, HIGH);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(10, LOW);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(10, HIGH);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(10, LOW);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(10, HIGH);
  delay(700); // Wait for 1000 millisecond(s)
  digitalWrite(10, LOW);
}

```

- Here the both LEDs will flash three times because they have been set to go high and low three times while the other LED is off 
- The delays are important as that is how we are able to see the LED Flash.
- There might be a better way to do this but currently this is how I know how to do this.
