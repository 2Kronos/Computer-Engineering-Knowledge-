
# **The Network core

- Consists simply of a set of routers that are interconnected  by set of communication links 
- The internet core operation is based on a principle known as `packet swithing`
	- The end host take application level messages divide those messages into chunks of data put those chunks of data inside packets and send those packets into the Internet

## Two key network-core functions

- `Forwarding(swithing and routing)`
	- local action
	- Controlled by forwarding table
	- There is a forwarding table each in each and every route is in the Internet when a packet arrives a router will look inside the package for a destination address and then look up the destination address in each forwarding table and then transmit that incoming packet on the output link that leads to that destination
	- How are contents of the forwarding table created in the first place thats where we encounter the second key function known as routing
- `Routing`
	- Global action 

# Packet-switching: store-and-forward 

- The packet must be fully received before any further action is taken.
- You can observe the bits and packets being gathered here.
- Once the packet has been completely received, it is forwarded to the next hop.
- This process is known as the store-and-forward operation of a packet-switched network.
-  Let's take a closer look at what happens when a packet arrives at a router for forwarding.

# Packet-switching: queueing

- If A and B are both transmitting a large number of packets simultaneously, congestion can occur.
- If too many packets arrive at a high rate, a queue of packets will form in the first-hop router.
- - Queues form at a router’s outbound link when incoming traffic exceeds its transmission capacity.
- When the arrival rate (in bits per second) on the input link surpasses the transmission rate of the output link for a period of time, packet queues develop.
- Queuing delays occur, causing packets to wait in the router instead of being forwarded immediately.
- Since router memory is limited, an excessively long queue can lead to memory exhaustion.
- If a router runs out of memory, incoming packets may have nowhere to be stored.
- In such cases, packets will be dropped or lost at that router.
- Additionally, packets can experience delays due to congestion.

# Alternative to packet switching: Circuit switching

- **Circuit Switching Concept**: Instead of sending data in packets, a dedicated communication path (or call) is established between the source and destination.
- **Resource Allocation**: Before the call begins, all necessary network resources (bandwidth, links) are reserved along the entire path.
- **Guaranteed Transmission**: Since resources are pre-allocated, there is no queuing delay, and the only delay is due to signal propagation.
- **No Data Loss**: The dedicated link ensures that no data is lost because the transmission capacity is exclusively reserved for that call.
## Issues with Circuit swithing

- **Exclusive Resource Reservation**: Once a call is established, the allocated bandwidth is reserved solely for that call.
- **Inefficiency**: If no data is being transmitted, the reserved bandwidth remains idle and cannot be used by other calls.
- **Wasted Bandwidth**: Unused capacity is lost since no other transmission can utilize the allocated circuit, making circuit-switched networks inefficient.