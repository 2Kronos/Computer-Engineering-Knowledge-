
## Installation 

```batch
pip install mpmath
```


```batch
pip install sympy
```

# Notes 

* Write you can write equation sin the factor form or  the expanded form

```python
import sympy
from sympy import symbols, factor, expand
```

To get in factor form use 
```python
expression = 2*( x + y)
print(factor(expression)
```
- Result
```result
2*(X+Y)
```

  To get in expanded for use 
```java 
expression3 = x*( x + y)
print(expand(expression3))
```
- Result 
```result
x**2 + x*y
```