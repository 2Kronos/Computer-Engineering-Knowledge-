sho# Available interfaces

![`Pasted image 20251009194906.png`](images/`Pasted image 20251009194906.png`)
### VyOS_1_GA-1 Interface Configuration

```Batch
configure
set interfaces ethernet eth0 address 10.1.12.1/30
set interfaces ethernet eth1 address 10.1.14.2/30
set interfaces ethernet eth2 address 10.1.13.1/30
set interfaces loopback lo address 1.1.1.1/32
commit
save
exit
```

---
### VyOS_2_GA-1 Interface Configuration
```
configure
set interfaces ethernet eth0 address 10.1.12.2/30
set interfaces ethernet eth1 address 10.1.23.1/30
set interfaces ethernet eth2 address 10.1.24.1/30
set interfaces loopback lo address 2.2.2.2/32
commit
save
exit
```
-----
### VyOS_3_GA-1 Interface Configuration
```
configure
set interfaces ethernet eth0 address 10.1.23.2/30
set interfaces ethernet eth1 address 10.1.34.1/30
set interfaces ethernet eth2 address 10.1.13.2/30
set interfaces loopback lo address 3.3.3.3/32
commit
save
exit
```
----
### VyOS_4_GA-1 Interface Configuration
```
configure
set interfaces ethernet eth0 address 10.1.34.2/30
set interfaces ethernet eth1 address 10.1.14.1/30
set interfaces ethernet eth2 address 10.1.24.2/30
set interfaces loopback lo address 4.4.4.4/32 
commit
save
exit
```
-----
### VERIFICATION COMMANDS (run on each router)


# Show interface configuration

```
show interfaces
```
# Show IP addresses

```
show interfaces brief
```
# Show specific interface details

```
show interfaces ethernet eth0
show interfaces ethernet eth1
show interfaces ethernet eth2
show interfaces loopback lo
```


# Test connectivity to directly connected neighbors
# From VyOS_1:

```
ping 10.1.12.2 count 4    # Ping VyOS_2
ping 10.1.14.1 count 4    # Ping VyOS_4
ping 10.1.13.2 count 4    # Ping VyOS_3
```
# From VyOS_2:


```
ping 10.1.12.1 count 4    # Ping VyOS_1
ping 10.1.23.2 count 4    # Ping VyOS_3
ping 10.1.24.2 count 4    # Ping VyOS_4

```
# From VyOS_3:

```
ping 10.1.23.1 count 4    # Ping VyOS_2
ping 10.1.34.2 count 4    # Ping VyOS_4
ping 10.1.13.1 count 4    # Ping VyOS_1

```

# From VyOS_4:
```
ping 10.1.34.1 count 4    # Ping VyOS_3
ping 10.1.14.2 count 4    # Ping VyOS_1
ping 10.1.24.1 count 4    # Ping VyOS_2
```

# Sun
```bash
configure
set interfaces ethernet eth1 address 192.168.56.10/24
commit
save
exit
```
