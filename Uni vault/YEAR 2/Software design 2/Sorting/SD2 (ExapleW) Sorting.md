# Walk through of Binary Search

Let’s say we have an array `[10, 20, 30, 40, 50, 60, 70, 80, 90]` and we want to find the element `70`.

1. **Initial State:**
    
    - `low = 0`
    - `high = 8`
    - `middle = (0 + 8 + 1) / 2 = 4`
    - `data[middle] = 50`
2. **First Iteration:**
    
    - `70 > 50`, so adjust `low = middle + 1 = 5`
    - Recalculate `middle = (5 + 8 + 1) / 2 = 7`
    - `data[middle] = 80`
3. **Second Iteration:**
    
    - `70 < 80`, so adjust `high = middle - 1 = 6`
    - Recalculate `middle = (5 + 6 + 1) / 2 = 6`
    - `data[middle] = 70`
4. **Element Found:**
    
    - `70 == 70`, so `location = 6`

The method returns `6`, indicating that `70` is at index `6` in the array.

# Walk through of selction sort

## Sort method

1. **First Pass (`i = 0`)**:
    
    - Initial array: `[64, 25, 12, 22, 11]`
    - `smallest = 0`
    - Inner loop finds `11` as the smallest element at index `4`.
    - Swap `64` and `11`: `[11, 25, 12, 22, 64]`
    - Print pass: `after pass 1: 11* 25 12 22 64`
2. **Second Pass (`i = 1`)**:
    
    - Array: `[11, 25, 12, 22, 64]`
    - `smallest = 1`
    - Inner loop finds `12` as the smallest element at index `2`.
    - Swap `25` and `12`: `[11, 12, 25, 22, 64]`
    - Print pass: `after pass 2: 11 12* 25 22 64`
3. **Third Pass (`i = 2`)**:
    
    - Array: `[11, 12, 25, 22, 64]`
    - `smallest = 2`
    - Inner loop finds `22` as the smallest element at index `3`.
    - Swap `25` and `22`: `[11, 12, 22, 25, 64]`
    - Print pass: `after pass 3: 11 12 22* 25 64`
4. **Fourth Pass (`i = 3`)**:
    
    - Array: `[11, 12, 22, 25, 64]`
    - `smallest = 3`
    - Inner loop finds no smaller element.
    - No swap needed: `[11, 12, 22, 25, 64]`
    - Print pass: `after pass 4: 11 12 22 25* 64`

After these passes, the array is sorted: `[11, 12, 22, 25, 64]`.

## Swap Method
Let’s say we have an array `data` with values `[5, 3, 8, 6]` and we want to swap the elements at indices `0` and `2`.

1. **Before Swap**:
    
    - `data[0] = 5`
    - `data[2] = 8`
2. **Step-by-Step Swap**:
    
    - `temporary = data[0]` → `temporary = 5`
    - `data[0] = data[2]` → `data[0] = 8`
    - `data[2] = temporary` → `data[2] = 5`
3. **After Swap**:
    
    - The array `data` becomes `[8, 3, 5, 6]`.

This method is crucial for the selection sort algorithm because it allows the algorithm to place the smallest element found in the unsorted portion of the array into its correct position in the sorted portion.

## Walk through Printpass Method
Let’s say we have an array `[64, 25, 12, 22, 11]` and we are on the first pass (`pass = 1`) with the smallest element found at index `4`.

1. **Initial State**:
    
    - Array: `[64, 25, 12, 22, 11]`
    - Pass number: `1`
    - Swapped element index: `4`
2. **Output**:
    
    - `after pass 1: 64 25 12 22 11*`
    - `--`  (indicating the first element is now sorted)

This method helps visualize the sorting process by showing the state of the array after each pass and highlighting the elements involved in swaps.

# Walk through insertion
ample Walkthrough

Let’s go through an example with a small array: `[34, 8, 64, 51, 32, 21]`.

1. **First Pass (`next = 1`)**:
    
    - `insert = 8`
    - `moveItem = 1`
    - Compare `8` with `34` (element at `moveItem - 1`):
        - `34 > 8`, so shift `34` to the right.
        - `moveItem` becomes 0.
    - Insert `8` at position 0.
    - Array after first pass: `[8, 34, 64, 51, 32, 21]`.
2. **Second Pass (`next = 2`)**:
    
    - `insert = 64`
    - `moveItem = 2`
    - Compare `64` with `34`:
        - `34 < 64`, so no shifting needed.
    - Insert `64` at position 2.
    - Array after second pass: `[8, 34, 64, 51, 32, 21]`.
3. **Third Pass (`next = 3`)**:
    
    - `insert = 51`
    - `moveItem = 3`
    - Compare `51` with `64`:
        - `64 > 51`, so shift `64` to the right.
        - `moveItem` becomes 2.
    - Compare `51` with `34`:
        - `34 < 51`, so no more shifting needed.
    - Insert `51` at position 2.
    - Array after third pass: `[8, 34, 51, 64, 32, 21]`.
