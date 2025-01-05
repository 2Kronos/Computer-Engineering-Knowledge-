# Wild card example

### Example

Here’s an example to illustrate the use of wildcards:

```java
import java.util.ArrayList;
import java.util.List;

public class WildcardExample {
    public static void main(String[] args) {
        List<Integer> intList = new ArrayList<>();
        intList.add(10);
        intList.add(20);

        List<Double> doubleList = new ArrayList<>();
        doubleList.add(15.5);
        doubleList.add(25.5);

        printList(intList);
        printList(doubleList);
    }

    // Method using an unbounded wildcard
    public static void printList(List<?> list) {
        for (Object elem : list) {
            System.out.println(elem);
        }
    }
}
```

In this example:

- The `printList` method uses an unbounded wildcard (`List<?>`), allowing it to accept lists of any type.
- This method can print elements of both `List<Integer>` and `List<Double>` without knowing their specific types.

### Upper Bounded Wildcard Example

```java
import java.util.ArrayList;
import java.util.List;

public class UpperBoundedWildcardExample {
    public static void main(String[] args) {
        List<Integer> intList = new ArrayList<>();
        intList.add(10);
        intList.add(20);

        List<Double> doubleList = new ArrayList<>();
        doubleList.add(15.5);
        doubleList.add(25.5);

        System.out.println("Sum of intList: " + sumOfList(intList));
        System.out.println("Sum of doubleList: " + sumOfList(doubleList));
    }

    // Method using an upper bounded wildcard
    public static double sumOfList(List<? extends Number> list) {
        double sum = 0.0;
        for (Number num : list) {
            sum += num.doubleValue();
        }
        return sum;
    }
}
```

In this example:

- The `sumOfList` method uses an upper bounded wildcard (`List<? extends Number>`), allowing it to accept lists of any type that extends `Number` (e.g., `Integer`, `Double`).

Wildcards provide flexibility in generics, making your code more reusable and type-safe. If you have any more questions or need further examples, feel free to ask!