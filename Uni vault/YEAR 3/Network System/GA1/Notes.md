
#### Theory 

[IS-IS](https://networklessons.com/is-is/introduction-to-is-is)

-----
#### Topology

**Square perimeter:**

1. VyOS_1 ↔ VyOS_2 (eth0 to eth0)
2. VyOS_2 ↔ VyOS_3 (eth1 to eth0)
3. VyOS_3 ↔ VyOS_4 (eth1 to eth0)
4. VyOS_4 ↔ VyOS_1 (eth1 to eth1)

**Diagonal cross-connections:** 5. VyOS_1 ↔ VyOS_3 (eth2 to eth2) 6. VyOS_2 ↔ VyOS_4 (eth2 to eth2)

-----
#### IP Addressing Scheme
##### Proposed Addressing (using 10.0.0.0/8 private space)

**Link Subnets:**

- Link 1 (R1-R2): 10.1.12.0/30
    
    - R1 eth0: 10.1.12.1/30
    - R2 eth0: 10.1.12.2/30
- Link 2 (R2-R3): 10.1.23.0/30
    
    - R2 eth1: 10.1.23.1/30
    - R3 eth0: 10.1.23.2/30
- Link 3 (R3-R4): 10.1.34.0/30
    
    - R3 eth1: 10.1.34.1/30
    - R4 eth0: 10.1.34.2/30
- Link 4 (R4-R1): 10.1.14.0/30
    
    - R4 eth1: 10.1.14.1/30
    - R1 eth1: 10.1.14.2/30
- Link 5 (R1-R3 diagonal): 10.1.13.0/30
    
    - R1 eth2: 10.1.13.1/30
    - R3 eth2: 10.1.13.2/30
- Link 6 (R2-R4 diagonal): 10.1.24.0/30
    
    - R2 eth2: 10.1.24.1/30
    - R4 eth2: 10.1.24.2/30

**Loopback addresses (for IS-IS router-id):**

- R1: 1.1.1.1/32
- R2: 2.2.2.2/32
- R3: 3.3.3.3/32
- R4: 4.4.4.4/32

---

