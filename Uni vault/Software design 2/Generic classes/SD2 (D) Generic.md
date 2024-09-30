
# Polymorphism 

Polymorphism in Java refers to the ability of an object to take on many forms. It is one of the core concepts of Object-Oriented Programming (OOP) and can be classified into two types:

1. **Compile-time Polymorphism (Method Overloading)**: This happens when multiple methods in the same class have the same name but different parameter lists (either by number or type of parameters). The method called is determined at compile time, based on the method signature.

   Example:
   ```java
   class Calculator {
       public int add(int a, int b) {
           return a + b;
       }

       public double add(double a, double b) {
           return a + b;
       }
   }
   ```

2. **Runtime Polymorphism (Method Overriding)**: This happens when a subclass provides a specific implementation of a method that is already defined in its superclass. The method to be invoked is determined at runtime based on the object's actual type, not the reference type.

   Example:
   ```java
   class Animal {
       public void sound() {
           System.out.println("Animal makes a sound");
       }
   }

   class Dog extends Animal {
       public void sound() {
           System.out.println("Dog barks");
       }
   }

   public class Main {
       public static void main(String[] args) {
           Animal myDog = new Dog();
           myDog.sound();  // Outputs: Dog barks
       }
   }
   ```

 It is more about how methods (or behaviors) can take different forms depending on the object or parameter types involved.

# Stack

![Stack](https://www.bing.com/th?id=OSK.9df31ddf0707c682bad1bc4fbc8aa793&pid=cdx&w=320&h=189&c=7&rs=1)

![Stack](https://www.bing.com/th?id=OSK.9df31ddf0707c682bad1bc4fbc8aa793&pid=cdx&w=140&h=189&c=7)

Explore

In Java, a **stack** is a linear data structure that follows the **Last-In-First-Out (LIFO)** principle. This means that the last element added to the stack is the first one to be removed. The Java Collection Framework provides a `Stack` class that models and implements this data structure.

### Key Operations:

1. **Push**: Adds an element to the top of the stack.
2. **Pop**: Removes and returns the top element of the stack.
3. **Peek**: Returns the top element without removing it.
4. **Empty**: Checks if the stack is empty.
5. **Search**: Searches for an element and returns its position from the top of the stack.
## Use of stacks 
- Undo/Redo features in text editors
- moving back forward/through browser history
- backtracking algotithms(maze, file, directories)
- Calling functions (call stack)

### Example:

Here’s a simple example of how to use the `Stack` class in Java:

```java
import java.util.Stack;

public class StackExample {
    public static void main(String[] args) {
        Stack<Integer> stack = new Stack<>();

        // Push elements onto the stack
        stack.push(1);
        stack.push(2);
        stack.push(3);
        stack.push(4);

        // Pop elements from the stack
        while (!stack.isEmpty()) {
            System.out.println(stack.pop());
        }
    }
}
```

In this example, elements are pushed onto the stack in the order 1, 2, 3, 4. [When popped, they come off in the reverse order: 4, 3, 2, 1](https://www.geeksforgeeks.org/stack-class-in-java/)[1](https://www.geeksforgeeks.org/stack-class-in-java/)[2](https://www.javatpoint.com/java-stack).

# Type safety

Type safety in Java refers to ensuring that variables are only assigned values of the expected data type. It helps avoid errors by preventing operations on incompatible types. For example, if a variable is declared as an `Integer`, Java won't allow you to assign a `String` to it without an explicit conversion. This reduces runtime errors and makes programs more robust.

Generics in Java further enhance type safety by enabling parameterized types. When you use generics, you define a data structure (like a list or map) with specific types, and the compiler ensures that only the appropriate types are added or retrieved. This is checked at compile time, meaning that invalid types will cause errors before the code is run. For instance, in a `List<String>`, only `String` objects can be added, and any attempt to add an integer will result in a compile-time error.

Without generics, you would need to cast objects back to their original types, increasing the risk of `ClassCastException` at runtime. By using generics, these potential errors are caught earlier, making the code safer and cleaner.