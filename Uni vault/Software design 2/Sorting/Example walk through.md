## Walk through of Binary Search

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