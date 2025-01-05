- Searching algorithms use either ==linear== and ==Binary search==
* Sorting algorithms **selection sort, insertion sort, Merge sort**
# Searching
## Linear Searching 
* Sequential search of a **Search key** in an array of data
	-  Each array element is compared to the **Search key** until it is found or we have reached the end of an array
	- Finding the search key returns the index of  element.
	- If there are **duplicate** values in the array, index of only **first element** returned 
	  
* Array of random numbers full code can be viewed in [[]]
* Explanation of the code [[SD2 (ExplaC) Sorting#Explanation of Linear search]]

## Binary Search

* Involves searching the array by disecting the array into two halves
* First test of **search key** is against middle element of the array
* Three possible outcomes
	- **Match**: index is returned
	- **Search key less** than middle element: discard upper half of array, perform binary search on lower half 
	- **Search key greater** than middle element: discard lower half of array, perform binary search on upper half
	- Repeat until either search key is found or search fails
- It requires array to be sorted (typically in ascending order)
  
- Full code at [[SD2 Sorting Full Code#Fulll Binary search]]
  
- Explanation of the code at [[SD2 (ExplaC) Sorting#Binary search explanation]]

- Walk through at [[SD2 (ExapleW) Sorting#Walk through of Binary Search]]
```Simplify
----Method class----
Method to generate random number
Method to search for the data
Methid to print array as a string using toString

----Driver class------
creating the size of the array
code to print out if the intger is found
code to print if the integer is not found
code to quit the seearch (-1)
```

# Algorithm Complexity/Effciency

* `Big O` notation: indicates the worst-case run-time for an algorithm-that is, how hard an algorithm may have to work to solve a problem
* Amount of effort usually depends on how many date elements.
	- **`O(1)`** algorithms: Effort is independant of amount of data values. Has a constant runtime.
	- **`O(N)`** algorithm: Effort proportional to number of data elements linear runtime.
	- **`O(n^2)`** algorithm : Effort is proportional to square number of data elements. Quadratic runtime.
- `Big O` Is based on how a algorithm runtime grows with relation to number of items processed (Algorithm are designed to have a favourable BIG O for faster and effecient programs)
# Sorting algorithms

- Sorting: places data in some order (ascending/descending) (e.g. alphabetical ordering of strings, ascending ordering of numbers, etc.)
- Different algorithms which achieve the same goal, only differ in complexity and effeiciency.
	- Selection sort
	- Insertion sort
	- Merge sort
- Choice impacts run-time, memory usage but result should be the same.
- Compromise between ease of programming (simplicity) and efficiency (execution time, memory requirement)
-  Selection sort and insertion sort simple (i.e. easy to program), but inefficient
- Merge sort more efficient, but more complex
## Selection Sort algorithm

- **Procedure** (Ascending order):
	- Iterate through all array elements, find smallest element, swap with first element
	- Iterate through all array elements except first one, find smallest element, swap with second element
	- Repeat till sorted
- Algorithm complexity is **O(n^2)**
![[Pasted image 20240827222542.png]]
Anlysis code is at [[SD2 (ExplaC) Sorting#Explanation of Sorting code]]


## Insertion sort

- simple insufficient
- Ascending order
- comparing the elements to the elements before each other and putting the smallest first
- Code explanation at [[SD2 (ExplaC) Sorting#Insertion sort Explanation]]


# Summary

[[#Summary]