# **23.1 Overview of Query Processing**

**Query Processing** refers to the activities involved in parsing, validating, optimizing, and executing a query. The main goal is to transform a high-level query (typically written in SQL) into a correct and efficient execution strategy in a low-level language (implementing relational algebra), and then execute that strategy to retrieve the required data.
\
**Query Optimization** is a critical part of query processing. Since the same high-level query can be transformed in many equivalent ways, the goal of optimization is to choose the strategy that minimizes resource usage — usually the total execution time or response time.

---

### Key Points:

1. **Dynamic vs. Static Optimization**:
   - **Dynamic Optimization**: The query is parsed, validated, and optimized each time it is run. This ensures up-to-date statistics but adds runtime overhead.
   - **Static Optimization**: The query is optimized once (like a compiled program). This reduces runtime overhead but may use outdated statistics. A hybrid approach can reoptimize when statistics change significantly.

2. **Query Processing Phases**:
   - **Decomposition**: Parsing, validation, and transformation into relational algebra.
   - **Optimization**: Choosing an efficient execution plan.
   - **Code Generation**: Generating executable code.
   - **Execution**: Running the query and returning results.

3. **Importance of Database Statistics**:
   - Accurate statistics (e.g., relation cardinality, distinct attribute values, index levels) are essential for cost estimation.
   - Statistics are updated periodically (e.g., nightly) to avoid performance degradation.

4. **Example 23.1**:
   - Illustrates how different relational algebra expressions for the same SQL query can lead to vastly different disk access costs.
   - Emphasizes the importance of performing **Selection operations early** to reduce the size of intermediate results.


### Summary:
Query processing transforms high-level queries into efficient execution plans. Optimization — whether dynamic or static — relies on database statistics to minimize resource usage. The structure and order of operations (like early selection) significantly impact performance.


----
# **23.2 Query Decomposition**

Query decomposition is the **first phase** of query processing, which transforms a high-level query into a relational algebra expression and checks for correctness.

---

### **Stages of Query Decomposition:**

**1. Analysis**
- Lexical and syntactic analysis of the query.
- Verifies that relations and attributes exist in the system catalog.
- Checks that operations are appropriate for the object types.
- Transforms the query into an internal representation (usually a **query tree**).

**2. Normalization**
- Converts the query predicate into a normalized form for easier manipulation.
- Two main forms:
  - **Conjunctive Normal Form (CNF)**: Sequence of conjuncts connected by **AND**.
  - **Disjunctive Normal Form (DNF)**: Sequence of disjuncts connected by **OR**.

**3. Semantic Analysis**
- Detects incorrectly formulated or contradictory queries.
- Uses:
  - **Relation Connection Graph**: Checks if all relations are connected via joins.
  - **Normalized Attribute Connection Graph**: Detects contradictory conditions (e.g., `maxRent > 500 AND maxRent < 200`).

**4. Simplification**
- Detects and eliminates redundant qualifications.
- Applies idempotency rules of Boolean algebra.
- Considers view definitions, access restrictions, and integrity constraints to simplify the query.

**5. Query Restructuring**
- Transforms the query into a more efficient form.
- Applies transformation rules to the relational algebra tree.
- Aims to improve performance by reordering operations and reducing intermediate result sizes.


![`Pasted image 20251106060215.png`](images/`Pasted image 20251106060215.png`)

### **Key Points:**
- Query decomposition ensures the query is **syntactically and semantically correct**.
- It simplifies and restructures the query to prepare it for **optimization**.
- The output is a **relational algebra tree** ready for heuristic or cost-based optimization.


-----
# **23.3 Heuristic Approach to Query Optimization**

The heuristic approach uses **transformation rules** to convert a relational algebra expression into a more efficient equivalent form without necessarily calculating costs.

---

### **23.3.1 Transformation Rules for Relational Algebra Operations**

![`Pasted image 20251106062448.png`](images/`Pasted image 20251106062448.png`)

**Specific Rules:**
- **Cascade Selection**: `σp∧q(R) = σp(σq(R))`
- **Commutative Selection**: `σp(σq(R)) = σq(σp(R))`
- **Projection Cascade**: Only the last projection in a sequence is needed
- **Commutative Join**: `R ⨝ S = S ⨝ R`
- **Associative Join**: `(R ⨝ S) ⨝ T = R ⨝ (S ⨝ T)`

---

### **23.3.2 Heuristic Processing Strategies**

![`Pasted image 20251106062516.png`](images/`Pasted image 20251106062516.png`)

**Detailed Strategies:**

1. **Perform Selection operations as early as possible**
   - Reduces the number of tuples for subsequent operations
   - Use rules to push selections down the query tree

2. **Combine Cartesian product with subsequent Selection into Join**
   - `σp(R × S) = R ⨝p S`
   - Avoids expensive Cartesian products

3. **Use associativity of binary operations to rearrange leaf nodes**
   - Execute most restrictive selections first
   - Performs maximum reduction before binary operations

4. **Perform Projection operations as early as possible**
   - Reduces the number of attributes
   - Decreases tuple size for subsequent operations

5. **Compute common expressions once**
   - Store and reuse results of common subexpressions
   - Particularly useful for view queries

---

### **Example Transformation Process:**

**Original Query:**
```
ΠpropertyNo,street(σprefType='Flat'∧ownerNo='CO93'(Client × Viewing × PropertyForRent))
```

**After Applying Heuristics:**
1. Push selections down
2. Convert Cartesian products to joins
3. Reorder joins using associativity
4. Push projections down

**Result:**
- More efficient execution plan
- Smaller intermediate relations
- Reduced overall processing cost

---

### **Key Benefits:**
- **Simple to implement**
- **Generally produces good plans**
- **Low computational overhead**
- **Doesn't require detailed statistics**

### **Limitations:**
- **Not guaranteed to find optimal plan**
- **May miss better execution strategies**
- **Doesn't consider actual data distribution**

This approach forms the foundation for most practical query optimizers and works well for typical database workloads.






---


# **23.4 Cost Estimation for the Relational Algebra Operations**
**23.4 Cost Estimation for the Relational Algebra Operations**

This section focuses on how a DBMS estimates the cost of different relational algebra operations to choose the most efficient execution strategy. The primary cost considered is the number of disk block accesses.

---

### **23.4.1 Database Statistics**

The optimizer relies on statistical information stored in the system catalog to estimate costs and intermediate result sizes.

**Key Statistics Stored:**
*   For each base relation `R`:
    *   `nTuples(R)`: Number of tuples (cardinality).
    *   `bFactor(R)`: Blocking factor (number of tuples per block).
    *   `nBlocks(R)`: Number of blocks required to store R, calculated as `[nTuples(R) / bFactor(R)]`.
*   For each attribute `A` of relation `R`:
    *   `nDistinctₐ(R)`: Number of distinct values for A.
    *   `minₐ(R)`, `maxₐ(R)`: Minimum and maximum values for A.
    *   `SCₐ(R)`: Selection Cardinality - the average number of tuples satisfying an equality condition on A. For non-key attributes, `SCₐ(R) = [nTuples(R) / nDistinctₐ(R)]`.
*   For each index `I`:
    *   `nLevelsₐ(I)`: Number of levels in the index.
    *   `nLfBlocksₐ(I)`: Number of leaf blocks in the index.

**Purpose:** These statistics allow the optimizer to predict how many tuples will be processed at each step and the associated I/O cost, which is crucial for comparing different execution plans.

---

### **23.4.2 Selection Operation (S = σ_p(R))**

The Selection operation retrieves tuples from a single relation `R` that satisfy a predicate `p`. The cost varies dramatically based on the file organization and available indexes.

**Main Implementation Strategies & Their Purpose:**

1.  **Linear Search (Full Table Scan)**
    *   **What it does:** Sequentially reads every block of the relation and checks every tuple against the predicate.
    *   **Purpose:** The default, fall-back method. Used when no index exists or when a large percentage of the table is being selected, making an index scan more expensive.
    *   **Cost:** `nBlocks(R)` (or `[nBlocks(R)/2]` for an equality condition on a key).

2.  **Binary Search**
    *   **What it does:** If the file is ordered on the attribute in the predicate, it uses a binary search to find the first matching tuple quickly.
    *   **Purpose:** Efficient for equality and range searches on ordered files.
    *   **Cost:** `[log₂(nBlocks(R))] + [SCₐ(R)/bFactor(R)] - 1`

3.  **Using an Index**
    *   **Primary Key (Equality):** Uses the index to find the single tuple directly.
        *   **Cost:** `nLevelsₐ(I) + 1`
    *   **Clustering Index (Equality):** The index points to blocks containing all tuples with the value. Reads those blocks sequentially.
        *   **Purpose:** Very efficient for selecting multiple tuples with the same value.
        *   **Cost:** `nLevelsₐ(I) + [SCₐ(R)/bFactor(R)]`
    *   **Secondary Index (Equality):** The index points to individual tuples, which may be scattered across different blocks.
        *   **Cost:** `nLevelsₐ(I) + [SCₐ(R)]`
    *   **Secondary Index (Inequality):** Scans the leaf nodes of the B⁺-tree to find the range of values.
        *   **Cost:** `nLevelsₐ(I) + [nLfBlocksₐ(I)/2 + nTuples(R)/2]`

---

### **23.4.3 Join Operation (T = (R ⋈_F S))**

The Join is often the most expensive operation. The goal is to minimize the cost of combining two relations.

**Main Implementation Strategies & Their Purpose:**

1.  **Block Nested Loop Join**
    *   **What it does:** For each block of the outer relation `R`, it reads every block of the inner relation `S` and compares all tuples within them.
    *   **Purpose:** A simple, general-purpose method that requires no indexes or sorting. It can be improved by using as many memory buffers as possible to reduce the number of scans of the inner relation.
    *   **Cost:** `nBlocks(R) + (nBlocks(R) * nBlocks(S))` (worst-case, with 1 buffer). Improves to `nBlocks(R) + nBlocks(S)` if the entire outer relation fits in memory.

2.  **Indexed Nested Loop Join**
    *   **What it does:** For each tuple in the outer relation `R`, it uses an index on the join attribute of the inner relation `S` to find matching tuples directly, instead of scanning all of `S`.
    *   **Purpose:** Much more efficient than nested loop join if an index exists on the inner relation's join attribute, especially if the outer relation is small.
    *   **Cost:** `nBlocks(R) + nTuples(R) * (cost of index lookup on S)`

3.  **Sort-Merge Join**
    *   **What it does:** First sorts both relations on their join attributes. Then, it merges the two sorted relations by scanning them once, much like the merge step of the merge-sort algorithm.
    *   **Purpose:** Excellent for when one or both relations are already sorted, or when the result needs to be sorted. Very efficient for large relations.
    *   **Cost:** Cost of sorting both relations (`nBlocks(R)*[log₂(nBlocks(R))] + nBlocks(S)*[log₂(nBlocks(S))]`) + cost of the merge (`nBlocks(R) + nBlocks(S)`).

4.  **Hash Join**
    *   **What it does:**
        *   **Partitioning Phase:** Both relations `R` and `S` are hashed on the join attribute into partitions using the same hash function.
        *   **Probing Phase:** For each partition of `R`, it reads it into memory, builds a hash table, and then scans the corresponding partition of `S` to find matching tuples.
    *   **Purpose:** Often the most efficient algorithm for equi-joins on large, unsorted relations. It minimizes I/O by dealing with small partitions.
    *   **Cost:** Approximately `3(nBlocks(R) + nBlocks(S))`, assuming partitions fit in memory.

---

### **23.4.4 Projection Operation (S = Π_{A1, A2, ..., Am}(R))**

Projection involves selecting specific attributes and eliminating duplicate tuples.

**Implementation Strategies & Purpose:**

1.  **Duplicate Elimination using Sorting**
    *   **What it does:** Projects out the unwanted attributes, then sorts the resulting tuples on all remaining attributes. Duplicate tuples become adjacent and are easily removed.
    *   **Purpose:** A straightforward and effective method. If the projection includes a key, sorting is unnecessary.
    *   **Cost:** `nBlocks(R)` (to project) + `nBlocks(R)*[log₂(nBlocks(R))]` (to sort).

2.  **Duplicate Elimination using Hashing**
    *   **What it does:** Uses a hash function on the projected attributes to distribute tuples into partitions. Duplicates are only possible within the same partition. Each partition is then processed in memory to remove duplicates.
    *   **Purpose:** Can be more efficient than sorting, especially if the number of hash partitions that can fit in memory is large.
    *   **Cost:** `nBlocks(R) + nBlocks(T)` (where T is the temporary projected relation).

---

### **23.4.5 Set Operations (T = R ∪ S, R ∩ S, R - S)**

*   **What they do:** Combine relations that are union-compatible.
*   **Implementation:** Typically implemented by first **sorting** both relations on the same attributes, then performing a single scan through both sorted relations to produce the union, intersection, or difference.
*   **Purpose:** Sorting brings matching tuples from both relations together, making the set operation efficient during the merge phase.
*   **Cost:** Cost of sorting both relations + `nBlocks(R) + nBlocks(S)` (for the merge).


----

# **23.5 Enumeration of Alternative Execution Strategies**

**23.5 Enumeration of Alternative Execution Strategies**

This section deals with how a DBMS searches through many possible execution plans for a query to find an optimal or near-optimal strategy.

---

### **23.5.1 Pipelining**

**Definition:** A technique where the output of one operation is passed directly to another operation without creating temporary relations on disk.

**Purpose:**
- Eliminates the cost of writing and reading temporary relations
- Reduces I/O overhead and improves performance

**How it works:**
- Operations are connected like a pipeline or assembly line
- Each operation processes tuples as they arrive and passes results to the next operation
- Implemented as separate processes or threads with buffers between them

![`Pasted image 20251106062538.png`](images/`Pasted image 20251106062538.png`)
**Limitations:**
- Not all algorithms support pipelining (e.g., sort-merge join requires sorted input)
- Memory constraints may limit pipelining effectiveness

---

### **23.5.2 Linear Trees**

**Definition:** Query execution trees where one input to each join is always a base relation.

**Types:**
- **Left-deep trees**: Right child is always a base relation
- **Right-deep trees**: Left child is always a base relation
- **Linear trees**: General case where one input is always base

![`Pasted image 20251106062554.png`](images/`Pasted image 20251106062554.png`)

**Advantages of Left-deep Trees:**
- Inner relations are always base relations (already materialized)
- Reduces search space significantly
- Enables fully pipelined execution strategies
- Compatible with dynamic programming optimization

---

### **23.5.3 Physical Operators and Execution Strategies**

**Physical Operator:** A specific algorithm implementing a logical database operation.

**Common Physical Operators:**
- `TableScan(R)`: Read all blocks of R in arbitrary order
- `SortScan(R, L)`: Read tuples sorted by attribute list L
- `IndexScan(R, p)`: Access tuples through index using predicate p
- `IndexScan(R, A)`: Retrieve entire relation using index on A

**Iterator Interface:**
- **Open()**: Initialize operator and allocate buffers
- **GetNext()**: Return next tuple in result
- **Close()**: Terminate operator and deallocate buffers

**Purpose:** Provides uniform interface that hides implementation details and naturally supports pipelining.

---

### **23.5.4 Reducing the Search Space**

**Restriction 1: Process Unary Operations On-the-Fly**
- Perform selections as relations are accessed
- Perform projections as results are generated
- Avoids creating intermediate relations

**Restriction 2: Avoid Cartesian Products**
- Never form Cartesian products unless explicitly specified in query
- Eliminates many inefficient execution strategies

**Restriction 3: Use Left-Deep Trees**
- Inner operand of each join is always a base relation
- Significantly reduces number of alternatives from O(n!) to O(2ⁿ)

**Impact:** Reduces search space from billions to thousands of possibilities for typical queries.

---

### **23.5.5 Enumerating Left-Deep Trees**

**Dynamic Programming Approach:**
- Works bottom-up, constructing optimal strategies for increasingly larger subsets of relations
- Retains only the cheapest strategy for each interesting order
- Prunes suboptimal strategies early

**Interesting Orders:** Intermediate results sorted by attributes that are useful for:
- Final ORDER BY clauses
- GROUP BY attributes  
- Subsequent join attributes

**Algorithm Steps:**
1. **Pass 1**: Find best access paths for single relations
2. **Pass 2**: Find best join strategies for pairs of relations
3. **Pass k**: Extend to k relations using results from previous passes
4. **Pass n**: Find optimal strategy for all relations

![`Pasted image 20251106062612.png`](images/`Pasted image 20251106062612.png`)

---

### **23.5.6 Semantic Query Optimization**

**Definition:** Using database constraints and semantic knowledge to transform queries.

**Examples:**
- If constraint says "no manager salary < 20000", query for managers with salary < 15000 can return empty result without execution
- Adding redundant predicates based on constraints to enable better index usage

**Purpose:** Leverages domain knowledge to eliminate unnecessary operations or enable better access paths.

---

### **23.5.7 Alternative Optimization Approaches**

**Simulated Annealing:**
- Models physical annealing process
- Accepts both good and (sometimes) bad moves to avoid local minima
- Good for very large search spaces

**Genetic Algorithms:**
- Simulates biological evolution
- Generates new strategies by combining and mutating existing ones
- Retains best strategies across generations

**Iterative Improvement:**
- Performs multiple local optimizations from random starting points
- Combines results to find global optimum

**A* Algorithm:**
- Artificial intelligence search technique
- Expands most promising strategies first
- Can find good solutions faster than dynamic programming

---

### **23.5.8 Distributed Query Optimization**

**Additional Challenges:**
- Must consider network communication costs
- Data fragmentation and replication across sites
- Need for distributed transaction coordination

**Extended Considerations:**
- Local vs. remote processing costs
- Data transfer between sites
- Parallel execution across multiple nodes


### **Key Insights:**
- Query optimization is about **intelligently searching** through possible execution plans
- **Pipelining** and **left-deep trees** are key techniques for reducing costs
- **Dynamic programming** efficiently finds optimal plans by pruning suboptimal alternatives
- Real-world optimizers combine multiple approaches to handle complex queries efficiently

----
# **23.6 Query Processing and Optimization for Advanced Queries**

This section explores how query processing and optimization techniques must be extended to support advanced features in Object-Relational DBMS (ORDBMS), particularly user-defined types (UDTs) and user-defined functions (UDFs).


### **Key Challenges with Advanced Queries**

**Traditional vs. Advanced Query Processing:**
- **Traditional**: Works well with standard data types and built-in functions
- **Advanced**: Must handle complex data types and custom functions with unknown costs

![`Pasted image 20251106062637.png`](images/`Pasted image 20251106062637.png`)

---

### **User-Defined Functions (UDFs) Processing**

**1. Query Flattening**
- **Purpose**: Transform UDF calls into standard relational algebra operations
- **Process**: Replace function calls with their underlying SQL implementations
- **Example**:
  ```sql
  -- Original with UDF
  SELECT * FROM TABLE(flatTypes()) WHERE branchNo = 'B003';
  
  -- After flattening
  SELECT * FROM PropertyForRent 
  WHERE type = 'Flat' AND branchNo = 'B003';
  ```
- **Benefit**: Enables standard optimization techniques

**2. UDF Cost Estimation**
- **Problem**: Optimizer doesn't know execution cost of external functions
- **Solution**: Provide cost information during UDF definition:
  - **Per-call CPU cost** (A)
  - **Percentage of argument bytes read** (B)
  - **CPU cost per byte** (C)
- **Total cost formula**: `A + C × (B × expected_argument_size)`

**3. Execution Strategy Selection**
- **Challenge**: UDFs may have high processing costs
- **Strategies**:
  - **Early evaluation**: Execute UDF immediately
  - **Late evaluation**: Execute UDF after filtering other conditions
  - **Client-side execution**: Offload UDF processing to client

![`Pasted image 20251106062658.png`](images/`Pasted image 20251106062658.png`)

---

### **Indexing for Advanced Queries**

**1. Function-based Indexing**
- **Purpose**: Index results of UDFs rather than raw data
- **Example**:
  ```sql
  CREATE INDEX nearPrimarySchoolIndex
  ON PropertyForRent USING B-tree (nearPrimarySchool(postcode));
  ```
- **Behavior**:
  - Index maintained automatically on insert/update/delete
  - Function computed during DML operations
  - Index used when UDF appears in WHERE clause

**2. Specialized Index Structures**
- **Problem**: B-trees insufficient for complex data types
- **Solutions**:
  - **R-trees**: For spatial and multidimensional data
  - **Quad trees**: For geographic information systems
  - **Grid files**: For scientific and imaging data
  - **GiST (Generalized Search Tree)**: Template for custom index structures

---

### **Security and Reliability Considerations**

**1. Execution Environment**
- **Problem**: UDF crashes could affect DBMS server
- **Solutions**:
  - **Interpreted languages**: SQL, Java (safer)
  - **External routines**: Run in separate address space
  - **Interprocess communication**: Isolate UDF execution

**2. Access Method Interface**
- **Purpose**: Allow custom index implementations
- **Requirements**: Must integrate with DBMS mechanisms:
  - Locking
  - Recovery
  - Buffer management
- **GiST Advantage**: Provides template requiring minimal coding

---

### **Optimization Heuristics for Advanced Queries**

**Modified Processing Strategies:**

1. **UDF Evaluation Ordering**
   - **Traditional**: Push all selections down
   - **Advanced**: Evaluate expensive UDFs after cheaper conditions

2. **Join Reordering with UDFs**
   - Consider UDF costs when determining join order
   - Perform restrictive operations before expensive UDF calls

3. **Parallel UDF Execution**
   - Execute independent UDFs concurrently
   - Distribute UDF processing across multiple processors

---

### **Real-world Implementation Example**

**Property Search with Spatial UDF:**
```sql
SELECT *
FROM PropertyForRent p, Staff s
WHERE p.staffNo = s.staffNo 
  AND p.nearPrimarySchool(p.postcode) < 2.0 
  AND p.city = 'Glasgow'
  AND s.fName = 'Ann' AND s.lName = 'Beech';
```

**Optimization Decisions:**
- Apply `city = 'Glasgow'` filter before UDF
- Use index on staff names before join
- Consider function-based index on `nearPrimarySchool()`
- Potentially execute UDF on client side

---

### **Summary**

**Key Extensions for Advanced Query Processing:**
- **Cost modeling** for UDFs
- **Query flattening** to enable standard optimization
- **Function-based indexing** for UDF results
- **Specialized index structures** for complex data
- **Security isolation** for external functions
- **Modified heuristics** that consider UDF characteristics

These extensions allow ORDBMS to maintain good performance while supporting the extensibility required for advanced applications.


-----

**23.7 Query Optimization in Oracle**

Oracle uses a sophisticated query optimizer that determines the most efficient way to execute SQL statements. The optimizer evaluates various execution plans and selects the one with the lowest cost.

---

## **23.7.1 Rule-Based and Cost-Based Optimization**

### **Rule-Based Optimizer (RBO)**
- **Purpose**: Uses predefined rules to determine execution strategy
- **Mechanism**: 15 ranked rules (1 = best, 15 = worst)
- **Key Rules**:
  - Rank 1: Single row by ROWID
  - Rank 4: Single row by unique/primary key
  - Rank 9: Single-column indexes
  - Rank 15: Full table scan (last resort)
![`Pasted image 20251106062719.png`](images/`Pasted image 20251106062719.png`)

**Example**:
```sql
SELECT propertyNo FROM PropertyForRent 
WHERE rooms > 7 AND city = 'London';
```
- Index on `city` (rank 9) vs Index on `rooms` (rank 11) vs Full scan (rank 15)
- **Choice**: Use city index (lowest rank)

**Limitation**: Doesn't consider data distribution or actual costs

### **Cost-Based Optimizer (CBO)**
- **Purpose**: Selects plan with minimal resource usage
- **Mechanism**: Uses database statistics to estimate costs
- **Optimization Modes**:
  - **Throughput**: Minimize total resource usage
  - **Response Time**: Minimize time to first row

![`Pasted image 20251106062747.png`](images/`Pasted image 20251106062747.png`)

---

## **23.7.2 Statistics Management**

### **Automatic Statistics Collection**
- **Purpose**: Maintain accurate data distribution information
- **Mechanism**: AutoTask infrastructure periodically gathers statistics
- **Methods**:
  - **DBMS_STATS package**: Manual statistics management
  - **Automatic sampling**: Determines optimal sample size

### **Statistics Types**:
- Table cardinality (number of rows)
- Number of distinct values per column
- Data distribution (min, max values)
- Index levels and leaf blocks

---

## **23.7.3 Histograms**

### **Purpose**
Capture data distribution for columns with non-uniform value distribution

### **Types of Histograms:**

#### **1. Width-Balanced Histograms**
- **Mechanism**: Divides data into equal-width ranges (buckets)
- **Storage**: Upper/lower bounds + count per bucket
- **Use Case**: Uniform distribution within buckets

![`Pasted image 20251106062816.png`](images/`Pasted image 20251106062816.png`)
#### **2. Height-Balanced Histograms**
- **Mechanism**: Creates buckets with approximately equal numbers of values
- **Storage**: Bucket endpoints + height
- **Use Case**: Oracle's default method

![`Pasted image 20251106062840.png`](images/`Pasted image 20251106062840.png`)

### **Example: Rooms Column Analysis**
- **Without histogram**: Assumes uniform distribution
- **With histogram**: Recognizes actual value distribution
- **Benefit**: Accurate selectivity estimation for `WHERE rooms > 9`

---

## **23.7.4 Hints**

### **Purpose**
Override optimizer decisions when user has better knowledge

### **Common Hints**:
```sql
/*+ INDEX(table_name index_name) */ -- Force index usage
/*+ FULL(table_name) */            -- Force full table scan
/*+ USE_NL(table1 table2) */       -- Force nested loops join
/*+ USE_MERGE(table1 table2) */    -- Force sort-merge join
```

### **Example**:
```sql
SELECT /*+ INDEX(staff sex_index) */ fName, lName 
FROM Staff WHERE sex = 'M';
```
- Forces use of index on `sex` column even if optimizer prefers full scan

---

## **23.7.5 Stored Execution Plans**

### **Purpose**
Preserve optimal execution plans to avoid re-optimization

### **Mechanism**:
- **CREATE OUTLINE**: Stores optimizer attributes
- **Reuse**: Subsequent executions use stored plan
- **Benefit**: Consistent performance for frequently executed queries

---

## **23.7.6 Execution Plan Viewing**

### **EXPLAIN PLAN Command**
- **Purpose**: Display the execution plan without executing
- **Output**: Written to PLAN_TABLE with operation details

### **Key Columns**:
- **OPERATION**: Internal operation performed
- **OBJECT_NAME**: Table/index used
- **COST**: Estimated cost (CBO only)
- **CARDINALITY**: Estimated rows processed

### **Example Output**:
```
0 SELECT STATEMENT
1  SORT ORDER BY
2   NESTED LOOPS
3    TABLE ACCESS FULL PROPERTYFORRENT
4    TABLE ACCESS BY INDEX ROWID BRANCH
5     INDEX UNIQUE SCAN SYS_C007455
```

---

## **Summary of Oracle Optimization Features**

| **Feature** | **Purpose** | **When Used** |
|-------------|-------------|---------------|
| **Cost-Based Optimizer** | Select lowest cost plan | Default for most scenarios |
| **Rule-Based Optimizer** | Use predefined rules | Legacy systems, specific cases |
| **Histograms** | Capture data distribution | Columns with skewed data |
| **Hints** | Override optimizer | User has specific knowledge |
| **Stored Plans** | Preserve optimal plans | Production environments |
| **EXPLAIN PLAN** | View execution path | Query tuning and debugging |

Oracle's optimization approach combines statistical analysis with flexible user controls to balance automated optimization with expert intervention capabilities.
