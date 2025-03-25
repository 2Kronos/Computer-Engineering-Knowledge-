# Packet dela: four sources



- <u>Processing Delay</u>:  $D_{PROC}$
	  - Refers to the time taken to process a packet in a network device.  
	  - Includes tasks like:  
	    - **Forwarding table lookup**.  
	    - **Forwarding the packet through the switch**.  
	    - **Performing integrity checks**.  
	  - Typically very short, on the order of **microseconds or less**.


- <u>Queuing Delay </u>   $D_{QUEUE}$
	  - The second component of delay in networking.  
	  - Refers to the time a packet spends waiting in a queue at an output link before it can be transmitted.  
	  - The duration of queuing delay depends on:  
	    - The **congestion level** of the outgoing link.  
	    - Higher congestion leads to longer queuing delays.

 <u>Transmission Delay</u>  $D_{TRANS}$
   Occurs once a packet begins transmission.  
  - Refers to the time it takes to push **all the bits of the packet** into the outgoing link.  
  - Depends on:  
    - The **number of bits in the packet (L)**.  
    - The **transmission rate of the link (R)**.  
  - Calculated as:  
									    $D_{TRANS} = \frac{L}{R}$

- <u>Propagation Delay</u>  $D_{DROP}$
	  - The time it takes for a **single bit** to travel from the **sending side** of a link to the **receiving side**.  
	  - Depends on:  
	    - `D`-The **physical distance** between the sender and receiver.  
	    - `S`-The **propagation speed** of the medium (e.g., fiber, copper).  
	  - Unlike transmission delay, it is independent of the packet size or transmission rate.
	    
										$D_{DROP}= \frac{d}{s}$
- <u>Nodal processing</u>  $D_{NODAL}$

$D_{NODAL}=D_{PROC}+D_{QUEUE}+D_{TRANS}+D_{DROP}$

---

## Packet queuing delay (Revisited)


- **Traffic Intensity**:  
  - Defined as the ratio of **arrival rate of bits (λ)** to the **transmission rate of bits (R)**.  
  - Formula:  
    
    $\text{Traffic Intensity} = \frac{a \cdot L}{R}$
     
    Where:  
    - \(L\) = packet size in bits.  
    - \(R\) = transmission rate.  
    - (a) = arrival rate of packets.  

- **Interpretation of Traffic Intensity**:  
  - **Low Traffic Intensity** $\frac{a \cdot L}{R}$is small):  
    - Queues are seldom formed.  
    - Delays are minimal.  
  - **High Traffic Intensity** $\frac{a \cdot L}{R} > 1$:  
    - More work (bits) arrives than the system can handle.  
    - Delays become **infinite** as the queue backlog grows indefinitely over time.  

- **Graph of Queuing Delay vs. Traffic Intensity**:  
  - As traffic intensity approaches **1**, queuing delays increase **very rapidly**.  
  - Delays grow **exponentially** near full capacity.

# Through put

- **Throughput Limitation**:  
  - The throughput of a source-to-destination path is limited by the **capacity of the weakest link** in the path.  
  - This link is often referred to as the **bottleneck link**.  

- **Bottleneck Link**:  
  - The link with the **smallest transmission capacity** in the network.  
  - Determines the maximum achievable throughput for the entire path.

### Scenario 

- **Flow Interaction in Networks**:  
  - Multiple flows share network resources, affecting their achievable throughput.  
  - In the given scenario:  
    - **10 servers** and **10 clients** are connected.  
    - Each server has a dedicated connection to one client.  
    - A **shared link** in the center of the network has a capacity of **R**.  

- **Fair Bandwidth Sharing**:  
  - The shared link fairly divides its capacity among the 10 flows.  
  - Each flow gets a bandwidth of **R/10**.  

- **Per-Connection Throughput**:  
  - Determined by the **minimum capacity** along the path:  
    - $(R_s)$ (server link capacity).  
    - $(R_c)$ (client link capacity).  
    - $(R/10)$ (shared link capacity per flow).  
  - Formula:  
    
    $\text{Per-Connection Throughput} = \min(R_s, R_c, R/10)$
      

- **Practical Insight**:  
  - Bottleneck links are often at the **edge of the network** $e.g (R_s)  or (R_c) is smaller than (R/10))$  

