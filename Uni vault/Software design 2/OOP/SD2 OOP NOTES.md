# OOP 

* Class use to create objects that posses the attributes and behavious defined in the class
*  Method defines the program statement that actually performs a task
- <u>A objects attribute </u> define its properties, they are instance variables in class definition
- <u> Instance variables</u> are specific to an object, specified when the object is created
-  <u>Classes</u> encapsulate (i.e. wrap) attributes and methods into objects
-  <u>Objects</U> can communicate with each other but they are not allowed to know how other objects are implemented. Implementation details are hidden within the objects themselves. Information hiding is crucial to good software engineering
- <u>Instantiation: </u>we need to create an object of a class before a program can perform the tasks that the class’ methods define. The process of doing so is called instantiation. An object is referred to as an instance of its class. 
## Object orientated technology 

*  Object-Oriented Analysis and Design (OOAD) is a method in software development for determining requirements and creating a design that meets them, using an iterative process and object-oriented programming languages like Java.

- Unified Modelling Language (UML) : the most widely used graphical scheme for modelling objectoriented systems
# Declaring objects and instantiating objects

```java
public class GradeBook
{
	public void displayMessage()
	{
		System.out.println("Weclome to Grade book");
	}
}
```

- Class GradeBook contains method displayMessage that displays a message on the screen

- To be able to make use of the method defined in class GradeBook, we need to create an <u>object</u> of this class 

- Notice the use of keyword public (referred to as an <u>access modifier</u>) in class GradeBook’s declaration. This means the class can directly interact with other classes, and it needs to be saved in a file bearing its name, and having the file extension “.java” (i.e. GradeBook.java) 

- Notice the components of the definition of method displayMessage. The method header begins with access modifier (public), followed by return type (void), then by method name (displayMessage), finally by parameter list in round brackets (empty in this case). The body of the method is delimited by curly brackets

```java
1. public class GradeBookTest {
2.	public static void main(Strings[] args)
3.		GradeBook myGradeBook = new GradeBook();
4.		myGradeBook.displayMessage();
5. }
```

- Class GradeBookTest is used as the Java application program that we use to test the operation of class GradeBook. It can also be referred to as a driver class. It contains method main that is required by the JVM to run any Java application
  
- A static method is special, because we can call it without first creating an object of the class in which the method is declared
  
 -  Line 3 makes use of a <u>Constructor,</u> a special method used to instantiate an object of a class
 
 -  Line 13 calls method displayMessage using an instance of class (i.e. object of type) GradeBook. This is referred to as <u>method</u> invocation(object name followed by dot followed by method name and parameter list)
## UML diagram for class GradeBook

- UML (Unified Modelling Language) is the most widely used graphical scheme for modelling object-oriented systems. Fig. 3.3 shows a UML class diagram for class GradeBook. It contains three compartments:<u> top one for the class name</u>, <u>middle one for the class attributes</u> (also, instance variables), and <u>bottom one for the class methods </u>(or class operations) 
   
- <u>Class attributes and methods</u> are usually either <U>public or private</u>. UML indicates this by preceding the attribute/method name by a plus/minus sign for public/private access respectively 
  
- Class GradeBook has no attributes, thus middle compartment is empty

| Class name       | GradeBook       |
| ---------------- | --------------- |
| Class attributes |                 |
| Class methods    | Display message |

## Declaring a method with a parameter

* Methods need additional information in the form of parameters
* Each parameter must specify data type and variable name.
* When a method is defined with parameters, the call to the method (i.e. method invocation) must supply an appropriate argument corresponding to each parameter in the method definition
  
* Class GradeBook’s method displayMessage is defined with parameter courseName of <u>type String</u>

```java
public class GradeBook
{
    public void displayMessage(String courseName)
    {
        System.out.printf("Welcome to the grade book for\n%s!\n", courseName);
    }
}
```

- The programmer must supply an appropriate argument to method displayMessage when calling it (line 24) 
  
- The number of arguments in a method call must match the number of parameters in the parameter list of the method declaration, and the argument type must be “consistent” with the corresponding parameter type

```java
import java.util.Scanner;

public class GradeBookTest
{
    public static void main(String[] args)
    {
        // create Scanner to obtain input from command window
        Scanner input = new Scanner(System.in);

        // create a GradeBook object and assign it to myGradeBook
        GradeBook myGradeBook = new GradeBook();

        // prompt for and input course name
        System.out.println("Please enter the course name:");
        String courseName = input.nextLine(); // read the course name

        // call myGradeBook's displayMessage method and pass courseName as an argument
        myGradeBook.displayMessage(courseName);
    }
}

```

## Instance variable, set methods and get methods

* Local variables are variables that are declared within the body of a method

- Class attributes are declared as variables in a class declaration, and outside of the bodies of the class’ method declarations.

- When each object of a class maintains its own copy of a class attribute, that attribute is referred to as an <u>instance variable</u>

- Class GradeBook is redefined so that it has a class attribute courseName; every instance (i.e. object of type) GradeBook will now have courseName as an instance variable, which can be manipulated at any time during the program execution

- Whenever a class has instance variables, it is customary to provide methods that will be used to modify or access the instance variables; these are referred to as <u>set and get methods</u>

- Modified class GradeBook has two additional methods: setCourseName (to assign a value to instance variable courseName) and getCourseName (to obtain the value stored in instance variable courseName)

```java
public class GradeBook
{
    private String courseName;

    public void setCourseName(String name)
    {
        courseName = name;
    }

    public String getCourseName()
    {
        return courseName;
    }

    public void displayMessage()
    {
        System.out.printf("Welcome to the grade book for\n%s!\n", getCourseName());
    }
}
```

<u> Driver class below</u>
