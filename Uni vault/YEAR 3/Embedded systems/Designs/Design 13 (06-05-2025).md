# Class 06 May 2025

Today's Class will mostly indulge in Motors

  

## DC Motors, Brushless Motors, and Stepper Motors

  

A **DC motor** is an electro-mechanical device that converts direct current electrical energy into mechanical energy, allowing it to rotate. This rotation is achieved through the interaction of a current-carrying conductor within a magnetic field. For example, DC motors are commonly used in electric toys where the battery provides the direct current to drive the motor. (If i caught what he said correctly).

  

**Brushless motors** are a type of DC motor that eliminates the need for physical brushes to deliver current to the rotor. Instead, they use electronic , resulting in improved efficiency and longevity. For instance, brushless motors are often found in computer cooling fans due to their quiet and efficient operation.

  

**Stepper motors** are another type of DC motor that offers precise positioning control. By energizing electromagnets in a specific sequence, stepper motors rotate in discrete steps, making them ideal for applications requiring accuracy, such as 3D printers.

  

While brushless motors are generally more efficient due to the absence of brush friction, it's important to note that they typically require more complex control circuitry. However, this does not necessarily imply a greater DC energy supply overall. Stepper motors are a distinct category of DC motors, characterized by their ability to move in discrete steps, rather than being a branch of brushless motors.

  

## Servo Motors

  

Servo motors are designed for precise positioning and control. They can rotate to a specific angle and hold that position, making them essential in applications requiring accurate movement. Servo motors often utilize feedback mechanisms, such as encoders, to track their position and ensure they reach the desired angle. For example, servo motors are commonly used in remote control cars for steering control, allowing for precise adjustments in the car's direction. In the context of flight systems, servo motors play a crucial role in controlling various components, such as the ailerons and elevators, enabling accurate adjustments and maintaining stability.

  

# First session

  

We will be using DC Motors for this Session!

- Website explaining these things: [Tutorial Sport](https://www.tutorialspoint.com/arduino/arduino_dc_motor.htm)

  

1. Example 1:

- Using a Power supply, turn the DC motor on, increase and decrease the voltage supplied to the motor to see how it varies :[Example 1, 6 May](https://www.tinkercad.com/things/5n4jeEqKn3t-dc-motor)

2. Example 2:

- Now use the arduino to turn the dc motor on. The rotation angle or the speed does not really matter that much. [Example 2](https://www.tinkercad.com/things/hYTMQeJhEa3-example-2-09may)

3. Example 3:

- Manipulate the speed at which the motor is spinning, Use the Serial Monitor to read the value from a user. [Example 3](https://www.tinkercad.com/things/iSz2LOztXPA-example-3)

4. Example 4:

- Allow the user input to change the direcion of the rotation

of the motor.[Example 4](https://www.tinkercad.com/things/dOM6MTEFQai-example-4)

5. Example 5:

- Extend the above code to manipulate the speed at which the motor is rotating, Irregardless of the direction. Make it be such that when the user enter $-255$ it rotates anti-clockwise and faster than when entering -100. Same is true for positive values. [Example 5](https://www.tinkercad.com/things/j0Dphzk1GH8-example-5)

  

6. Example 6:

- Now, Connect 4 Motors and just ensure that each and every one of them is rotating. For this purpose we do not need to pay attention to the speed or the direction at which it rotates. : [Example 6](https://www.tinkercad.com/things/8zfANp0HgEE-example-6-09-may)

  

7. Example 7:

- Make Use of the chip to ensure more current is supplied to the motor without distressing the arduino: [Example 7](https://www.tinkercad.com/things/dLvqQgyseS6-example-7)

  

8. Example 8:

- Replicate what was done in Example 7 but now have 2 DC Motors: [Example 8](https://www.tinkercad.com/things/fjGeJIgEqkK-example-8)

9. Example 9:

- Make a rotation effect using a LEDs. Using the previous schematic for previous examples, just the wiring should not be attached to the motors but the resistors: [Example 9](https://www.tinkercad.com/things/0YqLZR7IFR0-example-9)

  
  

## Scope

- He said know everything up to this far.

- The project is un-modulated -- Not yet approved by the project manager, might change.

- The demonstration will be done in 2 days, when ready put up your hand, marked then done. If marked first day, you don't have to come the following day.

  
  
  

## Useful Resources

- [Push-Pull Amplifiers](https://www.watelectronics.com/push-pull-amplifiers-circuit-diagram-working-and-applications/)

- [Using The L293D H-Bridge](https://dumblebots.com/blog/controlling-motors-with-arduino-and-h-bridges)

- [DC Motor Start up Tuts](https://www.tutorialspoint.com/arduino/arduino_dc_motor.htm)