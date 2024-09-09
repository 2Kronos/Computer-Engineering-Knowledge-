<u>Errors</u>

- `Syntax` errors violate the rules of programming language and prevent the program from being compiled
- `Logic` program producing results different from those which are expected. They do not prevent the program from executing successfully

## Class/Method declaration

- `Class declaration`: class keyword introduces a class declaration and is immediately followed by the class name. 
	- `public` is another keyword that usually appears in a class declaration line
	- Class begin with  a capital letter then you will capitalize each first letter of each word incase multiple
	-  name it must not start with a number and

```java
public static void main(Strings[] args){
 System.out.prinln("Welcome to java")
}
```
## Adding two integers

* `access` specifier (public), access modifier (static), return type (void), method name (main), and parameter list ((String[] args)).
* `Java packages`: a Java package is a named group of related classes that makes it easy to reuse predefined classes in Java applications. Together, the collection of Java packages are referred to as the Java Class Library or the Java Application Programming Interface (API).
* You must import predefined classes.
```java 
Scanner input = new Scanner(System.in)
```
- A Scanner enables a program to read data (e.g. numbers, strings) for use in a program;

**Primitive Data type**: boolean (boolean), byte (byte), character (char), short (short), integer (int), long (long), float (float), double (double).

 **Reference type:** are essentially user-defined types, defined as classes (e.g. String)

<u> Catching data</u>  

Ex object of the scanner class is input 

```java
import java.util.Scanner;

        Scanner input = new Scanner(System.in);
        // For integer input
        int number1 = input.nextInt();

        // For long input
        long longNumber = input.nextLong();
        
        // For float input
        float floatNumber = input.nextFloat();
        
        // For double input
        double doubleNumber = input.nextDouble();
        
        // For byte input
        byte byteNumber = input.nextByte();
        
        // For short input
        short shortNumber = input.nextShort();
        
        // For boolean input
        boolean boolValue = input.nextBoolean();
        
        // For single character input (char)
        char character = input.next().charAt(0);
        
        // For string input (entire line)
        String line = input.nextLine();
        
        // For string input (single word)
        String word = input.next();   
```

<u> Basics </u>

```java
public class StringValueOf {
    public static void main(String[] args) {
        char[] charArray = { 'a', 'b', 'c', 'd', 'e', 'f' };
        boolean booleanValue = true;
        char characterValue = 'Z';
        int integerValue = 7;
        long longValue = 10000000000L; // L suffix indicates long
        float floatValue = 2.5f; // f indicates that 2.5 is a float
        double doubleValue = 33.333; // no suffix, double is default
        Object objectRef = "hello"; // assign string to an Object reference

        System.out.printf("char array = %s\n", String.valueOf(charArray));
        System.out.printf("part of char array = %s\n", String.valueOf(charArray, 3, 3));
        System.out.printf("boolean = %s\n", String.valueOf(booleanValue));
        System.out.printf("char = %s\n", String.valueOf(characterValue));
        System.out.printf("int = %s\n", String.valueOf(integerValue));
        System.out.printf("long = %s\n", String.valueOf(longValue));
        System.out.printf("float = %s\n", String.valueOf(floatValue));
        System.out.printf("double = %s\n", String.valueOf(doubleValue));
        System.out.printf("Object = %s\n", String.valueOf(objectRef));
    }
}

```