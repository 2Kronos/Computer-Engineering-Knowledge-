Here's the summary for the Link-State Routing section from Kurose’s Computer Networking: A Top-Down Approach, suitable for Obsidian. This section covers foundational concepts leading into Dijkstra’s algorithm, its operation, classification, complexity, and a key example. I've included a conceptual Mermaid diagram to help you visualize the process.

---

## Routing Algorithms: Overview

- Purpose: Determine a “good” path from source to destination in a network of routers.
    
- “Good” can mean:
    
    - Least-cost (default)
        
    - Fastest
        
    - Least-congested
        
- Paths are sequences of routers and connecting links between them.
    

---

## Graph Abstraction for Routing

- Network represented as a graph:
    
    - Nodes = routers
        
    - Edges = links
        
    - Each edge has an associated cost: c(a,b)
        
        - Can represent hop count, delay, inverse of bandwidth, etc.
            
        - If nodes not connected: cost = ∞
            

---

## Classification of Routing Algorithms

|Dimension|Types|
|---|---|
|Global Info|Link-State: all nodes have complete topology & link costs|
||Distance-Vector: only neighbors known, info exchanged iteratively|
|Scope|Centralized (e.g., Link-State) vs. Distributed (e.g., Distance-Vector)|
|Time Behavior|Static, Dynamic, or Quasi-static|
- In a **distributed routing algorithm**, path cost calculation is done **iteratively** by individual routers.
    
- No router has **complete global knowledge** of all link costs.
    
- Each router starts with the cost of its **directly connected links** (local view).
    
- Routers **exchange information** with neighbors and **iteratively update** their path costs.
    
- The **Bellman-Ford algorithm** is an example of this approach.
    
- It’s also called a **distance vector algorithm**, as it maintains a vector of the **least known costs** to all destinations.
- - **Routing algorithms** can be classified by how frequently they operate or update.
    
- **Static algorithms** use fixed paths that don’t change over time.
    
- **Dynamic algorithms** adjust routes in **real time** based on current network conditions.
    
- **Quasi-static algorithms** update routes **periodically**, not continuously.
---

## Link-State Routing Algorithm (Dijkstra’s Algorithm)

- Centralized algorithm: each router computes shortest path to all others.
    
- Input: Full network graph with all nodes and edge costs.
    
- Output: Least-cost path tree + forwarding table
    

### Key Variables

- c(a,b): cost of direct link between node a and b
    
- D(a): current least-cost estimate from source to node a
    
- p(a): predecessor of node a along path from source
    
- N’: set of nodes whose least-cost path is known
    

---

## Dijkstra's Algorithm: Steps

1. Initialize:
    
    - N’ = {source node}
        
    - For each node a:
        
        - D(a) = c(source, a) if connected; else ∞
            
2. Repeat until all nodes are in N’:
    
    - Choose node a not in N’ with the smallest D(a)
        
    - Add a to N’
        
    - For each neighbor b of a not in N’:
        
        - D(b) = min(D(b), D(a) + c(a,b))
            

---

## Mermaid Diagram: Dijkstra’s Algorithm Logic

```mermaid
flowchart TD
    A[Start at Source Node] --> B[Initialize D values and N']
    B --> C{All nodes in N'?}
    C -- No --> D[Pick node 'a' not in N' with min D(a)]
    D --> E[Add 'a' to N']
    E --> F[For each neighbor 'b' of 'a', update D(b)]
    F --> C
    C -- Yes --> G[Build forwarding table from predecessors]
```

---

## Complexity of Dijkstra's Algorithm

- Computational:
    
    - Loop runs N times (once per node)
        
    - Each pass: up to N comparisons → O(N²)
        
- Message Complexity:
    
    - Each router broadcasts its link state to all others
        
    - O(N²) total messages assuming optimized broadcast
        

---

## Pathological Case: Load-Dependent Link Costs

- If link costs are based on traffic load (e.g., queuing delay):
    
    - Dijkstra may cause unstable oscillation
        
    - All nodes switch routes in response to small load changes
        
    - Example: B, C, D oscillate clockwise/counter-clockwise around A
        

🧠 Insight: This behavior caused early algorithms (e.g., ARPANET) to avoid dynamic load-based metrics.
