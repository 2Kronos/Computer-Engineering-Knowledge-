
# Class notes

- The code below is generic
```java
Array list<T>
```

- Non-generic classes
```java
int[] integer Array
```

## Generic Methods
<u>Polymorphism</u>

- Ability of an object to take any form
- Ability of an object to have different set of data
- Achieving polymorphism using generic methods to perform operation on diffrent types of database 
- Further explanation at [[SD2 N Definitions]]


<u>Compactness</u>
- This is useful to minimise redundancy
	- Redundancy 
		- Will cause memory insufficiency 
		- Increase complexity
		- testing debugging
<u>Generic methods vs Overload methods</u>

- Polymorphism when it comes to methods behaviour is determined by environment 
- Generic
	- Argument type can be different but the number of arguments is fixed

<u>Generic method</u> 

```java
public static void printArray(T[] inputArray) {
    // Display array elements
    for (T element : inputArray) {
        System.out.printf("%s", element);
    }
    System.out.println();
}

```
- Type will be resolved at runtime
- Can only accept reference generic types(Does not mean all -the types must be reference)
- The [T] (these are parameter type) type can not be called with a int data type or double data type etc
- You can use any character for the generic type 
- Purpose
	- To avoid overloading
	- To have type independence method
	- To have type safety
	- To achieve polymorphism
	

<u>Non generic method</u> 

```java

public static void printArray(Integer[] inputArray) {
    // Display array elements
    for (integer element : inputArray) {
        System.out.printf("%s", element);
    }
    System.out.println();
}

```

- Her you must specify the data type and the argument are fixed

<u>OOP relationships</u>

`is- a relationship`
- Inheritance 
  
`has-a relationship`
- Contained within/ Part of something, but it is not the thing
- A reference type is an object (every reference types inherits from reference type. Therefore, the object type is a parent  of every reference type)

example
- a dot is a circle there for it a shape
- a circle is a shape 
- Circle inherits properties of a shape
example

class client : Main class
	object Account 
--------------------------------------------------------------------------------------------
<U>Generic method maximum code</u>

```java
    // Determines the largest of three Comparable objects
    public static <T extends Comparable<T>> T maximum(T x, T y, T z) {
        T max = x; // assume x is initially the largest
        if (y.compareTo(max) > 0) {
            max = y; // y is the largest so far
        }
        if (z.compareTo(max) > 0) {
            max = z; // z is the largest
        }
        return max; // returns the largest object
    }
}
```

- When it comes to generic types we must correctly define the operations
-  the '+' has two different types of operation depending if we are working with strings or numeric types
- We therefore have to inherent from the comparable interface 
- When it comes to generic and non-generic methods when it comes to define them we must make sure on the type of operation that we are dealing with
- If we do not inherent from comparable it will be normal object
  
-----------------------------------------------------------------
	
- Generally object is upper-bound of every generic type
- If we want a powerful method we can have an overloaded generic method with out fixed arguments and different method parameters
- When compiling when the compiler looks for the methods and we have generic and non-generic method it will take the generic method first because it does not have a erasure which is an extra step for the compiler

## Generic Class

<u>Stack</u>

- Stores temporarily the function calls and function parameters
- Stack requires us to deal with generiic types
- CPU + Memory: Stack meory

<u>Raw types</u>

- You can use a raw ty

<u>Wild type</u>

# Notes

- Alternate way to achieve polymorphism
- 