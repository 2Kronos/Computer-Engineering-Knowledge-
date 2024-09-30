
![[Pasted image 20240924223739.png]]
## Collection

- Java Collections framework: prebuilt data structures, along with interfaces and methods for manipulating them
- Data structure: a collection of information organized to enable efficient processing (e.g. list, set, map, stack, queue, tree, etc.)
- ACollection is a ==data structure==(an object) that can hold references to other objects

## Type - Wrapper class

- Can only minupulerae reference objects
- `Type-wrapper classes`: classes allowing primitive types to be  manipulated as objects (==Boolean, Byte, Character, Double, Float, Integer, Long, Short)
- Auto-boxing: an automatic conversion from primitive type to corresponding type-wrapper class
- Auto-unboxing: automatic conversion from type-wrapper class to corresponding primitive type

## Interface Collection and Class Collection

- Interface vs. Class: an interface contains the behaviours (abstract methods) that a class implements (cannot be instantiated)
### Class collection
* provides static methods for searching, sorting, and performing other operations on collections
### Interface collection
 - the root interface from which interfaces Set, Queue and List are derived
 - Set: defines a collection that contains no duplicates
 - Queue: defines a collection that represents a waiting line
 - List: a collection that can contain duplicates

## List
- Collection that contain  ==duplicate elements==
- ListIterator: an object by means of which List elements can be ==accessed and manipulated==
- Classes inheriting from Interface List (ArrayList, Vector, LinkedList)
	- ArrayList and Vector are resizable-array implementations of List; element insertion is inefficient
	- LinkedList: enables efficient insertion/removal of elements anywhere in the collection
- LinkedLists are typically used to create Stacks, Queues

## Collection Methods

<u> List Methods</u>

- add: adds an item to the end of a List
- size: returns the number of elements in a List
- get: retrieves the element from a List for the specified index

<u> Collection Methods</u>
- Iterator: gets an Iterator for a Collection
- contains: determines whether a Collection contains a specified element

<u> Iterator Methods</u>

 - hasNext: determines whether a Collection contains more elements; returns true if another element exists
 - next: obtains a reference to the next element
 - remove: removes the current element from a Collection