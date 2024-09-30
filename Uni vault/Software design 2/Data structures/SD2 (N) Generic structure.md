![[Pasted image 20240925190241.png]]

---

- Data and algorithms are what computer programs are about.

# Class Notes

## Data Structures in Programming

- **Data structures**: Specialized formats for:
    
    - Organizing, storing, and managing data.
    - How data is stored.
    - Efficient access and manipulation.
    - Examples include arrays, linked lists, stacks, queues, trees, and hash tables.
- **Dynamic data structures**:
    
    - Allow modification of the data.
    - Examples include linked lists, stacks, and queues.
------------------------------------------------------------
## Types of Data Structures

1. **Arrays**:
    
    - Less efficient when it comes to inserting or deleting elements.
    - Fixed size, which can be a limitation.
    - Elements are stored in contiguous memory locations.
    
2. **Linked Lists**:
    
    - Composed of nodes, each containing data and a reference to the next node.
    - Efficient for inserting and deleting elements.
    - Slower access times compared to arrays.
    - Types include singly linked lists, doubly linked lists, and circular linked lists.
3. **Stacks (LIFO)**:
    
    - Used for managing calls, undo operations, and parsing expressions.
    - Last-In-First-Out structure.
    - Operations include push (insert), pop (remove), and peek (retrieve top element).
    - Implemented using arrays or linked lists.
4. **Queues (FIFO)**:
    
    - Suitable for tasks like scheduling, task management, and data buffering.
    - First-In-First-Out structure.
    - Operations include enqueue (insert) and dequeue (remove).
    - Types include simple queues, circular queues, and priority queues.
------------------------------------------------------------
## Importance of Data Structures

1. **Efficiency**:
    
    - Enable algorithms to run faster and consume fewer resources by optimizing data storage and access patterns.
    
2. **Problem-solving**:
    
    - Programs need to manipulate data. Data structures provide a systematic way to approach these problems and devise efficient solutions.
    - Example: Graphs are used in network routing algorithms.
3. **Code Reusability**:
    
    - Well-designed data structures can be reused across different projects, saving time and effort in software development.
    - Example: Standard libraries in Java provide reusable implementations of common data structures.
4. **Memory Management**:
    
    - Data structures help manage memory efficiently, reducing memory leaks and optimizing resource allocation.
    - Example: Garbage collection in Java automatically manages memory for dynamic data structures.
5. **Algorithm Design**:
    
    - Rely on specific data structures. Choosing the right data structure can make algorithm development and optimization more straightforward.
    - Example: Binary search trees are used in search algorithms to maintain sorted data.
6. **Scalability**:
    
    - As data sizes grow, the choice of data structure becomes critical.
    - Example: B-trees are used in databases to handle large amounts of data efficiently.
------------------------------------------------------------
## Key Characteristics of Data Structures

- Software development projects are mainly open-ended.

### Linearity in Data Structures

- Arrangement of the data elements within the data structure:
    - Arrangements are either sequential (linear) or non-sequential (non-linear).
    - Example of non-linear: Trees.
    - Example of linear: Stacks, arrays, queues.

### Static vs. Dynamic

- **Array**:
    
    - Static; it is not modifiable.
    - When it comes to memory allocation in static structures, the compiler will know if it has enough memory for certain commands.
    - Fixed size, which can be a limitation.
- **Linked List**:
    
    - Dynamic; we can add or remove nodes.
    - Requires dynamic memory allocation.
    - In dynamic structures, we can’t specify ahead of time how much memory/data we will use.
    - We will know if we have enough memory for the program only at runtime.

### Homogeneous vs. Non-homogeneous

- Data elements in homogeneous data structures are of the same type, e.g., arrays.
- Need not be of the same type in non-homogeneous structures, e.g., structs.

### Time Complexity

- Time required to execute certain operations on the data structure (e.g., insertion/deletion are fast on a linked list, slower on an array).

**Example**:

- If you have a fixed set of data and data access is the most important and frequent operation, you will use an array because it is faster.

### Space Complexity

- Memory requirements for certain operations on a data structure (e.g., non-linear data structures such as trees are generally more memory-efficient than linear data structures such as lists).
-----------------------------------------------------------

## Main Applications of Data Structures

1. **Storing Data**:
    
    - E.g., database management systems use hash tables.
2. **Managing Resources and Services**:
    
    - Efficient resource allocation and management.
3. **Ordering, Sorting, Searching**:
    
    - Algorithms for these operations rely heavily on data structures.
4. **Data Exchange**:
    
    - Information such as TCP/IP packets is organized using data structures.
5. **Indexing**:
    
    - B-trees for indexing data items stored in a database.

- Knowing the most efficient way to search for an element in a data structure is crucial.
- Being familiar with the characteristics of data structures helps in choosing the right one for your application.
--- 
## Self-referential Class

- A self-referential class contains an instance variable that refers to another object of the same class type.
- Important for dynamic data structures and defining a linked data structure.
- As long as we have linked data structures, we must use the self-referential class.

```java
public class Node<T> {
	private T data;
	private Node<T> nextNode;// refer to the next linked node
	private Node (T data) {/* Constructor body*/}
	public T getData(){/* method body*/}
	public void setNext(Node <T> next){ /* method body*/}
	public Node <T> getNext(){/* method body */}

}
```

- The `Node` class has two instance variables (one of which is of the same type as the class being defined):
    
    - Generic Object `T` to hold the node data.
    - Node Object to hold the link to the next node.
- Self-referential classes are used to constitute a link node in dynamic data structures such as linked lists.
- Detail explanation in [[SD2 (SN) Data structures#Self referential class in detail]]
    
---
## Linked List

- Collection of nodes that link together.
- A linked list is a linear collection (i.e., a sequence) of self-referential class objects, called nodes.
- The linked list has a first node object used to access it in a program; each subsequent node is accessed via a reference link from the previous node; the link in the last node is set to null.

### Linked List vs. Array

- **Array**: Static.
- **Linked List**: Dynamic.

## Stack

- Constrained version of a list.
- New nodes can only be inserted or removed at the top of the stack.
- LIFO data structure.
- Used in function call management, expression evaluation, and backtracking algorithms.

## Queue

- Represents a waiting line.
- FIFO data structure.
- Used in scheduling algorithms, buffering, and breadth-first search algorithms.

## Tree

- Non-linear data structure.
- Every node has at least two child nodes.
- Root node at the top; all others are child nodes.
- Node with no children is a leaf node.

### Binary Search Tree

- Includes different tree traversal methods.

#### **Different ways to navigate in the tree**:

1. **Pre-order Traversal**:
    
    - Visit the root node first, then recursively visit the left subtree, followed by the right subtree.
2. **In-order Traversal**:
    
    - Recursively visit the left subtree, visit the root node, and then recursively visit the right subtree.
3. **Post-order Traversal**:
    
    - Recursively visit the left subtree, then the right subtree, and finally visit the root node.
4. **Level-order Traversal**:
    
    - Visit nodes level by level from top to bottom.

## Search a tree we use

- Depth firts
- Breath first
---

