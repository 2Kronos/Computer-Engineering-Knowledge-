The parentheses `()` in regular expressions are used to **group patterns** together, allowing you to apply **quantifiers** to the whole group or to **capture** matched substrings.

### Example 1: Grouping with Quantifiers
Suppose you want to match a sequence like `"ha"`, repeated **three times** (e.g., `"hahaha"`):

```java
Pattern pattern = Pattern.compile("(ha){3}");
Matcher matcher = pattern.matcher("hahaha");

System.out.println(matcher.find());  // Outputs: true
```

**Explanation**:
- **`(ha)`**: Groups `ha` together as a unit.
- **`{3}`**: Applies the quantifier to the entire group `(ha)`, so `ha` must appear exactly three times for a match.

### Example 2: Capturing Groups
Parentheses can also **capture** the matched text so it can be extracted.

```java
Pattern pattern = Pattern.compile("(\\d{3})-(\\d{2})-(\\d{4})");
Matcher matcher = pattern.matcher("123-45-6789");

if (matcher.find()) {
    System.out.println("Full match: " + matcher.group(0));  // Outputs: 123-45-6789
    System.out.println("Group 1: " + matcher.group(1));     // Outputs: 123
    System.out.println("Group 2: " + matcher.group(2));     // Outputs: 45
    System.out.println("Group 3: " + matcher.group(3));     // Outputs: 6789
}
```

**Explanation**:
- **`(\\d{3})-(\\d{2})-(\\d{4})`**: Matches a pattern like `"123-45-6789"`.
  - **`(\\d{3})`** captures the first three digits.
  - **`(\\d{2})`** captures the next two digits.
  - **`(\\d{4})`** captures the last four digits.
- **`matcher.group(0)`**: Returns the entire matched string.
- **`matcher.group(1)`, `matcher.group(2)`, `matcher.group(3)`**: Return the text matched by each group in parentheses.

In the regular expression `"(\\d{3})-(\\d{2})-(\\d{4})"`, the **dash (`-`)** serves as a literal character that matches a hyphen in the text. It is not a special character here but part of the pattern, indicating that each group of digits should be separated by hyphens.

# Method for regular expression

- **Check if the entire string matches a regex:**  
  ```java
  s1.matches("regex");
  ```
  *Returns `true` if all of `s1` matches the specified regex, otherwise `false`.*

- **Replace all occurrences matching a regex:**  
  ```java
  s1.replaceAll("regex", "s2");
  ```
  *Replaces every occurrence in `s1` that matches the regex with `s2`.*

- **Replace the first occurrence matching a regex:**  
  ```java
  s1.replaceFirst("regex", "s2");
  ```
  *Replaces the first occurrence in `s1` that matches the regex with `s2`.*

- **Split the string based on a regex:**  
  ```java
  s1.split("regex");
  ```
  *Splits `s1` based on the specified regex (e.g., comma, whitespace) and returns an array of strings.*


# Pattern and matcher 

Here are the revised code snippets with each `Pattern` initialized separately for better clarity:

### Using `Pattern` Class

1. **Using `matches`:**
   ```java
   String s1 = "HelloWorld";
   boolean isMatch = Pattern.matches("Hello.*", s1);
   // Returns true if s1 matches the regex
   ```

2. **Using `compile`:**
   ```java
   Pattern pattern = Pattern.compile("Hello.*");
   Matcher matcher = pattern.matcher("HelloWorld");
   boolean isMatch = matcher.matches();
   // Checks if "HelloWorld" matches the pattern
   ```

### Using `Matcher` Class

1. **Using `matches`:**
   ```java
   Pattern pattern = Pattern.compile("HelloWorld");
   Matcher matcher = pattern.matcher("HelloWorld");
   boolean isMatch = matcher.matches();
   // Returns true if the entire string matches the regex
   ```

2. **Using `find`:**
   ```java
   Pattern pattern = Pattern.compile("lo");
   Matcher matcher = pattern.matcher("HelloWorld");
   boolean found = matcher.find();
   // Returns true if "lo" is found within the string
   ```

3. **Using `group`:**
   ```java
   Pattern pattern = Pattern.compile("(H..)(W..)");
   Matcher matcher = pattern.matcher("HelloWorld");
   if (matcher.find()) {
       String group1 = matcher.group(1); // "Hel"
       String group2 = matcher.group(2); // "Wo"
   }
   // Retrieves the matched groups
   ```

4. **Using `lookingAt`:**
   ```java
   Pattern pattern = Pattern.compile("Hello");
   Matcher matcher = pattern.matcher("HelloWorld");
   boolean isBeginningMatch = matcher.lookingAt();
   // Returns true if the beginning of the string matches the regex
   ```

5. **Using `replaceFirst`:**
   ```java
   Pattern pattern = Pattern.compile("World");
   Matcher matcher = pattern.matcher("HelloWorld");
   String result = matcher.replaceFirst("Java");
   // Replaces the first occurrence of "World" with "Java"; result is "HelloJava"
   ```

6. **Using `replaceAll`:**
   ```java
   Pattern pattern = Pattern.compile("o");
   Matcher matcher = pattern.matcher("HelloWorld");
   String result = matcher.replaceAll("0");
   // Replaces all occurrences of "o" with "0"; result is "Hell0W0rld"
   ```

This format makes it clear that each `Pattern` is initialized separately before being used to create a `Matcher`. Let me know if you need any more adjustments!