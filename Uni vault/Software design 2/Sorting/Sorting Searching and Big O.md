* Searching algorithms use either **linear** and **Binary** search
* Sorting algorithms **selection sort, insertion sort, Merge sort**

## Linear Searching 
* Sequential search of a **Search key** in an array of data
	-  Each array element is compared to the **Search key** until it is found or we have reached the end of an array
	- Finding the search key returns the index of  element.
	- If there are **duplicate** values in the array, index of only **first element** is 
	  
* Array of random numbers full code can be viewed in [[Code]]

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

## Binary Search

* Involves searching the array by disecting the array into two halves
* First test of **search key** is against middle element of the array
* Three possible outcomes
	- **Match**: index is returned
	- **Search key less** than middle element: discard upper half of array, perform binary search on lower half 
	- **Search key greater** than middle element: discard lower half of array, perform binary search on upper half
	- Repeat until either search key is found or search fails
- It requires array to be sorted (typically in ascending order)