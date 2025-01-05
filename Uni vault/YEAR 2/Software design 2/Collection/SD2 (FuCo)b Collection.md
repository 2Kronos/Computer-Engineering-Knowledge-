
```java
// Fig. 20.2: CollectionTest.java

// Collection interface demonstrated via an ArrayList object.

import java.util.List;

import java.util.ArrayList;

import java.util.Collection;

import java.util.Iterator;

  

public class CollectionTest {

    public static void main(String[] args) {

        // add elements in colors array to list

        String[] colors = { "MAGENTA", "RED", "WHITE", "BLUE", "CYAN" };

        List<String> list = new ArrayList<String>();

  

        for (String color : colors)

            list.add(color); // adds color to end of list

  

        // add elements in removeColors array to removeList

        String[] removeColors = { "RED", "WHITE", "BLUE" };

        List<String> removeList = new ArrayList<String>();

  

        for (String color : removeColors)

            removeList.add(color);

  

        // output list contents

        System.out.println("ArrayList: ");

  

        for (int count = 0; count < list.size(); count++)

            System.out.printf("%s ", list.get(count));

  

        // remove from list the colors contained in removeList

        removeColors(list, removeList);

  

        // output list contents

        System.out.println("\n\nArrayList after calling removeColors: ");

  

        for (String color : list)

            System.out.printf("%s ", color);

    }

  

    // remove colors specified in collection2 from collection1

    private static void removeColors(Collection<String> collection1, Collection<String> collection2) {

        // get iterator

        Iterator<String> iterator = collection1.iterator();

  

        // loop while collection has items

        while (iterator.hasNext()) {

            if (collection2.contains(iterator.next()))

                iterator.remove(); // remove current Color

        }

    }

}
```

# Linked list Full code

```java 
import java.util.*;

  

public class ListTest {

    public static void main(String[] args) {

        // add colors elements to list1

        String[] colors = { "black", "yellow", "green", "blue", "violet", "silver" };

        List<String> list1 = new LinkedList<String>();

  

        for (String color : colors)

            list1.add(color);

  

        // add colors2 elements to list2

        String[] colors2 = { "gold", "white", "brown", "blue", "gray", "silver" };

        List<String> list2 = new LinkedList<String>();

  

        for (String color : colors2)

            list2.add(color);

  

        list1.addAll(list2); // concatenate lists

        list2 = null; // release resources

  

        printList(list1); // print list1 elements

        convertToUppercaseStrings(list1); // convert to uppercase string

        printList(list1); // print list1 elements

  

        System.out.print("\nDeleting elements 4 to 6 ... ");

        removeItems(list1, 4, 7); // remove items 4-6 from list

        printList(list1); // print list1 elements

  

        printReversedList(list1); // print list in reverse order

    }

  

    // output List contents

    private static void printList(List<String> list) {

        System.out.println("\nlist: ");

        for (String color : list)

            System.out.printf("%s ", color);

        System.out.println();

    }

  

    // locate String objects and convert to uppercase

    private static void convertToUppercaseStrings(List<String> list) {

        ListIterator<String> iterator = list.listIterator();

        while (iterator.hasNext()) {

            String color = iterator.next(); // get item

            iterator.set(color.toUpperCase()); // convert to upper case

        }

    }

  

    // obtain sublist and use clear method to delete sublist items

    private static void removeItems(List<String> list, int start, int end) {

        list.subList(start, end).clear(); // remove items

    }

  

    // print reversed list

    private static void printReversedList(List<String> list) {

        ListIterator<String> iterator = list.listIterator(list.size());

        System.out.println("\nReversed List:");

        while (iterator.hasPrevious())

            System.out.printf("%s ", iterator.previous());

    }

}
```

# List of view arrays full code

```java 
import java.util.*;

  

public class ListTest {

    public static void main(String[] args) {

        // add colors elements to list1

        String[] colors = { "black", "yellow", "green", "blue", "violet", "silver" };

        List<String> list1 = new LinkedList<String>();

  

        for (String color : colors)

            list1.add(color);

  

        // add colors2 elements to list2

        String[] colors2 = { "gold", "white", "brown", "blue", "gray", "silver" };

        List<String> list2 = new LinkedList<String>();

  

        for (String color : colors2)

            list2.add(color);

  

        list1.addAll(list2); // concatenate lists

        list2 = null; // release resources

  

        printList(list1); // print list1 elements

        convertToUppercaseStrings(list1); // convert to uppercase string

        printList(list1); // print list1 elements

  

        System.out.print("\nDeleting elements 4 to 6 ... ");

        removeItems(list1, 4, 7); // remove items 4-6 from list

        printList(list1); // print list1 elements

  

        printReversedList(list1); // print list in reverse order

    }

  

    // output List contents

    private static void printList(List<String> list) {

        System.out.println("\nlist: ");

        for (String color : list)

            System.out.printf("%s ", color);

        System.out.println();

    }

  

    // locate String objects and convert to uppercase

    private static void convertToUppercaseStrings(List<String> list) {

        ListIterator<String> iterator = list.listIterator();

        while (iterator.hasNext()) {

            String color = iterator.next(); // get item

            iterator.set(color.toUpperCase()); // convert to upper case

        }

    }

  

    // obtain sublist and use clear method to delete sublist items

    private static void removeItems(List<String> list, int start, int end) {

        list.subList(start, end).clear(); // remove items

    }

  

    // print reversed list

    private static void printReversedList(List<String> list) {

        ListIterator<String> iterator = list.listIterator(list.size());

        System.out.println("\nReversed List:");

        while (iterator.hasPrevious())

            System.out.printf("%s ", iterator.previous());

    }

}
```