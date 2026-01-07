

## **Initial Setup & Imports**
```python
"""
GA2 Project: Min-Cost Flow Solver for NSFNET
Student: 222170972
Using PuLP (not Gurobi)
"""

import pulp
import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Patch
```
- **Documentation header** with project info
- **Import libraries**: PuLP for optimization, pandas for data, networkx for graphs, matplotlib for visualization

## **Load Network Topology**
```python
print("="*60)
print("LOADING NSFNET TOPOLOGY FROM CSV")
print("="*60)

# Read NSFNET links from CSV file
nsfnet_df = pd.read_csv("NSFNET_Links.csv")
print(f"Loaded {len(nsfnet_df)} edges from NSFNET_Links.csv")
print()
```
- **Header display** for clear output
- **Read CSV file** containing network link data
- **Print confirmation** of loaded data

## **Build Network Graph**
```python
# Create bidirectional graph from CSV
G = nx.Graph()
for _, row in nsfnet_df.iterrows():
    src = int(row['Source'])
    dst = int(row['Destination'])
    cap = int(row['Capacity_Mbps'])
    wt = int(row['Weight'])
    G.add_edge(src, dst, capacity=cap, weight=wt)
```
- **Initialize empty graph** using NetworkX
- **Iterate through CSV rows** to extract edge data
- **Add edges** with capacity and weight attributes
- Each edge stores its maximum capacity and cost weight

## **Network Summary**
```python
nodes = list(G.nodes())
edges = list(G.edges())

print("="*60)
print("NSFNET TOPOLOGY LOADED")
print("="*60)
print(f"Nodes: {len(nodes)}")
print(f"Edges: {len(edges)}")
print(f"Total Capacity: {len(edges) * 45} Mbps")
print()
```
- **Extract node and edge lists** from graph
- **Display network statistics**: node count, edge count, total capacity
- **Calculate total capacity** assuming 45Mbps per link

## **SCF Problem Definition**
```python
scf_source = 3  # Los Angeles
scf_dest = 7    # Ann Arbor
scf_demand = 320  # Mbps

print("="*60)
print("SINGLE-COMMODITY FLOW (SCF) PROBLEM")
print("="*60)
print(f"Source: Node {scf_source} (Los Angeles)")
print(f"Destination: Node {scf_dest} (Ann Arbor)")
print(f"Demand: {scf_demand} Mbps")
print()
```
- **Define SCF parameters**: source, destination, demand
- **Display problem setup** for single commodity flow
- 320 Mbps needs to flow from node 3 to node 7

## **SCF Solver Function - Setup**
```python
def solve_scf_min_cost(G, source, dest, demand, scaling_factor=1.0):
    """
    Solve Single-Commodity Min-Cost Flow using PuLP
    
    Mathematical Formulation:
    
    Decision Variables:
        f[i,j] = flow on edge (i,j)
    
    Objective:
        Minimize Σ weight[i,j] × f[i,j]
    
    Constraints:
        1. Flow conservation: Σ f[i,j] - Σ f[j,i] = supply[i]
        2. Capacity: 0 ≤ f[i,j] ≤ capacity[i,j]
        3. Supply vector: supply[source] = demand, supply[dest] = -demand, else 0
    """
    
    scaled_demand = demand * scaling_factor
```
- **Function definition** for SCF solver
- **Mathematical documentation** of the optimization problem
- **Scale demand** by factor (for feasibility testing)

## **SCF Solver - LP Problem Creation**
```python
    # Create LP problem
    prob = pulp.LpProblem("SCF_Min_Cost_Flow", pulp.LpMinimize)
    
    # Decision variables: flow on each edge (both directions)
    flow_vars = {}
    for (i, j) in G.edges():
        flow_vars[(i,j)] = pulp.LpVariable(f"f_{i}_{j}", lowBound=0, 
                                           upBound=G[i][j]['capacity'])
        flow_vars[(j,i)] = pulp.LpVariable(f"f_{j}_{i}", lowBound=0, 
                                           upBound=G[i][j]['capacity'])
```
- **Initialize LP problem** as minimization
- **Create decision variables** for flow in both directions
- **Set bounds**: 0 ≤ flow ≤ capacity for each edge

## **SCF Solver - Objective Function**
```python
    # Objective: Minimize total cost
    cost_expr = []
    for (i, j) in G.edges():
        weight = G[i][j]['weight']
        cost_expr.append(weight * flow_vars[(i,j)])
        cost_expr.append(weight * flow_vars[(j,i)])
    
    prob += pulp.lpSum(cost_expr), "Total_Cost"
```
- **Build cost expression** list
- **For each edge**: add cost for both directions (weight × flow)
- **Set objective**: minimize sum of all cost terms

## **SCF Solver - Flow Conservation Constraints**
```python
    # Constraints: Flow conservation at each node
    for node in G.nodes():
        # Determine supply/demand for this node
        if node == source:
            supply_val = scaled_demand
        elif node == dest:
            supply_val = -scaled_demand
        else:
            supply_val = 0
        
        # Outgoing flow - Incoming flow = supply
        outgoing = []
        incoming = []
        
        for neighbor in G.neighbors(node):
            outgoing.append(flow_vars[(node, neighbor)])
            incoming.append(flow_vars[(neighbor, node)])
        
        prob += pulp.lpSum(outgoing) - pulp.lpSum(incoming) == supply_val, \
                f"FlowConservation_Node_{node}"
```
- **For each node**: set supply/demand value
- **Source**: positive supply (generates flow)
- **Destination**: negative supply (consumes flow)  
- **Others**: zero supply (flow in = flow out)
- **Create constraint**: outgoing - incoming = supply

## **SCF Solver - Solution**
```python
    # Solve
    prob.solve(pulp.PULP_CBC_CMD(msg=0))
    
    # Check status
    status = pulp.LpStatus[prob.status]
    
    if status == "Optimal":
        return prob, flow_vars, scaled_demand, True
    else:
        return prob, None, scaled_demand, False
```
- **Solve LP** using CBC solver (silent mode)
- **Check solution status**
- **Return results**: problem, variables, scaled demand, feasibility flag

## **SCF Solution Attempt with Scaling**
```python
# Try solving with scaling if needed
print("Attempting to solve SCF with original demand...")
scaling_factor = 1.0
max_iterations = 20

for iteration in range(max_iterations):
    prob, flow_vars, scaled_demand, is_feasible = solve_scf_min_cost(
        G, scf_source, scf_dest, scf_demand, scaling_factor
    )
```
- **Start with full demand** (scaling_factor = 1.0)
- **Try up to 20 iterations** to find feasible solution
- **Call solver** with current scaling factor

## **SCF Scaling Logic**
```python
    if is_feasible:
        print(f"✓ FEASIBLE at scaling factor: {scaling_factor:.3f}")
        print(f"  Scaled demand: {scaled_demand:.1f} Mbps")
        print(f"  Objective value (total cost): {pulp.value(prob.objective):.2f}")
        scf_scaling = scaling_factor
        break
    else:
        print(f"✗ Infeasible at scaling {scaling_factor:.3f}, trying {scaling_factor*0.9:.3f}...")
        scaling_factor *= 0.9
```
- **If feasible**: store results and break loop
- **If infeasible**: reduce demand by 10% and retry
- **Progressively scale down** until solution found

## **SCF Results Processing**
```python
scf_flow_data = {}  # Store for visualization

if flow_vars:
    print("="*60)
    print("SCF SOLUTION - LINK UTILIZATION")
    print("="*60)
    
    results = []
    total_flow_used = 0
```
- **Initialize storage** for flow data
- **If solution exists**: process and display results
- **Prepare lists** for results and total cost calculation

## **SCF Link Flow Calculation**
```python
    for (i, j) in G.edges():
        flow_ij = pulp.value(flow_vars[(i,j)])
        flow_ji = pulp.value(flow_vars[(j,i)])
        capacity = G[i][j]['capacity']
        weight = G[i][j]['weight']
        
        # Store flow data for visualization
        scf_flow_data[(i,j)] = flow_ij
        scf_flow_data[(j,i)] = flow_ji
```
- **For each edge**: get flow values in both directions
- **Extract capacity and weight** from graph
- **Store flows** for later visualization

## **SCF Utilization Calculation**
```python
        if flow_ij > 0.01 or flow_ji > 0.01:
            if flow_ij > flow_ji:
                net_flow = flow_ij
                direction = f"{i}→{j}"
            else:
                net_flow = flow_ji
                direction = f"{j}→{i}"
            
            utilization = (net_flow / capacity) * 100
```
- **Only process edges** with significant flow (> 0.01)
- **Determine dominant flow direction**
- **Calculate utilization percentage**: (flow / capacity) × 100

## **SCF Results Collection**
```python
            results.append({
                'Link': direction,
                'Flow (Mbps)': net_flow,
                'Capacity (Mbps)': capacity,
                'Utilization (%)': utilization,
                'Cost': net_flow * weight
            })
            
            total_flow_used += net_flow * weight
```
- **Store link statistics** in results list
- **Calculate link cost**: flow × weight
- **Accumulate total cost** across all links

## **SCF Results Display & Save**
```python
    df_scf = pd.DataFrame(results)
    print(df_scf.to_string(index=False))
    print()
    print(f"Total Cost: {total_flow_used:.2f}")
    print(f"Average Utilization: {df_scf['Utilization (%)'].mean():.2f}%")
    print(f"Max Utilization: {df_scf['Utilization (%)'].max():.2f}%")
    print()
    
    # Save to CSV
    df_scf.to_csv('SCF_result.csv', index=False)
    print("✓ Saved: SCF_result.csv")
    print()
```
- **Create DataFrame** from results
- **Display summary statistics**: total cost, average/max utilization
- **Save results** to CSV file

This covers the first half (SCF part) of the code. Would you like me to continue with the MCF (Multi-Commodity Flow) section?




## here

This code implements a **Min-Cost Flow Solver** for network routing problems using linear programming. Let me break down the key calculations:

## Core Mathematical Formulations

### 1. **Single-Commodity Flow (SCF) Problem**

**Objective Function:**
```python
Minimize: Σ weight[i,j] × f[i,j] for all edges (i,j)
```
- Sum of (edge weight × flow) across all used edges

**Constraints:**
- **Flow Conservation:** `Σ outgoing_flow - Σ incoming_flow = supply[node]`
  - Source node: supply = +demand
  - Destination node: supply = -demand  
  - Other nodes: supply = 0
- **Capacity:** `0 ≤ f[i,j] ≤ capacity[i,j]`

### 2. **Multi-Commodity Flow (MCF) Problem**

**Objective Function:**
```python
Minimize: Σ_k Σ_(i,j) weight[i,j] × f_k[i,j]
```
- Sum across all commodities and all edges

**Additional Constraint:**
- **Shared Capacity:** `Σ_k f_k[i,j] ≤ capacity[i,j]`
  - Total flow from all commodities on an edge cannot exceed capacity

## Key Calculations Explained

### **Flow Scaling**
```python
scaled_demand = demand * scaling_factor
```
- If original demand is infeasible, progressively reduce by 10% (`scaling_factor *= 0.9`)
- Ensures solution exists within network capacity limits

### **Link Utilization**
```python
utilization = (net_flow / capacity) * 100
```
- **net_flow**: Actual flow passing through the link
- **capacity**: Maximum capacity of the link
- Shows what percentage of link capacity is being used

### **Total Cost Calculation**
```python
total_flow_used += net_flow * weight
```
- **Weight**: Cost metric per unit flow on each link
- Represents overall "expense" of routing pattern

### **Flow Variables**
- **SCF**: `f[i,j]` - flow from node i to j
- **MCF**: `f_k[i,j]` - flow of commodity k from node i to j
- Both directions modeled separately: `(i,j)` and `(j,i)`

## Solution Process

1. **Define LP Problem** with objective and constraints
2. **Solve** using PuLP's CBC solver
3. **Extract Results** by evaluating decision variables:
   ```python
   flow_value = pulp.value(flow_vars[(i,j)])
   ```
4. **Calculate Metrics**: utilization, total cost, average/max utilization

## Output Metrics
- **Individual link flows** and utilization percentages
- **Total system cost** (objective value)
- **Average utilization** across all used links
- **Maximum utilization** (identifies bottlenecks)

The code essentially finds the **cheapest way to route traffic** through the network while respecting capacity limits and flow conservation rules.

# HERE




I'll explain the code in much greater detail, focusing on the mathematical calculations and implementation specifics:

## **Initial Setup & Imports - Detailed Breakdown**

```python
"""
GA2 Project: Min-Cost Flow Solver for NSFNET
Student: 222170972
Using PuLP (not Gurobi)
"""
```
- **Project metadata**: Identifies this as a Graph Algorithms project
- **Student ID**: 222170972 for academic tracking
- **Solver specification**: Explicitly states using PuLP instead of commercial solver Gurobi

```python
import pulp
import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Patch
```
- **pulp**: Python LP library - creates and solves linear programming problems
- **pandas**: Data manipulation - used for reading CSV and creating result tables
- **networkx**: Graph theory library - builds and analyzes network topology
- **matplotlib.pyplot**: Visualization - creates network diagrams and flow charts
- **numpy**: Numerical computing - used for mathematical operations
- **matplotlib.patches.Patch**: Custom legend elements - for creating colored legend boxes

## **Network Loading - Detailed Analysis**

```python
print("="*60)
print("LOADING NSFNET TOPOLOGY FROM CSV")
print("="*60)
```
- **Visual separators**: 60 equals signs create clear section boundaries in output
- **Section headers**: Help organize console output for readability

```python
# Read NSFNET links from CSV file
nsfnet_df = pd.read_csv("NSFNET_Links.csv")
print(f"Loaded {len(nsfnet_df)} edges from NSFNET_Links.csv")
print()
```
- **pd.read_csv()**: Reads comma-separated values file into DataFrame
- **Expected CSV structure**: Columns: Source, Destination, Capacity_Mbps, Weight
- **len(nsfnet_df)**: Counts number of rows/edges in the dataset
- **f-string formatting**: Dynamic output showing exact edge count loaded

```python
# Create bidirectional graph from CSV
G = nx.Graph()
for _, row in nsfnet_df.iterrows():
    src = int(row['Source'])
    dst = int(row['Destination'])
    cap = int(row['Capacity_Mbps'])
    wt = int(row['Weight'])
    G.add_edge(src, dst, capacity=cap, weight=wt)
```
- **nx.Graph()**: Creates undirected graph object
- **_.iterrows()**: Iterates through DataFrame rows, _ ignores index
- **int() conversions**: Ensure numeric values from CSV (could be strings)
- **G.add_edge()**: Adds edge with attributes:
  - **capacity**: Maximum flow allowed on this link (Mbps)
  - **weight**: Cost per unit flow on this link (used in objective function)

```python
nodes = list(G.nodes())
edges = list(G.edges())

print("="*60)
print("NSFNET TOPOLOGY LOADED")
print("="*60)
print(f"Nodes: {len(nodes)}")
print(f"Edges: {len(edges)}")
print(f"Total Capacity: {len(edges) * 45} Mbps")
print()
```
- **G.nodes()**: Returns all node identifiers
- **G.edges()**: Returns all edge pairs
- **len(edges) * 45**: Calculates theoretical maximum capacity assuming uniform 45Mbps per link
- **This assumes** each of the 14 NSFNET links has 45Mbps capacity

## **SCF Problem Definition - Mathematical Setup**

```python
scf_source = 3  # Los Angeles
scf_dest = 7    # Ann Arbor
scf_demand = 320  # Mbps
```
- **Single Commodity Flow (SCF)**: One source-destination pair
- **Node 3 → Node 7**: Represents Los Angeles to Ann Arbor traffic
- **320 Mbps demand**: Amount of data to be routed through network

```python
print("="*60)
print("SINGLE-COMMODITY FLOW (SCF) PROBLEM")
print("="*60)
print(f"Source: Node {scf_source} (Los Angeles)")
print(f"Destination: Node {scf_dest} (Ann Arbor)")
print(f"Demand: {scf_demand} Mbps")
print()
```
- **Problem statement display**: Clear communication of what's being solved
- **Geographic context**: Helps understand real-world significance

## **SCF Solver Function - Mathematical Formulation**

```python
def solve_scf_min_cost(G, source, dest, demand, scaling_factor=1.0):
    """
    Solve Single-Commodity Min-Cost Flow using PuLP
    
    Mathematical Formulation:
    
    Decision Variables:
        f[i,j] = flow on edge (i,j)
    
    Objective:
        Minimize Σ weight[i,j] × f[i,j]
    
    Constraints:
        1. Flow conservation: Σ f[i,j] - Σ f[j,i] = supply[i]
        2. Capacity: 0 ≤ f[i,j] ≤ capacity[i,j]
        3. Supply vector: supply[source] = demand, supply[dest] = -demand, else 0
    """
```
- **Function parameters**:
  - **G**: Network graph with capacities and weights
  - **source**: Origin node where flow enters network
  - **dest**: Destination node where flow exits network  
  - **demand**: Total flow amount to be routed
  - **scaling_factor**: Multiplier to reduce demand if infeasible

- **Mathematical notation**:
  - **f[i,j]**: Decision variable representing flow from node i to j
  - **Σ**: Summation over all relevant edges
  - **weight[i,j]**: Cost coefficient in objective function
  - **supply[i]**: Net flow generation/consumption at node i

```python
    scaled_demand = demand * scaling_factor
```
- **Demand scaling**: Multiplies original demand by scaling factor
- **Purpose**: If 320Mbps is too much for network capacity, reduce proportionally
- **Example**: scaling_factor = 0.9 → 320 × 0.9 = 288 Mbps actual demand

## **LP Problem Creation - Technical Implementation**

```python
    # Create LP problem
    prob = pulp.LpProblem("SCF_Min_Cost_Flow", pulp.LpMinimize)
```
- **pulp.LpProblem()**: Creates new linear programming problem instance
- **"SCF_Min_Cost_Flow"**: Problem name for identification
- **pulp.LpMinimize**: Specifies this is a minimization problem

```python
    # Decision variables: flow on each edge (both directions)
    flow_vars = {}
    for (i, j) in G.edges():
        flow_vars[(i,j)] = pulp.LpVariable(f"f_{i}_{j}", lowBound=0, 
                                           upBound=G[i][j]['capacity'])
        flow_vars[(j,i)] = pulp.LpVariable(f"f_{j}_{i}", lowBound=0, 
                                           upBound=G[i][j]['capacity'])
```
- **flow_vars dictionary**: Maps (node1, node2) tuples to LP variables
- **pulp.LpVariable()**: Creates decision variable with:
  - **name**: "f_i_j" format for identification
  - **lowBound=0**: Flow cannot be negative
  - **upBound=capacity**: Flow cannot exceed link capacity
- **Both directions**: Creates variables for i→j and j→i separately
- **Total variables**: 2 × number_of_edges variables created

## **Objective Function Construction**

```python
    # Objective: Minimize total cost
    cost_expr = []
    for (i, j) in G.edges():
        weight = G[i][j]['weight']
        cost_expr.append(weight * flow_vars[(i,j)])
        cost_expr.append(weight * flow_vars[(j,i)])
```
- **cost_expr list**: Collects all cost terms from all edges
- **weight extraction**: Gets cost coefficient from graph edge attribute
- **Cost calculation**: For each edge direction, cost = weight × flow
- **Both directions included**: Even though traffic might flow primarily one way

```python
    prob += pulp.lpSum(cost_expr), "Total_Cost"
```
- **prob +=**: Adds objective function to LP problem
- **pulp.lpSum()**: Creates linear expression summing all cost terms
- **"Total_Cost"**: Label for the objective function
- **Complete objective**: Minimize Σ[weight(i,j) × f(i,j) + weight(j,i) × f(j,i)] for all edges

## **Flow Conservation Constraints - Core Mathematics**

```python
    # Constraints: Flow conservation at each node
    for node in G.nodes():
        # Determine supply/demand for this node
        if node == source:
            supply_val = scaled_demand
        elif node == dest:
            supply_val = -scaled_demand
        else:
            supply_val = 0
```
- **Node classification**:
  - **Source node**: Generates flow → positive supply (+demand)
  - **Destination node**: Consumes flow → negative supply (-demand)  
  - **Transit nodes**: Neither generate nor consume → zero supply

```python
        # Outgoing flow - Incoming flow = supply
        outgoing = []
        incoming = []
        
        for neighbor in G.neighbors(node):
            outgoing.append(flow_vars[(node, neighbor)])
            incoming.append(flow_vars[(neighbor, node)])
```
- **G.neighbors(node)**: Gets all nodes connected to current node
- **Outgoing flows**: All f[node, neighbor] variables
- **Incoming flows**: All f[neighbor, node] variables
- **Mathematically**: Σ f_out - Σ f_in = supply

```python
        prob += pulp.lpSum(outgoing) - pulp.lpSum(incoming) == supply_val, \
                f"FlowConservation_Node_{node}"
```
- **Add constraint**: Σ_outgoing - Σ_incoming = supply_value
- **Constraint naming**: "FlowConservation_Node_X" for debugging
- **One constraint per node**: Ensures flow balance throughout network

## **Solution Process**

```python
    # Solve
    prob.solve(pulp.PULP_CBC_CMD(msg=0))
    
    # Check status
    status = pulp.LpStatus[prob.status]
    
    if status == "Optimal":
        return prob, flow_vars, scaled_demand, True
    else:
        return prob, None, scaled_demand, False
```
- **prob.solve()**: Invokes CBC solver through PuLP
- **pulp.PULP_CBC_CMD(msg=0)**: Uses CBC solver with silent mode (no solver output)
- **pulp.LpStatus[prob.status]**: Gets human-readable solution status
- **Return values**:
  - **prob**: Solved problem object with objective value
  - **flow_vars**: Dictionary of flow variable values if optimal
  - **scaled_demand**: Actual demand used in solution
  - **Boolean**: True if optimal solution found

## **Demand Scaling Algorithm**

```python
# Try solving with scaling if needed
print("Attempting to solve SCF with original demand...")
scaling_factor = 1.0
max_iterations = 20

for iteration in range(max_iterations):
    prob, flow_vars, scaled_demand, is_feasible = solve_scf_min_cost(
        G, scf_source, scf_dest, scf_demand, scaling_factor
    )
```
- **Initial attempt**: scaling_factor = 1.0 (100% of original demand)
- **max_iterations = 20**: Prevents infinite loops
- **Loop control**: Tries progressively smaller demands until feasible

```python
    if is_feasible:
        print(f"✓ FEASIBLE at scaling factor: {scaling_factor:.3f}")
        print(f"  Scaled demand: {scaled_demand:.1f} Mbps")
        print(f"  Objective value (total cost): {pulp.value(prob.objective):.2f}")
        scf_scaling = scaling_factor
        break
```
- **Success case**: Store scaling factor and break loop
- **pulp.value(prob.objective)**: Extracts optimal objective value from solved problem
- **scf_scaling**: Records successful scaling factor for reporting

```python
    else:
        print(f"✗ Infeasible at scaling {scaling_factor:.3f}, trying {scaling_factor*0.9:.3f}...")
        scaling_factor *= 0.9
```
- **Failure case**: Reduce demand by 10% and retry
- **Geometric progression**: 1.0 → 0.9 → 0.81 → 0.729 → ...
- **Continues** until feasible solution found or max iterations reached

Would you like me to continue with the detailed explanation of the results processing and visualization sections?




