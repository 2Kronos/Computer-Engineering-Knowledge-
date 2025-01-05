  

- `.` – Matches any character (except newline)
	- E.g
	  `a.b` any string starts with a ends with b and is composed of three letter fit this pattern
	  `a.*b` matches any string that that contains an a and then a b at some later point
	  `.*b` can be use alone. Without preceding it with a character.
  
- `^` – Marks the start of the string the pattern detected must be at the start of the string
  
- `$` – Matches the end of a string
  
- `*` – Matches zero or more occurrences of the previous character (0 or more)
  
- `+` – Matches one or more occurrences of the previous character (1 or more)
  
- `?` – Matches zero or one occurrence of the previous character (0 or 1)
	  - e.g `a?b` 
	    The `?` does not mean “either/or” in this case. Instead, it modifies the character before it (`a`) to make it optional, meaning `a` can appear either zero times or once before the `b`. 
  
- `{n}` – Matches exactly `n` occurrences of the previous character and nothing less 
	- e.g 
	  `a{1}b = ab`
	  `a{0,2}= b, ab, aab` 
	  \\d{3} will match atlease 3 and nothing less but it will past `true` for more than 3 because we are looking for atleast 3
	  
  
- `{n,}` – Matches `n` or more occurrences of the previous character
  
- `{n,m}` – Matches between `n` and `m` occurrences of the previous character
  
- `[]` – Matches any single character within the brackets (e.g., `[abc]`)
	- `[aeiou]` matches a single vowl letter
	- `[A-Z]` matches a single upper case letter  in that range
	- `[abc]= a, b, c,` only one of them
	  
- `[^]` – Matches any single character not in the brackets (e.g., `[^abc]`)
	  - `[^abc]` matches any other character expect for 'a', 'b', 'c'
	  - `[^a-z]` matches all characters except the one in the current range 
	
	    
- `|` – Acts as an OR operator (e.g., `a|b` matches "a" or "b")
  
- `()` – Groups patterns together (for capturing and applying quantifiers)
  
- `\d` – Matches any digit (equivalent to `[0-9]`)
  
- `\D` – Matches any non-digit
  
- `\w` – Matches any word character (alphanumeric + underscore)
  
- `\W` – Matches any non-word character
  
- `\s` – Matches any whitespace character (spaces, tabs, etc.)
  
- `\S` – Matches any non-whitespace character
  
- `\b` – Matches a word boundary (start or end of a word)
  
- `\B` – Matches a non-word boundary


