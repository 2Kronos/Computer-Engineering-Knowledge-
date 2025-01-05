# Creating and executing threads

Sure! Here’s an example of creating and executing a thread using the `Runnable` interface in Java:

```java
// Define a class that implements Runnable
class MyRunnable implements Runnable {
    public void run() {
        System.out.println("Thread is running...");
    }
}

public class Main {
    public static void main(String[] args) {
        // Create an instance of the Runnable
        MyRunnable myRunnable = new MyRunnable();
        
        // Create a Thread object and pass the Runnable instance to it
        Thread thread = new Thread(myRunnable);
        
        // Start the thread
        thread.start();
    }
}
```

In this example:

1. **MyRunnable class**: This class implements the `Runnable` interface and overrides the `run` method, which contains the code that will be executed when the thread runs.
2. **Main class**: In the `main` method, an instance of `MyRunnable` is created. Then, a `Thread` object is created with the `MyRunnable` instance passed to its constructor. Finally, the thread is started using the `start` method.

Using the `Runnable` interface is often preferred because it allows the class to extend another class if needed, as Java does not support multiple inheritance.


