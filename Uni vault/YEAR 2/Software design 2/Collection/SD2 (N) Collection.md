
![[Pasted image 20240924223739.png]]
## Collection

- Java Collections framework: prebuilt data structures, along with interfaces and methods for manipulating them
- Data structure: a collection of information organized to enable efficient processing (e.g. list, set, map, stack, queue, tree, etc.)
- ACollection is a ==data structure==(an object) that can hold references to other objects

## Type - Wrapper class

- Can only minupulerae reference objects
- `Type-wrapper classes`: classes allowing primitive types to be  manipulated as objects (==Boolean, Byte, Character, Double, Float, Integer, Long, Short)
- Auto-boxing: an automatic conversion from primitive type to corresponding type-wrapper class
- Auto-unboxing: automatic conversion from type-wrapper class to corresponding primitive type

## Interface Collection and Class Collection

- Interface vs. Class: an interface contains the behaviours (abstract methods) that a class implements (cannot be instantiated)
### Class collection
* provides static methods for searching, sorting, and performing other operations on collections
### Interface collection
 - the root interface from which interfaces Set, Queue and List are derived
 - Set: defines a collection that contains ==no duplicates
 - Queue: defines a collection that represents a ==waiting line
 - List: a collection that can ==contain duplicates==
--- 

## List (classes)
- Collection that contain  ==duplicate elements==
- ==ListIterator==: an object by means of which List elements can be ==accessed and manipulated==
- Classes inheriting from ==Interface List== (ArrayList, Vector, LinkedList)
	- ArrayList and Vector are ==resizable-array== implementations of List; element insertion is inefficient
	- LinkedList: enables efficient insertion/removal of elements anywhere in the collection
- LinkedLists are typically used to create Stacks, Queues
---

## Collection Methods

<u> List Methods</u>

- ==add==: adds an item to the end of a List
- ==size==: returns the number of elements in a List
- ==get==: retrieves the element from a List for the specified index

<u> Collection Methods</u>
- ==Iterator==: gets an Iterator for a Collection
- ==contains==: determines whether a Collection contains a specified element

<u> Iterator Methods</u>

 - ==hasNext==: determines whether a Collection contains more elements; returns true if another element exists
 - ==next==: obtains a reference to the next element
 - ==remove==: removes the current element from a Collection

Explanation of the code [[SD 2 (Co]]

---
# Linked list 

### LinkedList Methods

1. **`addAll(Collection<? extends E> c)`**:
    
    - **Description**: Adds all elements from the specified collection to the end of the list.
    - **Usage**: This is useful when you want to append multiple elements at once. For example:
        
        ```java
        LinkedList<String> list = new LinkedList<>();
        list.add("A");
        list.addAll(Arrays.asList("B", "C", "D"));
        // list now contains ["A", "B", "C", "D"]
        ```
        
2. **`subList(int fromIndex, int toIndex)`**:
    
    - **Description**: Returns a view of the portion of this list between the specified `fromIndex`, inclusive, and `toIndex`, exclusive.
    - **Usage**: Handy for extracting a part of the list without modifying the original list. For example:
        
        ```java
        LinkedList<String> list = new LinkedList<>(Arrays.asList("A", "B", "C", "D"));
        List<String> subList = list.subList(1, 3);
        // subList contains ["B", "C"]
        ```
        
3. **`clear()`**:
    
    - **Description**: Removes all elements from the list.
    - **Usage**: This method is used when you need to empty the list completely. For example:
        
        ```java
        LinkedList<String> list = new LinkedList<>(Arrays.asList("A", "B", "C"));
        list.clear();
        // list is now empty
        ```
        
4. **`toArray()`**:
    
    - **Description**: Returns an array containing all elements in the list in proper sequence.
    - **Usage**: Useful for converting the list to an array for operations that require array input. For example:
        
        ```java
        LinkedList<String> list = new LinkedList<>(Arrays.asList("A", "B", "C"));
        Object[] array = list.toArray();
        // array contains ["A", "B", "C"]
        ```
        
---
### ListIterator Methods

1. **`hasPrevious()`**:
    - **Description**: Returns `true` if the list iterator has more elements when traversing the list in the reverse direction.
    - **Usage**: This method is used to check if there are elements left to iterate over when moving backwards through the list. For example:
        
        ```java
        LinkedList<String> list = new LinkedList<>(Arrays.asList("A", "B", "C"));
        ListIterator<String> iterator = list.listIterator(list.size());
        while (iterator.hasPrevious()) {
            System.out.println(iterator.previous());
        }
        // Output: C B A
        ```
1. `set Method()`

- **Description**: The `set(int index, E element)` method replaces the element at the specified position in the list with the specified element.
- **Usage**: This method is used to update an element at a specific position in the list. For example:
    
    ```java
    LinkedList<String> list = new LinkedList<>(Arrays.asList("A", "B", "C"));
    list.set(1, "D");
    // list now contains ["A", "D", "C"]
    ```


 2. `List View`
- **Description**: The `subList(int fromIndex, int toIndex)` method returns a view of the portion of this list between the specified `fromIndex`, inclusive, and `toIndex`, exclusive.
- **Usage**: This is useful for working with a subset of the list without modifying the original list. For example:
    
    ```java
    LinkedList<String> list = new LinkedList<>(Arrays.asList("A", "B", "C", "D"));
    List<String> subList = list.subList(1, 3);
    // subList contains ["B", "C"]
    ```
    

3. `previous` Method

- **Description**: The `previous()` method of `ListIterator` returns the previous element in the list and moves the cursor position backwards.
- **Usage**: This method is used to iterate over the list in reverse order. For example:
    
    ```java
    LinkedList<String> list = new LinkedList<>(Arrays.asList("A", "B", "C"));
    ListIterator<String> iterator = list.listIterator(list.size());
    while (iterator.hasPrevious()) {
        System.out.println(iterator.previous());
    }
    // Output: C B A
    ```
    


### Class Arrays Method

1. **`asList(T... a)`**:
    - **Description**: Converts an array to a `List`.
    - **Usage**: This method is useful for creating a fixed-size list backed by the specified array. For example:
        
        ```java
        String[] array = {"A", "B", "C"};
        List<String> list = Arrays.asList(array);
        // list contains ["A", "B", "C"]
        ```
        

These methods are part of the `LinkedList` class in Java, which provides a doubly-linked list implementation of the `List` and `Deque` interfaces. If you have any specific questions about how to use these methods or need examples, feel free to ask!

---


### `ListIterator`

- **Description**: `ListIterator` is an interface that extends `Iterator` and allows bidirectional traversal of the list. It supports operations like adding, removing, and updating elements.
    
- **Key Methods**:
    
    - **`hasNext()`**: Returns `true` if the list iterator has more elements when traversing the list in the forward direction.
    - **`next()`**: Returns the next element in the list and advances the cursor position.
    - **`hasPrevious()`**: Returns `true` if the list iterator has more elements when traversing the list in the reverse direction.
    - **`previous()`**: Returns the previous element in the list and moves the cursor position backwards.
    - **`set(E e)`**: Replaces the last element returned by `next()` or `previous()` with the specified element.
    - **`add(E e)`**: Inserts the specified element into the list (optional operation).
- **Usage Example**:
    
    ```java
    LinkedList<String> list = new LinkedList<>(Arrays.asList("A", "B", "C"));
    ListIterator<String> iterator = list.listIterator();
    
    // Forward iteration
    while (iterator.hasNext()) {
        System.out.println(iterator.next());
    }
    
    // Backward iteration
    while (iterator.hasPrevious()) {
        System.out.println(iterator.previous());
    }
    ```
    
---
# Collection methods

