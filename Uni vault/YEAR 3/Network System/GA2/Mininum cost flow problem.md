
$$
min \sum_{all area} C_{ij}X_{ij}
$$

$x_{ij} =$ number of units of flow sent from node $i$ to node $j$ through arc $(i, j)$

$b_i =$ net supply (outflow — inflow) at node $i$

$c_{ij} =$ cost of transporting 1 unit of flow from node $i$ to node $j$ via arc $(i, j)$

$L_{ij} =$ lower bound on flow through arc $(i, j)$  
  (if there is no lower bound, let `$L_{ij} = 0$`)

`$U_{ij} =$` upper bound on flow through arc `$(i, j)$`  
  (if there is no upper bound, let `$U_{ij} = \infty$`)

### Flow balance constrainsts

$$\begin{align}
\sum_{j} X_{ij} - \sum_{k} X_{ki} \\
\text{foe each node i in the network}\\

L_{ij} <X_{ij} <U_{ij}

\end{align}$$
- All flow going out minus all flow going must equal to the net supply
- $b_i$ 

![[Pasted image 20251108122216.png]]

- 