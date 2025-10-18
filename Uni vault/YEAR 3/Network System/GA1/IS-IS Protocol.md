
## Theory 

- To understand how IS-IS works use the link below 
- You need to understand the different levels and the Network-Entity-Title
	[IS-IS](https://networklessons.com/is-is/introduction-to-is-is)

- To what the configurations do use the link below
	[IS-IS Configuration](https://docs.vyos.io/en/latest/configuration/protocols/isis.html)



## VyOS_1 IS-IS Configuration

bash

```bash
configure

set protocols isis net 49.0001.0000.0000.0001.00
set protocols isis level level-2
set protocols isis interface eth0
set protocols isis interface eth1
set protocols isis interface eth2
set protocols isis interface lo
commit
save
exit
```

---

## VyOS_2 IS-IS Configuration

bash

```bash
configure

set protocols isis net 49.0001.0000.0000.0002.00
set protocols isis level level-2
set protocols isis interface eth0
set protocols isis interface eth1
set protocols isis interface eth2
set protocols isis interface lo
commit
save
exit
```

---

## VyOS_3 IS-IS Configuration


```bash
configure

set protocols isis net 49.0001.0000.0000.0003.00
set protocols isis level level-2
set protocols isis interface eth0
set protocols isis interface eth1
set protocols isis interface eth2
set protocols isis interface lo
commit
save
exit
```

---

## VyOS_4 IS-IS Configuration


```bash
configure

set protocols isis net 49.0001.0000.0000.0004.00
set protocols isis level level-2
set protocols isis interface eth0
set protocols isis interface eth1
set protocols isis interface eth2
set protocols isis interface lo
commit
save
exit
```

