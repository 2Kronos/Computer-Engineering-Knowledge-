## Delete commands
Remove a specific IP address:

```bash
configure
delete interfaces ethernet eth1 address 192.168.56.105/24
commit
save 
exit
```

**Remove ALL addresses from an interface:**

```bash
delete interfaces ethernet eth2 address
```

**Remove entire interface configuration:**

```bash
configure
delete interfaces ethernet eth1 192.168.56.105/24
commit
save 
exit
```

**Remove loopback:**

```bash
delete interfaces loopback lo
```

remove all configurations

```
sudo rm /config/config.boot
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
