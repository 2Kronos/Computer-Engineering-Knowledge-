Here’s the rewritten version of your notes, formatted neatly for easy pasting into an Obsidian file:


# Notes

## 1. Console
- Displays important messages, like errors.
- To see a specific line of code running in the background, use `console.log()` to print or log messages.
- The `.log()` method prints what’s inside the parentheses onto the console.

## 2. Data Types
### Primitive Data Types
1. **Number**: Any number, including decimals (e.g., `4`, `23.42`).
2. **BigInt**: Numbers greater than $(2^{53}-1)$ or less than $(-(2^{53}-1))$, with `n` appended (e.g., `1234567890123456n`).
3. **String**: Text enclosed in single (`'...'`) or double (`"..."`) quotes.
4. **Boolean**: True or false values (e.g., `true`, `false`).
5. **Null**: Represents the intentional absence of a value (`null`).
6. **Undefined**: Represents an uninitialized variable (`undefined`).
7. **Symbol**: Unique identifiers used in advanced coding.

### Non-Primitive Data Types
- **Object**: Collections of related data.

---

## 3. Math in JavaScript
- Follow the order of operations: parentheses, exponents, multiplication/division/modulus, addition/subtraction.
- Use `Math` methods for calculations:
  - `Math.round(x)`: Rounds to the nearest integer.
  - `Math.floor(x)`: Rounds down.
  - `Math.ceil(x)`: Rounds up.
  - `Math.pow(x, y)`: Raises `x` to the power of `y`.
  - `Math.sqrt(x)`: Finds the square root.
  - `Math.random()`: Generates a random number between `0` and `1`.

---

## 4. Strings
### Syntax:
- Use single quotes (`'...'`) by default.  
  Example: `'I\'m learning JavaScript'`.
- Use backticks for template strings (`\`...\``), allowing interpolation:  
  Example: `` `Item: ${1 + 1}` ``.

### Methods:
- Concatenate strings using `+`.
- Trim whitespace: `string.trim()`.
- Convert case: `toUpperCase()` / `toLowerCase()`.
- Check inclusion: `string.includes('char')`.

---

## 5. HTML
### Nesting:
```html
<p>Paragraph <button>Click Me</button></p>
````

### Attributes:

- `title`: Adds a tooltip.
- `class`: Adds labels to elements for CSS styling.
- `onclick`: Runs JavaScript when clicked.

---

## 6. CSS

### Example:

```css
button {
    background-color: blueviolet;
    color: aliceblue;
    border: none;
}
```

- Left side: CSS property.
- Right side: CSS value.

---

## 7. Variables

- Use `let` to declare variables.
- Avoid reserved keywords and starting variable names with numbers.

### Reassigning:

- Do not repeat `let` when reassigning.

---

## 8. Booleans

- Use `===` for strict equality, avoiding type coercion.
- `!==`: Not equal.

---

## 9. User Input

- Use `window.prompt()` for input:

```javascript
let username = window.prompt("Enter username:");
```

- Access input box values:

```javascript
document.getElementById("myText").value;
```

---

## 10. Type Conversion

- Convert types explicitly (e.g., `Number()`, `String()`).
- `NaN`: Returned when conversion fails.

---

## 11. Rock-Paper-Scissors Game

- Generate random numbers using `Math.random()`:

```javascript
let randomNum = Math.floor(Math.random() * max) + min;
```

---

## 12. Ternary Operator

- Shortcut for if-else:

```javascript
let result = condition ? valueIfTrue : valueIfFalse;
```

---

## 13. Switch Statements

- Alternative to multiple `else if`:

```javascript
switch (value) {
    case 1:
        // Code
        break;
}
```

---

## 14. String Methods

- `charAt(index)`: Returns character at `index`.
- `indexOf('char')`: First occurrence of `'char'`.
- `lastIndexOf('char')`: Last occurrence of `'char'`.
- `length`: Returns string length.
- `trim()`: Removes whitespace.
- `toUpperCase()`, `toLowerCase()`: Changes case.
- `repeat(n)`: Repeats the string `n` times.
- `startsWith('char')`, `endsWith('char')`: Checks if string starts/ends with `'char'`.

---

## 15. Check Properties

- `checkbox.checked`: Determines if a checkbox/radio button is selected.

```html
<input type="checkbox" id="myCheck">
<label for="myCheck">Subscribe</label>
```

```javascript
if (document.getElementById("myCheck").checked) {
    // Code
}
```

---

## 16. Switch Statements with Conditions

```javascript
switch (true) {
    case score >= 90:
        grade = "A";
        break;
}
```

---

This formatting is structured and ready for your Obsidian file.