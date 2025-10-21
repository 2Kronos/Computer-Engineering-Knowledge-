
# VyOS BGP Configuration - From Document



## Step 1: Install Java 21 and OpenDaylight on Ubuntu

### 1.1 Install Java 21

bash

```bash
sudo apt update
sudo apt install -y openjdk-21-jdk
java --version
```

Expected output:

```
openjdk 21.0.X 2023-XX-XX
OpenJDK Runtime Environment (build 21.0.X+XX-Ubuntu-0ubuntu0XX.04.1)
```

### 1.2 Download and Extract Karaf

- Download [ODL Karaf 21.2](https://nexus.opendaylight.org/content/repositories/opendaylight.release/org/opendaylight/integration/karaf/0.21.2/) 
- Extract navigate to bin and run the command below to start ODL 

```bash
./karaf
```

Wait for it to fully start (2-5 minutes). You'll see the prompt:

```
opendaylight-user@root>
```

---
## Step 2: Install BGP Features in Karaf

### 2.1 Install BGP and RESTCONF Features


```bash
feature:install odl-bgpcep-bgp odl-restconf
```

This installs:

- **odl-bgpcep-bgp**: BGP/PCEP protocol support
- **odl-restconf**: REST API interface to query ODL

Wait for installation to complete (1-2 minutes). Prompt returns when done.

### 2.2 Verify Installation

bash

```bash
feature:list | grep bgp
```

Look for features showing **Started** status.


-----

## Step 3: Configure ODL BGP Acceptor Port (1790)


### 3.1 Verify ODL is Listening on Port 1790



```bash
exit  # Exit Karaf first
sudo ss -ltnp '(sport = :1790)'
```

Expected output:

```
LISTEN 0 128 *:1790 *:* users:(("java",pid=XXXX,fd=XXX))
```


## Step 4: Configure VyOS_2 BGP

---


- Firstly look if they are any other BGP configured 
```Bas
show bgp summary
```

- if they are configure run the commands below to dl

```bash
configure
delete protocols bgp
commit
save
exit
```
-----

## Step 5 Configure iBGP on VyOS_2

### Example

- UBUNTU IP: 103
- VyOs router IP: 10
- Your ethernet here is the ethernet you use for Ubuntu 


```bash
configure


set protocols bgp system-as 65002
set protocols bgp parameters router-id 192.168.56.10


set protocols bgp neighbor 192.168.56.103 description 'ODL iBGP'
set protocols bgp neighbor 192.168.56.103 remote-as 65002

set protocols bgp neighbor 192.168.56.103 update-source eth1

set protocols bgp neighbor 192.168.56.103 timers connect 10
set protocols bgp neighbor 192.168.56.103 timers holdtime 90


set interfaces loopback lo address 10.255.255.10/32
set protocols bgp address-family ipv4-unicast
set protocols bgp neighbor 192.168.56.103 address-family ipv4-unicast
set protocols bgp address-family ipv4-unicast network 10.255.255.10/32

# *CRITICAL: Enable BGP-LS for IS-IS topology sharing*
set protocols bgp address-family link-state


set protocols bgp neighbor 192.168.56.103 port 1790

commit
save
exit
```

---
8
## Verification Commands

### Check if ODL is listening on port 1790

**On Ubuntu (Not in ODL exit from that)*
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
nc -vz 192.168.56.103 1790
```

Expected output:
```
Connection to 192.168.56.103 1790 port [tcp/*] succeeded!
```

---

## BGP Status Check

```bash
show bgp summary
show bgp neighbor
show bgp neighbor 192.168.56.103 //Ubuntu IP
```

---


