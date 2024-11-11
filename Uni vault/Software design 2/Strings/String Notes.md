## Pg 5
- Determine length
- Extract single character at specified index
- Extract sequence of characters
- Compare Strings


- **Common String Operations:**
  
  - **Get length of a string:**
    ```java
    s1.length();  // Returns the number of characters in s1
    ```

  - **Extract a single character:**
    ```java
    s1.charAt(idx);  // Returns the character at index idx in s1
    ```

  - **Extract a sequence of characters:**
    ```java
    s1.getChars(idx1, idx2, charArray, idx3);  // Copies characters from s1 (index idx1 to idx2) into charArray starting at index idx3
    ```

  - **Compare two strings:**
    - **Check if contents are the same:**
      ```java
      s1.equals(s2);  // Returns true if s1 and s2 have the same contents
      s1.equalsIgnoreCase(s2);  // Case-insensitive version of equals
      ```

    - **Check if they reference the same memory location:**
      ```java
      s1 == s2;  // Returns true if s1 and s2 refer to the same memory location
      ```

    - **Lexicographic comparison:**
      ```java
      s1.compareTo(s2);  // Returns 0 if s1 and s2 are equal; a positive or negative int otherwise
      ```

    - **Compare specific regions of strings:**
      ```java
      s1.regionMatches(idx1, s2, idx2, idx3);  
      // Checks if substring of s1 (starting at idx1)
      // matches substring of s2 (starting at idx2) for idx3 characters
      s1.regionMatches(true, idx1, s2, idx2, idx3);  // Case-insensitive version
      ```

- **Notes:**
  - `equals` checks if contents are the same, using lexicographic comparison.
  - `==` checks if both strings reference the same memory location (works differently with `new` Strings).
  - `regionMatches` allows comparing specific parts of two strings.
  - **Remember:** 
    - Use `s1.equals(s2)` or `s1.compareTo(s2)` to compare contents.
    - Use `s1 == s2` to check if they reference the same memory location.
    - `equals` returns `boolean`; `compareTo` returns `int`.
    - `equalsIgnoreCase` is the case-insensitive version of `equals`.
# Pg 7

- Startswith
- endswith
- Extract
- Concatenate


- **Check if a string starts with a specific sequence:**  
  ```java
  s1.startsWith(s2, idx);
  ```
  *Checks if `s1` starts with `s2` starting from index `idx`.*

- **Check if a string ends with a specific sequence:**  
  ```java
  s1.endsWith(s2);
  ```
  *Checks if `s1` ends with `s2`.*

- **Find index of character or substring:**  
  ```java
  s1.indexOf(char/string, idx);
  s1.lastIndexOf(char/string, idx);
  ```
  *`indexOf` finds the first occurrence, while `lastIndexOf` finds the last occurrence of `char` or `string` starting from `idx`.*
  *when you looking for string exampl def in the alphabet it will look for d first it basically looking for  a sentence so d then e then f* 

- **Extract substring:**  
  ```java
  s1.substring(idx1, idx2);
  ```
  *Extracts the substring from `s1` starting at `idx1` up to (but not including) `idx2`.*

- **Concatenate two strings:**  
  ```java
  s1.concat(s2);
  ```
  *Concatenates `s2` to `s1`.*

### Notes:
- `indexOf` returns the index of the first occurrence or `-1` if not found.
- `lastIndexOf` returns the index of the last occurrence or `-1` if not found, searching backward.
- `substring` returns a portion of the string based on given indices.
# Pg 11


- **Replace one character (or substring) with another:**  
  ```java
  s1.replace(charToBeReplaced, charToReplaceWith);
  ```
  *Replaces specified character or substring in `s1`.*

- **Convert string to lowercase or uppercase:**  
  ```java
  s1.toLowerCase();
  s1.toUpperCase();
  ```
  *Generates lowercase or uppercase version of `s1`.*

- **Trim whitespace from a string:**  
  ```java
  s1.trim();
  ```
  *Removes leading and trailing whitespace from `s1`.*

- **Create a character array from the string:**  
  ```java
  s1.toCharArray();
  ```
  *Converts `s1` into an array of characters.*

- **Convert any type to a string:**  
  ```java
  String.valueOf(otherDataType);
  ```
  *Converts the argument (e.g., integer, double) to a `String`.*
### Converting a `String` to Other Data Types

To convert a `String` to other data types, Java provides methods in the wrapper classes (`Integer`, `Double`, `Boolean`, etc.):

- **Convert a String to Integer**: Use `Integer.parseInt("123")` or `Integer.valueOf("123")`.
- **Convert a String to Double**: Use `Double.parseDouble("33.333")` or `Double.valueOf("33.333")`.
- **Convert a String to Boolean**: Use `Boolean.parseBoolean("true")` or `Boolean.valueOf("true")`.

### Notes:
- `replace` can handle both single characters and substrings.
- `valueOf` is a static method of the `String` class.
- None of these methods alter the original string since strings are immutable.

- Replace one character with aonther
- Generate lower/upper case version of calling string
- Trim whitespace from calling String
- Create character array thats a c opy of calling string
- Convert argument (of any type ) to string

# String builder



- **Determine the number of characters:**  
  ```java
  s1.length();
  ```
  *Returns the length of `s1`.*

- **Check current capacity (characters stored without new memory allocation):**  
  ```java
  s1.capacity();
  ```
  *Returns the storage capacity of `s1`.*

- **Set minimum capacity:**  
  ```java
  s1.ensureCapacity(int);
  ```
  *Ensures `s1` has at least the specified capacity.*

- **Change the length of the `StringBuilder`:**  
  ```java
  s1.setLength(int);
  ```
  *Sets a new length for `s1`, truncating or padding as needed.*

- **Extract a single character at an index:**  
  ```java
  s1.charAt(idx);
  ```
  *Returns the character at `idx` in `s1`.*

- **Extract a sequence of characters:**  
  ```java
  s1.getChars(idx1, idx2, charArray, idx3);
  ```
  *Copies characters from `s1` into `charArray` starting at `idx3`.*

- **Replace a character at a specified index:**  
  ```java
  s1.setCharAt(idx, char);
  ```
  *Replaces the character at `idx` with `char`.*

- **Reverse the contents of the `StringBuilder`:**  
  ```java
  s1.reverse();
  ```
  *Reverses the sequence of characters in `s1`.*

## String builder continue 
Here’s a quick reference for additional `StringBuilder` operations:

- **Append values of different types to `StringBuilder`:**  
  ```java
  s1.append(object);
  ```
  *Adds the specified value (e.g., primitive, `String`, `Object`) to the end of `s1`.*

- **Insert values at a specific position in `StringBuilder`:**  
  ```java
  s1.insert(idx, object.toString());
  ```
  *Inserts the specified value at index `idx` in `s1`.*

- **Delete character at a specified index:**  
  ```java
  s1.deleteCharAt(idx);
  ```
  *Removes the character at index `idx` in `s1`.*

- **Delete a sequence of characters within a specified range:**  
  ```java
  s1.delete(idx1, idx2);
  ```
  *Removes characters from `idx1` to `idx2` (excluding `idx2`) in `s1`.*