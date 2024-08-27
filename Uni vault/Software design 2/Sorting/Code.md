
## Linear search
```java
import java.util.Random;
import java.util.Arrays;

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

    // Method to perform a linear search on the array
    public int linearSearch(int searchKey) {
        for (int index = 0; index < data.length; index++) {
            if (data[index] == searchKey) {
                return index; // Return the index if the searchKey is found
            }
        }
        return -1; // Return -1 if the searchKey is not found
    }

    // Method to return a string representation of the array
    public String toString() {
        return Arrays.toString(data);
    }

    // Main method to test the LinearArray class
    public static void main(String[] args) {
        LinearArray array = new LinearArray(5); // Create an array of size 10
        System.out.println("Array: " + array);
        int searchKey = 25; // Example search key
        int result = array.linearSearch(searchKey);
        if (result != -1) {
            System.out.println("Found " + searchKey + " at index " + result);
        } else {
            System.out.println(searchKey + " not found in the array.");
        }
    }
}

```

```java
import java.util.Scanner;

  

public class LinearSearchTest {

// perform a linear search on the data

public static int linearSearch(int[] data, int searchKey) {

// loop through array sequentially

for (int index = 0; index < data.length; index++) {

if (data[index] == searchKey)

return index; // return index of integer

}

  

return -1; // integer was not found

}

  

public static void main(String[] args) {

Scanner input = new Scanner(System.in);

int[] dataArray = { 20, 50, 30, 10, 40 };

System.out.println("Enter integer search key: ");

int searchInt = input.nextInt(); // read first int from user

while (searchInt != -1) {

int position = linearSearch(dataArray, searchInt);

if (position == -1) // not found

System.out.println("The integer " + searchInt + " was not found.");

else // integer was found

System.out.println("The integer " + searchInt + " was found in position " + position);

System.out.print("\nEnter integer value (-1 to quit): ");

searchInt = input.nextInt(); // read next int from user

}

}

}

// end class LinearSearchTest
```

## Binary search

*  it has two private instance variables, a constructor, a search method(binarySearch) ,a remaining Elements method and a toString method
* 