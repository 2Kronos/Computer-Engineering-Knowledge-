```java 
private static final Random generator = new Random();

```
* **`final`**: This means that once the `generator` variable is assigned an instance of `Random`, it cannot be reassigned to another `Random` object or any other value.
* Why use final
	* **Immutability**: Declaring `generator` as `final` ensures that the reference to the `Random` object cannot be changed after it is assigned. This helps in creating immutable objects or constants.
	* **Thread safety**: In multi-threaded environments, using `final` can help avoid issues related to unexpected changes to variables.

```java
data = new int[size];
```
* Use `new` when you need to create a new instance of a class or an array.
- Don't use `new` when you're simply referencing an existing object, working with primitive types, or using literals.
- In some cases, classes might offer factory methods to create instances without directly using `new`.