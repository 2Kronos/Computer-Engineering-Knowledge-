## **SCF Results Processing - Detailed Analysis**

```python
scf_flow_data = {}  # Store for visualization
```
- **Dictionary initialization**: Creates empty dictionary to store flow values
- **Purpose**: Later used for network visualization and flow diagram generation
- **Key structure**: (source_node, destination_node) tuples as keys

```python
if flow_vars:
    print("="*60)
    print("SCF SOLUTION - LINK UTILIZATION")
    print("="*60)
    
    results = []
    total_flow_used = 0
```
- **flow_vars check**: Only process if solution exists (not None)
- **Section header**: Clear output separation for results
- **results list**: Will store dictionaries for each utilized link
- **total_flow_used**: Accumulator for weighted cost calculation

## **Edge Flow Extraction & Storage**

```python
    for (i, j) in G.edges():
        flow_ij = pulp.value(flow_vars[(i,j)])
        flow_ji = pulp.value(flow_vars[(j,i)])
        capacity = G[i][j]['capacity']
        weight = G[i][j]['weight']
```
- **G.edges()**: Iterates through all edges in the network
- **pulp.value()**: Extracts the solved value of LP variables
- **flow_ij**: Gets flow value from node i to j
- **flow_ji**: Gets flow value from node j to i (reverse direction)
- **capacity**: Retrieves maximum capacity from graph edge attribute
- **weight**: Retrieves cost coefficient from graph edge attribute

```python
        # Store flow data for visualization
        scf_flow_data[(i,j)] = flow_ij
        scf_flow_data[(j,i)] = flow_ji
```
- **Populates visualization dictionary**: Stores both directional flows
- **Key-value pairs**: (i,j) → flow_ij, (j,i) → flow_ji
- **Complete flow mapping**: All possible directional flows stored

## **Flow Analysis & Direction Determination**

```python
        if flow_ij > 0.01 or flow_ji > 0.01:
            if flow_ij > flow_ji:
                net_flow = flow_ij
                direction = f"{i}→{j}"
            else:
                net_flow = flow_ji
                direction = f"{j}→{i}"
```
- **Significant flow check**: > 0.01 Mbps threshold (avoids tiny numerical errors)
- **Dominant direction logic**: Determines which direction has more flow
- **net_flow**: Takes the larger of the two directional flows
- **direction string**: Creates arrow notation for display (e.g., "3→7")

```python
            utilization = (net_flow / capacity) * 100
```
- **Utilization calculation**: (actual_flow / maximum_capacity) × 100
- **Percentage format**: Converts ratio to percentage for readability
- **Example**: If flow = 20 Mbps, capacity = 45 Mbps → utilization = 44.44%

## **Results Collection & Cost Calculation**

```python
            results.append({
                'Link': direction,
                'Flow (Mbps)': net_flow,
                'Capacity (Mbps)': capacity,
                'Utilization (%)': utilization,
                'Cost': net_flow * weight
            })
```
- **Dictionary creation**: Stores all metrics for one link
- **Field structure**:
  - **Link**: Directional identifier (e.g., "3→7")
  - **Flow (Mbps)**: Actual flow value in Mbps
  - **Capacity (Mbps)**: Maximum allowed flow
  - **Utilization (%)**: Percentage of capacity used
  - **Cost**: Flow × weight (contribution to objective function)

```python
            total_flow_used += net_flow * weight
```
- **Cost accumulation**: Sums cost contributions across all utilized links
- **Mathematically**: Σ (flow × weight) for all links with significant flow
- **Note**: This differs from prob.objective which includes ALL edges

## **Results Presentation & Statistics**

```python
    df_scf = pd.DataFrame(results)
    print(df_scf.to_string(index=False))
    print()
```
- **DataFrame creation**: Converts results list to tabular format
- **to_string(index=False)**: Prints without row numbers for cleaner output
- **Display**: Shows all utilized links with their metrics

```python
    print(f"Total Cost: {total_flow_used:.2f}")
    print(f"Average Utilization: {df_scf['Utilization (%)'].mean():.2f}%")
    print(f"Max Utilization: {df_scf['Utilization (%)'].max():.2f}%")
    print()
```
- **Total Cost**: Sum of (flow × weight) for reporting
- **Average Utilization**: Mean of all utilization percentages
  - **Calculation**: Σ utilization / number_of_utilized_links
- **Max Utilization**: Highest utilization percentage in the network
  - **Identifies bottlenecks**: Links closest to capacity limits

```python
    # Save to CSV
    df_scf.to_csv('SCF_result.csv', index=False)
    print("✓ Saved: SCF_result.csv")
    print()
```
- **Data persistence**: Saves results to CSV file for external analysis
- **index=False**: Excludes DataFrame index from CSV (cleaner file)
- **Confirmation message**: User feedback that file was created

## **MCF Problem Definition**

```python
mcf_commodities = [
    {'k': 1, 'source': 3, 'dest': 7, 'demand': 128},
    {'k': 2, 'source': 4, 'dest': 9, 'demand': 192},
    {'k': 3, 'source': 5, 'dest': 11, 'demand': 256},
    {'k': 4, 'source': 6, 'dest': 13, 'demand': 320},
    {'k': 5, 'source': 7, 'dest': 1, 'demand': 384}
]
```
- **Multiple commodities**: 5 different source-destination pairs
- **Dictionary structure**: 
  - **k**: Commodity identifier (1-5)
  - **source**: Origin node for this commodity
  - **dest**: Destination node for this commodity  
  - **demand**: Flow requirement for this commodity
- **Total demand**: 128 + 192 + 256 + 320 + 384 = 1280 Mbps

```python
print("="*60)
print("MULTI-COMMODITY FLOW (MCF) PROBLEM")
print("="*60)
for comm in mcf_commodities:
    print(f"Commodity {comm['k']}: Node {comm['source']} → {comm['dest']}, "
          f"Demand = {comm['demand']} Mbps")
print(f"Total Demand: {sum(c['demand'] for c in mcf_commodities)} Mbps")
print()
```
- **Problem summary**: Displays all commodities and their demands
- **sum() comprehension**: Calculates aggregate demand across all commodities
- **List comprehension**: `c['demand'] for c in mcf_commodities` extracts all demands

## **MCF Solver Function - Enhanced Formulation**

```python
def solve_mcf_min_cost(G, commodities, scaling_factor=1.0):
    """
    Solve Multi-Commodity Min-Cost Flow using PuLP
    
    Decision Variables:
        f_k[i,j] = flow of commodity k on edge (i,j)
    
    Objective:
        Minimize Σ_k Σ_(i,j) weight[i,j] × f_k[i,j]
    
    Constraints:
        1. Flow conservation for each commodity k at each node
        2. Capacity: Σ_k f_k[i,j] ≤ capacity[i,j]
    """
```
- **Key differences from SCF**:
  - **Per-commodity flows**: f_k[i,j] instead of f[i,j]
  - **Double summation**: Σ_k Σ_(i,j) across commodities and edges
  - **Shared capacity**: Σ_k f_k[i,j] ≤ capacity (aggregate constraint)

```python
    # Scale demands
    scaled_commodities = [{**c, 'demand': c['demand'] * scaling_factor} 
                          for c in commodities]
```
- **Dictionary comprehension**: Creates new list with scaled demands
- **{**c, 'demand': ...}**: Copies existing keys and updates 'demand'
- **Scales all commodities** by the same factor uniformly

## **MCF Variable Creation**

```python
    prob = pulp.LpProblem("MCF_Min_Cost_Flow", pulp.LpMinimize)
    
    # Decision variables: flow for each commodity on each edge
    flow_vars = {}
    for comm in scaled_commodities:
        k = comm['k']
        for (i, j) in G.edges():
            flow_vars[(k,i,j)] = pulp.LpVariable(f"f_{k}_{i}_{j}", lowBound=0)
            flow_vars[(k,j,i)] = pulp.LpVariable(f"f_{k}_{j}_{i}", lowBound=0)
```
- **Three-dimensional variables**: (commodity, source, destination)
- **No upper bound in variable definition**: Capacity handled via constraints
- **Total variables**: 5 commodities × 14 edges × 2 directions = 140 variables

## **MCF Objective Function**

```python
    # Objective: Minimize total cost across all commodities
    cost_expr = []
    for comm in scaled_commodities:
        k = comm['k']
        for (i, j) in G.edges():
            weight = G[i][j]['weight']
            cost_expr.append(weight * flow_vars[(k,i,j)])
            cost_expr.append(weight * flow_vars[(k,j,i)])
    
    prob += pulp.lpSum(cost_expr), "Total_Cost"
```
- **Nested loops**: Iterates through commodities, then edges
- **Same weight for all commodities**: Cost structure identical across commodities
- **Objective**: Minimize Σ [Σ (weight × f_k) for all k] for all edges

## **MCF Flow Conservation Constraints**

```python
    # Constraint 1: Flow conservation for each commodity
    for comm in scaled_commodities:
        k = comm['k']
        source = comm['source']
        dest = comm['dest']
        demand = comm['demand']
        
        for node in G.nodes():
            if node == source:
                supply_val = demand
            elif node == dest:
                supply_val = -demand
            else:
                supply_val = 0
```
- **Per-commodity conservation**: Each commodity must satisfy its own flow balance
- **Independent supplies**: Each commodity has its own source/destination nodes

```python
            outgoing = [flow_vars[(k, node, neighbor)] for neighbor in G.neighbors(node)]
            incoming = [flow_vars[(k, neighbor, node)] for neighbor in G.neighbors(node)]
            
            prob += pulp.lpSum(outgoing) - pulp.lpSum(incoming) == supply_val, \
                    f"FlowConservation_Commodity_{k}_Node_{node}"
```
- **List comprehensions**: Collect all outgoing/incoming flows for this commodity
- **Constraint naming**: Includes commodity ID for debugging
- **Total constraints**: 5 commodities × 14 nodes = 70 flow conservation constraints

## **MCF Capacity Constraints - Critical Difference**

```python
    # Constraint 2: Total flow on each edge ≤ capacity
    for (i, j) in G.edges():
        total_flow_ij = [flow_vars[(comm['k'], i, j)] for comm in scaled_commodities]
        total_flow_ji = [flow_vars[(comm['k'], j, i)] for comm in scaled_commodities]
        
        capacity = G[i][j]['capacity']
        
        prob += pulp.lpSum(total_flow_ij) <= capacity, f"Capacity_{i}_{j}"
        prob += pulp.lpSum(total_flow_ji) <= capacity, f"Capacity_{j}_{i}"
```
- **Aggregate flow calculation**: Sum flows from ALL commodities on each edge
- **total_flow_ij**: List of all commodity flows from i→j
- **Capacity constraint**: Σ_k f_k[i,j] ≤ capacity[i,j]
- **Shared resource**: Different commodities compete for same link capacity
- **Total capacity constraints**: 14 edges × 2 directions = 28 constraints

## **MCF Solution Scaling**

```python
# Try solving MCF with scaling
print("Attempting to solve MCF...")
scaling_factor = 1.0

for iteration in range(max_iterations):
    prob_mcf, flow_vars_mcf, scaled_comms, is_feasible = solve_mcf_min_cost(
        G, mcf_commodities, scaling_factor
    )
```
- **Same scaling logic as SCF**: Progressive demand reduction
- **Scales all commodities uniformly**: Maintains relative demand proportions
- **More likely to need scaling**: Higher total demand (1280 vs 320 Mbps)

## **MCF Results Processing**

```python
mcf_flow_data = {}  # Store for visualization

if flow_vars_mcf:
    print("="*60)
    print("MCF SOLUTION - LINK UTILIZATION")
    print("="*60)
    
    link_results = []
```
- **Aggregate flow storage**: Unlike SCF, stores total flows across commodities
- **link_results**: Will contain aggregate utilization per link

```python
    for (i, j) in G.edges():
        capacity = G[i][j]['capacity']
        weight = G[i][j]['weight']
        
        # Sum flows across all commodities
        total_flow_ij = sum(pulp.value(flow_vars_mcf[(c['k'], i, j)]) 
                           for c in scaled_comms)
        total_flow_ji = sum(pulp.value(flow_vars_mcf[(c['k'], j, i)]) 
                           for c in scaled_comms)
```
- **Aggregate flow calculation**: Sums flows from all 5 commodities
- **Generator expression**: `pulp.value(flow_vars_mcf[(c['k'], i, j)]) for c in scaled_comms`
- **total_flow_ij**: Sum of all commodity flows from i→j
- **total_flow_ji**: Sum of all commodity flows from j→i

```python
        # Store for visualization
        mcf_flow_data[(i,j)] = total_flow_ij
        mcf_flow_data[(j,i)] = total_flow_ji
        
        if total_flow_ij > 0.01 or total_flow_ji > 0.01:
            net_flow = max(total_flow_ij, total_flow_ji)
            utilization = (net_flow / capacity) * 100
            
            link_results.append({
                'Link': f"{i}