
### HTML Lists  

#### Unordered Lists (`<ul>`)  
- **Purpose**: Display items with bullet points (no specific order).  
- **Syntax**:  
  ```html  
  <ul>  
    <li>Item 1</li>  
    <li>Item 2</li>  
  </ul>  
  ```  
- **Customization**:  
  - Change bullet style with CSS (`list-style-type`):  
    ```css  
    ul {  
      list-style-type: square; /* Options: disc, circle, none, etc. */  
    }  
    ```  

#### Ordered Lists (`<ol>`)  
- **Purpose**: Display items in a numbered/lettered sequence.  
- **Syntax**:  
  ```html  
  <ol>  
    <li>First item</li>  
    <li>Second item</li>  
  </ol>  
  ```  
- **Customization**:  
  - Modify numbering with CSS (`list-style-type`):  
    ```css  
    ol {  
      list-style-type: upper-roman; /* Options: decimal, lower-alpha, etc. */  
    }  
    ```  

#### Nested Lists  
- **Syntax**:  
  ```html  
  <ul>  
    <li>Parent Item  
      <ol>  
        <li>Sub-item 1</li>  
        <li>Sub-item 2</li>  
      </ol>  
    </li>  
  </ul>  
  ```  
- **Best Practice**: Always close tags properly to avoid rendering issues.  

---  
**Key Notes**:  
- Both `<ul>` and `<ol>` use `<li>` for list items.  
- CSS properties like `list-style-position` control bullet/number alignment.

----
