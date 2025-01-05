# <u>Custom data structure implemenatiom</u>

1. Self referential
2. Inheritance 
     2.2 Explicit inheritance
		- Explicit inheritance occurs when a class directly extends another class using the `extends` keyword.
	  2.2. Implicit inheritance
		  - Implicit inheritance refers to the fact that all classes in Java implicitly inherit from the `Object` class if no other superclass is specified. This means every class has access to methods like `toString()`, `equals()`, and `hashCode()`.


# Self referential class in detail

A **self-referential class** is a class that contains an instance variable which refers to another object of the same class type. This is crucial for creating dynamic data structures like linked lists, trees, etc.

Here’s the provided code with detailed explanations:

```java
public class Node<T> {
    private T data; // Generic type to hold the data of the node
    private Node<T> nextNode; // Reference to the next node in the list

    // Constructor to initialize the node with data
    public Node(T data) {
        this.data = data;
        this.nextNode = null; // Initially, the next node is null
    }

    // Getter method to retrieve the data of the node
    public T getData() {
        return data;
    }

    // Setter method to set the reference to the next node
    public void setNext(Node<T> next) {
        this.nextNode = next;
    }

    // Getter method to retrieve the reference to the next node
    public Node<T> getNext() {
        return nextNode;
    }
}
```

### Key Points

1. **Instance Variables**:
    
    - `data`: Holds the data of the node. It is of a generic type `T`, allowing the node to store any type of data.
    - `nextNode`: Holds the reference to the next node in the linked list. This makes the class self-referential.
2. **Constructor**:
    
    - Initializes the node with the provided data and sets the `nextNode` to `null`.
3. **Methods**:
    
    - `getData()`: Returns the data stored in the node.
    - `setNext(Node<T> next)`: Sets the reference to the next node.
    - `getNext()`: Returns the reference to the next node.

### Example with Graphical Representation

To better understand, let’s consider a simple linked list with three nodes. Here’s a graphical representation:

```
Node1 -> Node2 -> Node3 -> null
```

Each node contains a reference to the next node, forming a chain. Here’s how you might create this in code:

```java
public class LinkedListExample {
    public static void main(String[] args) {
        Node<Integer> node1 = new Node<>(1);
        Node<Integer> node2 = new Node<>(2);
        Node<Integer> node3 = new Node<>(3);

        node1.setNext(node2); // Node1 -> Node2
        node2.setNext(node3); // Node2 -> Node3

        // Traversing the list
        Node<Integer> current = node1;
        while (current != null) {
            System.out.println(current.getData());
            current = current.getNext();
        }
    }
}
```

### Graphical Image

For a visual representation, you can refer to this [which includes diagrams showing how nodes link together](https://flylib.com/books/en/2.255.1/self_referential_classes.html)[1](https://flylib.com/books/en/2.255.1/self_referential_classes.html).



