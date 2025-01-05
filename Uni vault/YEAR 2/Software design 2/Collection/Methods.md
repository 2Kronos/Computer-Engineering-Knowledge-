Got it! Here’s how you can use those methods in a code example format:

### **Collection Methods**

- **`add`**: Adds an item to the end of a `List`
    ```java
    List<String> list = new ArrayList<>();
    list.add("Apple");  // Adds "Apple" to the list
    ```

- **`size`**: Returns the number of elements in a `List`
    ```java
    int size = list.size();  // Returns the number of elements in list
    ```

- **`get`**: Retrieves the element from a `List` for the specified index
    ```java
    String item = list.get(0);  // Retrieves the first element, "Apple"
    ```

---

### **Collection Operations**

- **`Iterator`**: Gets an `Iterator` for a `Collection`
    ```java
    Iterator<String> iterator = list.iterator();  // Gets an iterator for the list
    ```

- **`contains`**: Determines whether a `Collection` contains a specified element
    ```java
    boolean contains = list.contains("Apple");  // Returns true if "Apple" is in the list
    ```

---

### **Iterator operations**

- **`hasNext`**: Determines whether a `Collection` contains more elements; returns `true` if another element exists
    ```java
    boolean hasNext = iterator.hasNext();  // Returns true if there are more elements to iterate
    ```

- **`next`**: Obtains a reference to the next element
    ```java
    String nextItem = iterator.next();  // Gets the next element in the iteration
    ```

- **`remove`**: Removes the current element from a `Collection`
    ```java
    iterator.remove();  // Removes the last element returned by the iterator
    ```

---

This style follows your request for simplicity, with the method call examples formatted just like the ones you showed!


Here’s how you would use the methods for `LinkedList` and `ListIterator` in a code example format:

### **LinkedList Operations**

- **`addAll`**: Adds all elements from another collection to a `LinkedList`
    ```java
    LinkedList<String> list1 = new LinkedList<>();
    list1.add("Apple");
    LinkedList<String> list2 = new LinkedList<>();
    list2.add("Banana");
    list2.add("Cherry");
    list1.addAll(list2);  // Adds all elements from list2 to list1
    ```

- **`ListIterator`**: Gets a `ListIterator` for the `LinkedList`
    ```java
    ListIterator<String> listIterator = list1.listIterator();  // Creates a ListIterator for list1
    ```

- **`subList`**: Returns a view of the portion of the list between the specified indices
    ```java
    List<String> sublist = list1.subList(1, 3);  // Gets a sublist from index 1 to 2
    ```

- **`clear`**: Removes all elements from the `LinkedList`
    ```java
    list1.clear();  // Clears all elements from list1
    ```

- **`toArray`**: Converts the `LinkedList` to an array
    ```java
    Object[] array = list1.toArray();  // Converts list1 to an array
    ```

---

### **ListIterator Methods**

- **`set`**: Replaces the last element returned by the iterator with the specified element
    ```java
    listIterator.set("Grapes");  // Replaces the current element with "Grapes"
    ```

- **`hasPrevious`**: Checks if there is a previous element in the iteration
    ```java
    boolean hasPrev = listIterator.hasPrevious();  // Returns true if there is a previous element
    ```

- **`previous`**: Returns the previous element in the iteration
    ```java
    String prevItem = listIterator.previous();  // Gets the previous element in the iteration
    ```

- **List View**: A view of the list created from methods like `subList` or `toArray`
    ```java
    List<String> listView = list1.subList(0, 2);  // Creates a view of the first two elements in list1
    ```

This format keeps things clear and consistent, showing the method usage directly with short, precise examples.


---

Here’s how you can use these methods in a `List` or `Collection` context with examples:

# **List Methods**

- **`sort`**: Sorts the elements of a `List`
    ```java
    List<Integer> numbers = new ArrayList<>(List.of(3, 1, 4, 1, 5, 9));
    Collections.sort(numbers);  // Sorts the list in ascending order
    ```

- **`binarySearch`**: Locates an object in a `List` (requires the list to be sorted)
    ```java
    int index = Collections.binarySearch(numbers, 4);  // Finds the index of element "4"
    ```

- **`reverse`**: Reverses the elements of a `List`
    ```java
    Collections.reverse(numbers);  // Reverses the order of elements in the list
    ```

- **`shuffle`**: Randomly orders a `List`’s elements
    ```java
    Collections.shuffle(numbers);  // Randomly shuffles the elements of the list
    ```

- **`fill`**: Sets every `List` element to refer to a specified object
    ```java
    Collections.fill(numbers, 0);  // Sets all elements in the list to 0
    ```

- **`copy`**: Copies references from one `List` into another
    ```java
    List<Integer> copyList = new ArrayList<>(numbers.size());
    Collections.copy(copyList, numbers);  // Copies elements from numbers into copyList
    ```

---

# **Collection Methods**

- **`min`**: Returns the smallest element in a `Collection`
    ```java
    int minElement = Collections.min(numbers);  // Returns the smallest element in the list
    ```

- **`max`**: Returns the largest element in a `Collection`
    ```java
    int maxElement = Collections.max(numbers);  // Returns the largest element in the list
    ```

- **`addAll`**: Appends all elements in an array to a `Collection`
    ```java
    Integer[] array = {10, 20, 30};
    List<Integer> list = new ArrayList<>();
    Collections.addAll(list, array);  // Adds all elements of array to the list
    ```

- **`frequency`**: Calculates how many collection elements are equal to the specified element
    ```java
    int frequency = Collections.frequency(numbers, 1);  // Counts how many times "1" appears in the list
    ```

- **`disjoint`**: Determines if two collections have no elements in common
    ```java
    List<Integer> list1 = List.of(1, 2, 3);
    List<Integer> list2 = List.of(4, 5, 6);
    boolean noCommon = Collections.disjoint(list1, list2);  // Returns true if lists have no common elements
    ```

This approach gives concise, practical examples of each method, in the style you're looking for!


# HashMaps

Here’s how you can use these methods with a `HashMap`, shown in example format:

### **HashMap Methods**

- **`put`**: Adds a key-value pair to the `HashMap`
    ```java
    HashMap<String, Integer> map = new HashMap<>();
    map.put("Apple", 10);  // Adds the key "Apple" with the value 10
    ```

- **`get`**: Retrieves the value associated with a specific key
    ```java
    Integer value = map.get("Apple");  // Returns the value associated with "Apple" (10)
    ```

- **`containsKey`**: Checks if the `HashMap` contains a specified key
    ```java
    boolean hasKey = map.containsKey("Apple");  // Returns true if "Apple" exists as a key in the map
    ```

- **`containsValue`**: Checks if the `HashMap` contains a specified value
    ```java
    boolean hasValue = map.containsValue(10);  // Returns true if 10 exists as a value in the map
    ```

- **`replace`**: Replaces the value for a specified key if it exists
    ```java
    map.replace("Apple", 20);  // Replaces the value of "Apple" with 20
    ```

- **`putIfAbsent`**: Adds a key-value pair only if the key is not already present in the `HashMap`
    ```java
    map.putIfAbsent("Banana", 15);  // Adds "Banana" with value 15 only if "Banana" is not already in the map
    ```

These examples demonstrate each method’s usage in a `HashMap` for quick reference!

