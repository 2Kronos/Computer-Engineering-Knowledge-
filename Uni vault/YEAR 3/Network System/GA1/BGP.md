
# VyOS BGP Configuration - From Document

## Configure iBGP on VyOS_2

```bash
configure


set protocols bgp system-as 65002
set protocols bgp parameters router-id 192.168.56.100


set protocols bgp neighbor 192.168.56.105 description 'ODL iBGP'
set protocols bgp neighbor 192.168.56.105 remote-as 65002


set protocols bgp neighbor 192.168.56.105 timers connect 10
set protocols bgp neighbor 192.168.56.105 timers holdtime 90


set interfaces loopback lo address 192.168.56.100/32
set protocols bgp address-family ipv4-unicast
set protocols bgp neighbor 192.168.56.105 address-family ipv4-unicast
set protocols bgp address-family ipv4-unicast network 192.168.56.100/32


set protocols bgp neighbor 192.168.56.105 port 1790

commit
save
```

---

## Verification Commands

### Check if ODL is listening on port 1790

**On Ubuntu (ODL box):**
```bash
sudo ss -ltnp | grep :1790
```

Or with filter:
```bash
sudo ss -ltnp '( sport = :1790 )'
```


Expected output:
```
LISTEN 0 128 192.168.56.105:1790 0.0.0.0:* users:(("java",pid=1234,fd=...))
```

---

### From VyOS (or another host)

```bash
nc -vz 192.168.56.105 1790
```

Expected output:
```
Connection to 192.168.56.105 1790 port [tcp/*] succeeded!
```

---

## BGP Status Check

```bash
show bgp summary
show bgp neighbor
show bgp neighbor 192.168.56.105
```

---

## If it's not listening

Re-apply your acceptor on ODL:
- binding-address must be a real IP on ODL (or use 0.0.0.0)
- binding-port must be 1790

Restart ODL if needed, then re-run ss/lsof.

##### To undo all the BGP configuration you just entered, use this command:



```bash
configure
delete protocols bgp
commit
save
exit
```