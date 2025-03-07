Querying data from an API in JavaScript involves using the `fetch` function, which is a built-in feature that allows you to send HTTP requests and handle responses asynchronously. Here’s a breakdown of how it works:

---

### **How to Query Data from an API using `fetch`**

1. **Basic Syntax**
    
    ```js
    fetch('https://api.example.com/data')
      .then(response => response.json()) // Convert response to JSON
      .then(data => console.log(data)) // Use the retrieved data
      .catch(error => console.error('Error:', error)); // Handle errors
    ```
    
    - The `fetch()` function sends a request to the API.
    - The `response.json()` method converts the response into a JavaScript object.
    - The `.then()` method handles the data after the request is completed.
    - The `.catch()` method handles any errors.
2. **Using `async/await` (Recommended)**
    
    ```js
    async function fetchData() {
      try {
        let response = await fetch('https://api.example.com/data');
        let data = await response.json();
        console.log(data);
      } catch (error) {
        console.error('Error:', error);
      }
    }
    fetchData();
    ```
    
    - `async` functions make it easier to read asynchronous code.
    - `await` pauses execution until the request is completed.
    - `try...catch` helps handle errors cleanly.
3. **Handling HTTP Headers**
    
    ```js
    fetch('https://api.example.com/data', {
      method: 'GET', // Other methods: POST, PUT, DELETE
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN' // If needed
      }
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Error:', error));
    ```
    
    - Headers are used to send additional information (like authentication tokens).
4. **Querying with URL Parameters**
    
    ```js
    fetch('https://api.example.com/data?user=123&limit=10')
      .then(response => response.json())
      .then(data => console.log(data))
      .catch(error => console.error('Error:', error));
    ```
    
    - You can append query parameters (`?key=value`) to customize the request.
5. **Handling Errors Properly**
    
    ```js
    async function fetchData() {
      try {
        let response = await fetch('https://api.example.com/data');
        if (!response.ok) {
          throw new Error(`HTTP Error! Status: ${response.status}`);
        }
        let data = await response.json();
        console.log(data);
      } catch (error) {
        console.error('Error:', error.message);
      }
    }
    fetchData();
    ```
    
    - `response.ok` checks if the response is successful.
    - If the status is not `200 OK`, it throws an error.

---

# Pokemon example

Your code queries the **PokéAPI** using the Fetch API to retrieve Pokémon data based on user input. Here's how the process works:

### **Step 1: Getting User Input**

- The user enters a Pokémon name into the `<input>` field (`id="PokemonName"`).
- When they click the **"Fetch Pokémon"** button (`id="fetchButton"`), an event listener triggers the `fetchData()` function.

### **Step 2: Fetching Data from the API**

- The `fetchData()` function retrieves the input value, trims extra spaces, and converts it to **lowercase** to match the API's URL structure.
- The function then sends an **HTTP GET request** to the PokéAPI:
    
    ```javascript
    const response = await fetch(`https://pokeapi.co/api/v2/pokemon/${pokemonName}`);
    ```
    
    - If the user enters `"pikachu"`, the request becomes:
        
        ```
        https://pokeapi.co/api/v2/pokemon/pikachu
        ```
        
    - The API responds with a **JSON object** containing data about the Pokémon.

### **Step 3: Handling the API Response**

- The response is checked using:
    
    ```javascript
    if (!response.ok) {
      throw new Error("Pokémon not found! Please check the name.");
    }
    ```
    
    - If the Pokémon **does not exist** or there is a typo, an error is thrown.
    - Otherwise, `response.json()` extracts the data as a JavaScript object.

### **Step 4: Extracting the Pokémon Sprite**

- Once the data is received, the function extracts the **front default sprite** (image) using:
    
    ```javascript
    const pokemonSprite = data.sprites.front_default;
    ```
    
    - This accesses the `sprites` property inside the API response.

### **Step 5: Displaying the Pokémon Sprite**

- The function updates the `<img>` element (`id="pokemonSprite"`) by setting its `src` attribute:
    
    ```javascript
    imgElement.src = pokemonSprite;
    imgElement.style.display = "block";
    ```
    
    - The image becomes visible, displaying the Pokémon.

### **Summary of API Query Flow:**

1. **User enters Pokémon name** → Clicks button.
2. **Fetch request sent** to `https://pokeapi.co/api/v2/pokemon/{name}`.
3. **API returns JSON response** with Pokémon details.
4. **Extracts the sprite** from `data.sprites.front_default`.
5. **Updates the webpage** to display the Pokémon image.

