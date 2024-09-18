
#  For each loop 

- Specialised loop to loop over array and array list quicker 

```java
for(TYPE VAR_NAME : ArrayList/Array){
....
}
```
- Braces can be removed if we have one statement 
- In each iteration, the variable VAR_NAME will hold the value of an element inside the Array List/Array starting from the first element
- Will keep iterating till the end
- Not using a index

A **for-each loop** in Java is a simplified version of the for loop that is used to iterate over elements in an array or a collection (like `ArrayList`, `HashSet`, etc.). It is also known as the enhanced for loop. The main advantage of using a for-each loop is that it eliminates the need for a counter variable and makes the code more readable.

### Syntax

```java
for (Type element : collection) {
    // Code to be executed
}
```

### Example with an Array

Here’s an example of using a for-each loop to iterate over an array of integers:

```java
public class ForEachExample {
    public static void main(String[] args) {
        int[] numbers = {1, 2, 3, 4, 5};

        for (int number : numbers) {
            System.out.println(number);
        }
    }
}
```

In this example, the loop iterates over each element in the `numbers` array and prints it out.
- This loop iterates over each element in the `numbers` array.
- `int number` declares a new integer variable `number` that will take the value of each element in the array during each iteration.
- `: numbers` specifies the array to iterate over.
- `System.out.println(number);` prints the current value of `number` to the console.
### Example with an ArrayList

Here’s an example of using a for-each loop to iterate over an `ArrayList` of strings:

```java
import java.util.ArrayList;

public class ForEachExample {
    public static void main(String[] args) {
        ArrayList<String> fruits = new ArrayList<>();
        //- This line declares an `ArrayList` of strings named `fruits` and initializes it as an empty list.
        fruits.add("Apple");
        fruits.add("Banana");
        fruits.add("Cherry");

        for (String fruit : fruits) {
            System.out.println(fruit);
        }
    }
}
```

In this example, the loop iterates over each element in the `fruits` `ArrayList` and prints it out.

1. **For-Each Loop**:
    
    Java
    
    ```java
    for (String fruit : fruits) {
        System.out.println(fruit);
    }
    ```
    
    AI-generated code. Review and use carefully. .
    
    - This loop iterates over each element in the `fruits` `ArrayList`.
    - `String fruit` Declares a new string variable `fruit` that will take the value of each element in the list during each iteration.
    - `: fruits` Specifies the `ArrayList` to iterate over.
    - `System.out.println(fruit);` Prints the current value of `fruit` to the console.

### Key Points

- The for-each loop is read-only, meaning you cannot modify the collection while iterating through it.
- It is best used when you need to access each element in a collection without modifying it.

Do you have any specific questions about using for-each loops in your projects?