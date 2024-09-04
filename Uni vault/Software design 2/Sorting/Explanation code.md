## Explanation of Linear search

* Full code at [[Software design 2/Sorting/Full Code#Linear search]]
```java
public class LinearArray {

private int[] data;

private static final Random generator = new Random();

  

// Constructor to initialize the array with random integers

public LinearArray(int size) {

data = new int[size];

for (int i = 0; i < size; i++) {

data[i] = 10 + generator.nextInt(90);

}

}
```
- Linear search of array elements

```java
    // Method to perform a linear search on the array
    public int linearSearch(int searchKey) {
        for (int index = 0; index < data.length; index++) {
            if (data[index] == searchKey) {
                return index; // Return the index if the searchKey is found
            }
        }
        return -1; // Return -1 if the searchKey is not found
    }
```
* This method performs a linear search on the array `data` to find the `searchKey`.
- It loops through each element of the array.
- If the current element matches the `searchKey`, it returns the index of that element.
- If the loop completes without finding the `searchKey`, it returns `-1` indicating the key was not found
```java
  public static int linearSearch(int[] data, int searchKey) {

// loop through array sequentially

for (int index = 0; index < data.length; index++) {

if (data[index] == searchKey)

return index; // return index of integer

}

return -1; // integer was not found
```

# Binary search explanation

* **Binary search Method explanation** in 
```java
public int binarySearch(int searchElement) {
    int low = 0;
    int high = data.length - 1;
    int middle = (low + high + 1) / 2;
    int location = -1;

    do {
        if (searchElement == data[middle])
            location = middle;
        else if (searchElement < data[middle])
            high = middle - 1;
        else
            low = middle + 1;

        middle = (low + high + 1) / 2;
    } while ((low <= high) && (location == -1));

    return location;
}
```

- `low` is the starting index of the array (0).
- `high` is the ending index of the array (`data.length - 1`).
- `middle` is the midpoint of the current search range.
- `location` is initialized to `-1`, indicating that the element has not been found yet.

**LOOP explanation**

- The loop continues as long as `low` is less than or equal to `high` and the `location` is `-1` (element not found).
- **Check Middle Element:** If `searchElement` is equal to `data[middle]`, the element is found, and `location` is set to `middle`.
- **Adjust Search Range:**
    - If `searchElement` is less than `data[middle]`, it means the element must be in the lower half of the current range, so `high` is adjusted to `middle - 1`.
    - If `searchElement` is greater than `data[middle]`, it means the element must be in the upper half of the current range, so `low` is adjusted to `middle + 1`.
- **Recalculate Middle:** The `middle` index is recalculated based on the new `low` and `high` values.
-  After the loop ends, the method returns the `location` of the `searchElement`. If the element was not found, `location` remains `-1`.
## Remaining elements Method

```java
public String remainingElements(int low, int high) {
    StringBuilder temporary = new StringBuilder();

    // output spaces for alignment
    for (int i = 0; i < low; i++)
        temporary.append(" ");

    // output elements left in array
    for (int i = low; i <= high; i++)
        temporary.append(data[i] + " ");

    temporary.append("\n");
    return temporary.toString();
}

```
- This method is designed to output a subset of the array elements as a string. Here’s how it works:

1. **Parameters**: It takes two parameters, `low` and `high`, which define the range of indices in the array to be included in the output.
2. **StringBuilder**: It uses a `StringBuilder` object named `temporary` to build the output string efficiently.
3. **Alignment Spaces**: It first appends spaces to the `temporary` object for alignment purposes, based on the `low` index.
4. **Appending Elements**: It then appends the elements from the `low` index to the `high` index, separated by spaces.
5. **New Line**: Finally, it appends a newline character and returns the resulting string.
## To String Method

```java
public String toString() {
    return remainingElements(0, data.length - 1);
}
```

The `toString` method is a standard method in Java that returns a string representation of an object. In this class, it overrides the default `toString` method to provide a custom string representation of the `BinaryArray` object.

1. **Calling `remainingElements`**: It calls the `remainingElements` method with `0` and `data.length - 1` as arguments, which means it outputs all elements in the array.
2. **Return Value**: It returns the string produced by the `remainingElements` method.

# Explanation of Sorting code 

## Selection sort code anlysis 

Full code at [[Software design 2/Sorting/Full Code#Full Selection sort]]
Walk through is at 

- This class has two private instance variables  an array of ints named data, and a static Random object to generate random integers to fill the array.
**Sort Method** 
Walk through is at [[SD2 Sorting Example walk through#Sort method]]
```java
public void sort() {
    int smallest;//will hold smallest element in array
    for (int i = 0; i < data.length - 1; i++) {
        smallest = i;
        for (int index = i + 1; index < data.length; index++)
            if (data[index] < data[smallest])
                smallest = index;
        swap(i, smallest);
        printPass(i + 1, smallest);
    }
}
```

1. **Outer loop**
```java
for (int i = 0; i < data.length - 1; i++) {
    smallest = i;
```
- The outer loop runs from the first element to the second-to-last element of the array.
- `i` represents the current position in the array where the smallest element will be placed.
- Initially, `smallest` is set to `i`, assuming the first element of the unsorted portion is the smallest.
  
2. **Inner loop**
```java
for (int index = i + 1; index < data.length; index++) {
    if (data[index] < data[smallest])
        smallest = index;
}
```
- The inner loop runs from the element right after `i` to the last element of the array.
- It compares each element in the unsorted portion with the current smallest element.
- If a smaller element is found, `smallest` is updated to the index of this new smallest element
3. **Swapping element** 
```java
printPass(i + 1, smallest);
```
 - After the inner loop completes, the smallest element in the unsorted portion is swapped with the element at index `i`.
    - This places the smallest element in its correct position in the sorted portion of the array.
4. **Printing pass**
```java
printPass(i + 1, smallest);
```

* - The `printPass` method is called to print the state of the array after each pass of the outer loop.
- This helps in visualizing the sorting process step by step.


**Swap Method**
Example walk through at [[SD2 Sorting Example walk through#Swap Method]]
```java
public void swap(int first, int second) {
    int temporary = data[first]; // store first in temporary
    data[first] = data[second]; // replace first with second
    data[second] = temporary; // put temporary in second
}
```
 * It is void so it has no return type
 1. Sorting the first Element
```java
int temporary = data[first];
```
- - A temporary variable `temporary` is created to hold the value of the element at index `first`.
2. Replacing the first element
```java
data[first] = data[second];
```
- he value of the element at index `second` is assigned to the element at index `first`.
- This effectively moves the value of the second element to the position of the first element.
3. Putting the temporary Values in the Second Element
```java
data[second] = temporary;
```

- The value stored in the `temporary` variable (originally the value of the first element) is assigned to the element at index `second`.
- This completes the swap, as the original value of the first element is now in the position of the second element.

**PrintPass Method**
walk through at [[SD2 Sorting Example walk through#Walk through Printpass Method]]
```java
public void printPass(int pass, int index) {
    System.out.print(String.format("after pass %2d:", pass));

    // output elements till selected item
    for (int i = 0; i < index; i++)
        System.out.print(data[i] + " ");

    System.out.print(data[index] + "* "); // indicate swap

    // finish outputting array
    for (int i = index + 1; i < data.length; i++)
        System.out.print(data[i] + " ");

    System.out.print("\n "); // for alignment

    // indicate amount of array that is sorted
    for (int j = 0; j < pass; j++)
        System.out.print("-- ");
    System.out.println("\n"); // add end line
}

```
1. Method Signature
```java
public void printPass(int pass, int index)
```
- It takes two parameters: `pass` (the current pass number) and `index` (the index of the element that was swapped).
- - The method is `public`, meaning it can be called from outside the class.

1. **Printing the Pass Number**

```java
System.out.print(String.format("after pass %2d:", pass));
```
* This line prints the pass number in a formatted string.
- `%2d` ensures the pass number is printed with a width of 2 characters, aligning the output nicely.
3. **Printing Elements Before the Swapped Element**
```java
for (int i = 0; i < index; i++)
    System.out.print(data[i] + " ");
```
- This loop prints all elements in the array up to (but not including) the element at `index`.
- Each element is followed by a space for readability.
4. **Indicating the Swapped Element:**
    ```java
System.out.print(data[index] + "* ");
    ```
-  This prints the element at `index` followed by an asterisk (`*`), indicating that this element was involved in the swap.
5. **Priniting the Elements After the Swappped Element**
```java
for (int i = index + 1; i < data.length; i++)
    System.out.print(data[i] + " ");
```
*  This loop prints all elements in the array after the element at `index`.
- Each element is followed by a space for readability.
6. **Alignment and Sorted Portion Indication**:
    
    Java
    
    ```java
    System.out.print("\n "); // for alignment
    
    for (int j = 0; j < pass; j++)
        System.out.print("-- ");
    System.out.println("\n"); // add end line
    ```
    
    - The first `System.out.print("\n ");` adds a newline and a space for alignment.
    - The second loop prints dashes (`--`) to indicate the portion of the array that is sorted after each pass.
    - `System.out.println("\n");` adds another newline for better readability.