
## Full Linear search code
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

## Fulll Binary search

```java
import java.util.Random;

import java.util.Arrays;

public class BinaryArray {

//instance variables
private int[] data; // array to hold integer values

private static final Random generator = new Random(); //static random object used to
//create randonNumbers

// create array of given size and fill with random integers

public BinaryArray(int size) {

data = new int[size]; // create space for array

  

// fill array with random ints in range 10-99

for (int i = 0; i < size; i++)

data[i] = 10 + generator.nextInt(90);  

Arrays.sort(data);//sort array

} // end BinaryArray constructor  

// perform a binary search on the data

public int binarySearch(int searchElement) {

int low = 0; // low end of the search area

int high = data.length - 1; // high end of the search area

int middle = (low + high + 1) / 2; // middle element

int location = -1; // return value; -1 if not found

do { // loop to search for element

// if the element is found at the middle

if (searchElement == data[middle])

location = middle; // location is the current middle

// middle element is too high

else if (searchElement < data[middle])

high = middle - 1; // eliminate the higher half

else // middle element is too low

low = middle + 1; // eliminate the lower half

middle = (low + high + 1) / 2; // recalculate the middle

} while ((low <= high) && (location == -1));

return location; // return location of search key

} // end method binarySearch

// method to output certain values in array

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

} // end method remainingElements

// method to output values in array

public String toString() {

return remainingElements(0, data.length - 1);

} // end method toString

} // end class BinaryArray
```

**DRIVER CLASS**

```java
import java.util.Scanner;

  

public class BinarySearchTest {

public static void main(String[] args) {

// create Scanner object to input data

Scanner input = new Scanner(System.in);

  

int searchInt; // search key

int position; // location of search key in array

  

// create array and output it

BinaryArray searchArray = new BinaryArray(15);

System.out.println(searchArray);

  

// get input from user

System.out.print("Please enter an integer value (-1 to quit): ");

searchInt = input.nextInt(); // read an int from user

System.out.println();

  

// repeatedly input an integer; -1 terminates the program

while (searchInt != -1) {

// use binary search to try to find integer

position = searchArray.binarySearch(searchInt);

  

// return value of -1 indicates integer was not found

if (position == -1)

System.out.println("The integer " + searchInt + " was not found.\n");

else

System.out.println("The integer " + searchInt + " was found in position " + position + ".\n");

  

// get input from user

System.out.print("Please enter an integer value (-1 to quit): ");

searchInt = input.nextInt(); // read an int from user

System.out.println();

} // end while

} // end main

} // end class BinarySearchTest
```

# Full Selection sort 

```java

`// Fig. 19.6: SelectionSort.java
// Class that creates an array filled with random integers.
// Provides a method to sort the array with selection sort.
import java.util.Arrays;
import java.util.Random;

public class SelectionSort {
    private int[] data; // array of values
    private static final Random generator = new Random();

    // create array of given size and fill with random integers
    public SelectionSort(int size) {
        data = new int[size]; // create space for array

        // fill array with random ints in range 10-99
        for (int i = 0; i < size; i++)
            data[i] = 10 + generator.nextInt(90);
    } // end SelectionSort constructor

    // sort array using selection sort
    public void sort() {
        int smallest; // index of smallest element
        // loop over data.length - 1 elements
        for (int i = 0; i < data.length - 1; i++) {
            smallest = i; // first index of remaining array
            // loop to find index of smallest element
            for (int index = i + 1; index < data.length; index++)
                if (data[index] < data[smallest])
                    smallest = index;
            swap(i, smallest); // swap smallest element into position
            printPass(i + 1, smallest); // output pass of algorithm
        } // end outer for
    } // end method sort

    // helper method to swap values in two elements
    public void swap(int first, int second) {
        int temporary = data[first]; // store first in temporary
        data[first] = data[second]; // replace first with second
        data[second] = temporary; // put temporary in second
    } // end method swap

    // print a pass of the algorithm
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
    } // end method printPass

    // method to output values in array
    public String toString() {
        return Arrays.toString(data);
    } // end method toString
} // end class SelectionSort
```

## Driver class
```java
public class SelectionSortTest {

public static void main(String[] args) {

// create object to perform selection sort

SelectionSort sortArray = new SelectionSort(10);

System.out.println("Unsorted array:");

System.out.println(sortArray + "\n"); // print unsorted array

sortArray.sort(); // sort array

System.out.println("Sorted array:");

System.out.println(sortArray); // print sorted array

} // end main

} // end class SelectionSortTest
```