## Delete commands
Remove a specific IP address:

```bash
delete interfaces ethernet eth2 address 10.1.13.1/30
```

**Remove ALL addresses from an interface:**

```bash
delete interfaces ethernet eth2 address
```

**Remove entire interface configuration:**

```bash
delete interfaces ethernet eth2
```

**Remove loopback:**

```bash
delete interfaces loopback lo
```

----

## Show interfaces 

 Show interface configuration

```
show interfaces
```
 Show IP addresses

```
show interfaces brief
```
 Show specific interface details

```
show interfaces ethernet eth0
show interfaces ethernet eth1
show interfaces ethernet eth2
show interfaces loopback lo
```
