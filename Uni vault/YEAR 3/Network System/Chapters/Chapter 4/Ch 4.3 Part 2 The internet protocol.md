

## Network Address Translation (NAT)

- NAT (Network Address Translation) enables multiple local devices to share a single public IPv4 address.
    
- Internal devices use private address spaces: 10/8, 172.16/12, or 192.168/16.
    
- NAT replaces source IP and port with its own public IP and a new port.
    
- It maintains a translation table to reverse the mapping for incoming packets.
    
- Benefits:
    
    - Only one public IP is needed.
        
    - Internal IPs can change without notifying the outside world.
        
    - Switching ISPs doesn't require renumbering internal devices.
        
    - Provides basic security: internal hosts aren't directly accessible from outside.
        
- Criticisms:
    
    - Violates end-to-end principle (layer 3 device alters transport-layer info).
        
    - NAT traversal is complex when external hosts initiate connections.
        

### Mermaid Diagram: NAT Workflow

```mermaid
sequenceDiagram
    participant Host as Internal Host (10.0.0.1:3345)
    participant NAT as NAT Router (138.76.29.7)
    participant Server as External Server (128.119.40.186:80)

    Host->>NAT: Send packet (src: 10.0.0.1:3345)
    NAT->>Server: Rewrites src to 138.76.29.7:5001
    Server->>NAT: Reply to 138.76.29.7:5001
    NAT->>Host: Maps back to 10.0.0.1:3345 and delivers
```

---

## IPv6: Motivation and Innovations

- Main reason: IPv4's 32-bit space (≈4.3 billion) is insufficient.
    
- IPv6 uses 128-bit addresses—effectively infinite.
    
- Other improvements:
    
    - Simplified, fixed-length headers → faster processing.
        
    - Removed: checksum, fragmentation, reassembly, and options (done by endpoints or via extensions).
        
    - Introduced flow label field for identifying packet flows.
        
- Traffic Class field: similar to IPv4's Type of Service; defines priority but policy left to ISPs.
    

### Mermaid Diagram: IPv4 vs. IPv6 Header Differences

```mermaid
graph TD

    IPv4[IPv4 Header] -->|Has| Checksum

    IPv4 -->|Has| Fragmentation

    IPv4 -->|Has| Options

    IPv6[IPv6 Header] -->|Removed| Checksum

    IPv6 -->|Removed| Fragmentation

    IPv6 -->|Removed| Options

    IPv6 -->|Added| FlowLabel[Flow Label]
```

---

## IPv6 Datagram Format (Key Fields)

- Source Address: 128 bits
    
- Destination Address: 128 bits
    
- Payload Length
    
- Next Header (e.g., Transmission Control Protocol or User Datagram Protocol)
    
- Hop Limit (like TTL)
    
- Traffic Class (priority)
    
- Flow Label (optional, for packet flows)
    

---

## IPv4 to IPv6 Transition

- Coexistence needed: can't switch the entire internet at once.
    
- Some routers are IPv4-only, some IPv6-only, and some dual-stack.
    
- Solution: Tunneling.
    

---

## Tunneling

- Encapsulates an IPv6 datagram inside an IPv4 datagram.
    
- Treats IPv4 network as a “virtual link” between two IPv6-capable routers.
    
- Enables IPv6 routers to communicate across an IPv4-only infrastructure.
    

### Mermaid Diagram: IPv6 Tunneling Through IPv4

```mermaid
graph TD
    A[IPv6 Router A] -->|IPv6 Datagram| B[Dual Router B]
    B -->|Encapsulate in IPv4| C[IPv4 Network]
    C -->|IPv4 Packet| D[Dual Router E]
    D -->|Extract IPv6| F[IPv6 Router F]
```

---

## Address Hierarchy and Aggregation

- ISPs receive blocks from regional registries (under ICANN — Internet Corporation for Assigned Names and Numbers).
    
- They divide and assign sub-blocks to customer organizations.
    
- Hierarchical model allows route summarization (aggregation).
    
- Longest prefix match is used to route accurately if an organization switches ISPs.
    

### Mermaid Diagram: Address Allocation Hierarchy

```mermaid
graph TD
    ICANN --> RIR[Regional Internet Registries]
    RIR --> ISP[ISP]
    ISP --> Org1[Customer Network]
    Org1 --> Host1[Host IP Address]
```

---

## Summary of Key Concepts in Slides 23–37

- NAT allows IPv4 reuse and hides internal network structure.
    
- IPv6 resolves address exhaustion and supports modern network demands.
    
- Tunneling ensures interoperability during transition.
    
- Address hierarchy enables scalable internet routing.
    
- Despite IPv6’s superiority, NAT and inertia keep IPv4 dominant.
    

---

## Final Integrated Mermaid Diagram: Related Concepts

```mermaid
graph TD
    NAT[NAT: Address Sharing] --> IPv4[IPv4 Address Space Limit]
    IPv4 --> IPv6[IPv6: New Protocol]
    IPv6 --> Tunneling[Transition: IPv6 in IPv4 Tunnel]
    IPv6 --> Flow[Flow Label: Per-flow Routing]
    IPv6 --> Hierarchy[Hierarchical Allocation]
    Hierarchy --> ICANN
```

