

## What is a Loopback Address?

A **loopback interface** is a **virtual interface** that exists only in software - it's not a physical port on the router.

### Key Characteristics:

1. **Always Up**: Unlike physical interfaces (eth0, eth1, eth2) that can go down if a cable is unplugged, a loopback interface is **always available** as long as the router is running.
    
2. **Stable Identity**: It provides a permanent, reliable IP address for the router that doesn't depend on any physical link.
    
3. **Router ID**: In routing protocols like IS-IS, OSPF, and BGP, the loopback address is typically used as the **router-id** - a unique identifier for each router.
    

### Why Use Loopbacks?

### For IS-IS:

- **Router identification**: Each router needs a unique NET (Network Entity Title) address, and the loopback IP helps create this
- **Stability**: If a physical interface goes down, the router can still be identified by its loopback

### For BGP (with OpenDaylight):

- You'll establish the BGP session using the loopback address
- Even if a physical path changes, the BGP session stays up as long as _any_ route to the loopback exists

### Example:

```
VyOS_1: Loopback 1.1.1.1/32
VyOS_2: Loopback 2.2.2.2/32
VyOS_3: Loopback 3.3.3.3/32
VyOS_4: Loopback 4.4.4.4/32
```

The `/32` means it's a single host address (not a network).

**Think of it like**: Your physical interfaces are like your home address and work address, but your loopback is like your passport number - it identifies YOU regardless of where you are.

----
