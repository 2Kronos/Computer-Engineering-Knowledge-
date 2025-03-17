- **HTML Tags Overview**:
    
    - Tags describe the structure and content of a webpage.
    - Tags are enclosed in angle brackets: `<tag>` for opening and `</tag>` for closing.
    - An element includes the tag and its children.
    - Tags can have attributes to modify behavior.
- # Common Tags
    
`<html>`:
        - The outermost tag of every web page.
        - Contains `<head>` and `<body>` tags.
        - Often preceded by a `<!DOCTYPE>` declaration.
        - Has a `lang` attribute for the page language.
    - `<head>`:
        - Appears after `<html>` and before `<body>`.
        - Used for metadata, stylesheets, and scripts.
        - Common tags in `<head>`:
            - `<title>`: Specifies the page title.
            - `<meta>`: Includes metadata.
            - `<link>`: Links to external stylesheets.
            - `<script>`: Embeds JavaScript.
    - `<body>`:
        - Contains the main visible content of the page.
        - Can include tags like `<h1>`, `<p>`, `<img>`, and `<a>`.
- **Attributes**:
    
    - Attributes like `lang` (in `<html>`) and `alt` (in `<img>`) provide additional functionality.

## Div Tag

- The `<div>` tag is used to group and organize other elements in HTML.
- It takes up the full width of its container and starts on a new line (block-level element).
- It has no default style or special meaning but helps with layout and organization.
- You can style it with **CSS** (e.g., size, color, border) or use **JavaScript** for interaction.
- Split content vertically on a webpage 

### Example Code:

```html
<div style="background-color: lightblue; padding: 10px;">
    This is a section inside a div.
</div>
```

- **Explanation**: This `<div>` groups content and is styled with a background color and padding using CSS.

# Text and paragraphs

### Main Points:

- **`<p>` tag**:
    
    - Used for paragraphs of text.
    - Suitable for longer, block-level sections.
- **`<span>` tag**:
    
    - Used for small pieces of text.
    - Ideal for inline styling, like changing the color or font of specific words.

### Example Code:

<p>This is a paragraph of text.</p>  
<p>I love <span style="color: red;">coding</span>!</p>  


- **Explanation**:
    - `<p>` creates a paragraph.
    - `<span>` changes the color of the word "coding" using inline CSS.

- You can a div tag to do the same but a p tag automatically puts spaces between paragraphs and it is a better way to let the webpage know that some text belongs therr