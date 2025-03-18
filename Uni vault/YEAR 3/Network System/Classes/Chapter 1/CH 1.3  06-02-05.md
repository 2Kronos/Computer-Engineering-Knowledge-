
# **The Network core

- Consists simply of a set of routers that are interconnected  by set of communication links 
- The internet core operation is based on a principle known as `packet swithing`
	- The end host take application level messages divide those messages into chunks of data put those chunks of data inside packets and send those packets into the Internet

## Two key network-core functions

- `Forwarding`
	- local action
	- Controlled by forwarding table
	- There is a forwarding table each in each and every route is in the Internet when a packet arrives a router will look inside the package for a destination address and then look up the destination address in each forwarding table and then transmit that incoming packet on the output link that leads to that destination
	- How are contents of the forwarding table created in the first place thats where we encounter the second key function known as routing
- `Routing`
- **Routing** is the global process of:
  - Determining the **source-to-destination paths** for packets.
  - Enabling packets to travel across networks from one point to another.

- **Routing algorithms** are used to:
  - Compute these paths efficiently.
  - Determine the best routes based on network conditions.

- **Forwarding tables** are created locally on each router:
  - These tables are essential for implementing the end-to-end forwarding path.
  - They guide routers on where to send incoming packets next.

# Packet-switching: store-and-forward 

- L bits per packet
    
- packet transmission delay: takes L/RL/R seconds to transmit (push out) LL-bit packet into link at RR bps
    
- **store and forward**: entire packet must arrive at router before it can be transmitted on next link
    

**One-hop numerical example:**

- L=10 KbitsL=10Kbits
    
- R=100 MbpsR=100Mbps
    
- one-hop transmission delay = 0.1 msec0.1msec
# Packet-switching: queueing

- `Queueing` occurs when work arrives faster than it can be serviced.
    
- If arrival rate (in bps) to link exceeds transmission rate (bps) of link for some period of time:
    - packets will queue, waiting to be transmitted on output link
    - packets can be dropped (lost) if memory (buffer) in router fills up

# Alternative to packet switching: Circuit switching

- **Circuit Switching Concept**:
	   Instead of sending data in packets, a dedicated communication path (or call) is established between the source and destination

- **Resource Allocation**: 
	  Before the call begins, all necessary network resources (bandwidth, links) are reserved along the entire path ensuring no delay because link capacity has been reserved.
- **Guaranteed Transmission**:
	   Since resources are pre-allocated, there is no queuing delay, and the only delay is due to signal propagation.
- **No Data Loss**: 
	  The dedicated link ensures that no data is lost because the transmission capacity is exclusively reserved for that call.
## Issues with Circuit swithing

- **Exclusive Resource Reservation**: Once a call is established, the allocated bandwidth is reserved solely for that call.
- **Inefficiency**: If no data is being transmitted, the reserved bandwidth remains idle and cannot be used by other calls.
- **Wasted Bandwidth**: Unused capacity is lost since no other transmission can utilize the allocated circuit, making circuit-switched networks inefficient.
  

## Packet switching vs Circuit switching

**Packet switching** is better for modern networks:

- **Efficient & scalable** (no dedicated path, dynamic routing).
- **Fault-tolerant** (reroutes if failure occurs).
- **Cost-effective** (better bandwidth usage).

**Circuit switching** is better for voice calls:

- **Low latency & reliable** (fixed path, no congestion).
- **Inefficient & costly** (reserved path even when idle).

🔹 **Packet switching wins** for internet and data communication! 🚀

# Internet structure 

Here’s the summary of the text in bullet points:

- **Network Peering**: Occurs when two networks are directly interconnected.  
- **Peering Locations**: Places where multiple networks interconnect are called **Internet Exchange Points (IXPs)** or **peering points**.  
- **Regional Networks**: These networks may form interconnections to provide access networks closer to users' locations.  

Let me know if you need further clarification! 😊


Here’s the summary of the text in bullet points:

- **Core of the Internet**:  
  - A small number of highly interconnected, large networks exist at the center.  
  - These are called **Tier 1 ISPs** (e.g., Level 3, Sprint, AT&T, NTT).  
  - They provide **national and international coverage**.

- **Regional Networks**:  
  - Located closer to the edge of the internet.  
  - Interconnect (peer) with each other and with Tier 1 providers.

- **Access Networks**:  
  - Located at the very edge of the network.  
  - Provide connectivity to end-users.

- **Content Provider Networks**:  
  - Examples include Google and Facebook.  
  - Operate private networks to connect their data centers and services to the internet.  
  - Sometimes bypass Tier 1 and regional ISPs for direct connectivity.

Let me know if you need further details! 😊