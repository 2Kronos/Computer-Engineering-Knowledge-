## Explanation of Linear search

* Full code at [[Full Code#Linear search]]
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

## Binary search explanation

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

# Sorting code 

## Selection sort code anlysis 

- This class has two private instance variables  an array of ints named data, and a static Random object to generate random integers to fill the array.