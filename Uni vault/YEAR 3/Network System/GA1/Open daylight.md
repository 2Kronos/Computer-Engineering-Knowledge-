
# Ubuntu IP: .105
# Router IP: .100

# ODL Postman Commands

## Check if the default Policy Exist

**GET:** `http://192.168.47.132:8181/rests/data/openconfig-routing-policy:routing-policy/openconfig-routing-policy:policy-definitions`

**Response from ODL:** ODL will return the default policy if it exists.

## Check for RIB Policy Config

**GET:** `http://192.168.47.132:8181/rests/data/openconfig-routing-policy:routing-policy?content=config`

**Response from ODL:** ODL will respond with RIB if it exists.

## 1. Configure a new protocol instance

**POST:** `http://192.168.47.132:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/protocols`

**BODY:**

```xml
<protocol xmlns="http://openconfig.net/yang/network-instance">
<name>bgp-to-r1</name>
<identifier xmlns:x="http://openconfig.net/yang/policy-types">x:BGP</identifier>
<bgp xmlns="urn:opendaylight:params:xml:ns:yang:bgp:openconfig-extensions">
<global>
<config>
<router-id>192.168.47.132</router-id>
<!-- <router-id>192.168.47.129</router-id> -->
<as>65002</as>
</config>
<apply-policy>
<config>
<default-export-policy>REJECT-ROUTE</default-export-policy>
<default-import-policy>REJECT-ROUTE</default-import-policy>
<import-policy>default-odl-import-policy</import-policy>
<export-policy>default-odl-export-policy</export-policy>
</config>
</apply-policy>
</global>
</bgp>
</protocol>
```

## 2. Verify the new protocol instance

**GET:** `http://192.168.47.132:8181/rests/data/bgp-rib:bgp-rib/rib=bgp-to-r1?content=nonconfig`

**Response from ODL:**

```json
{
  "bgp-rib:rib": [
    {
      "id": "bgp-to-r1",
      "peer": [
        {
          "peer-id": "bgp://192.168.47.135",
          "supported-tables": [
            {
              "afi": "bgp-types:ipv4-address-family",
              "safi": "bgp-types:unicast-subsequent-address-family",
              "send-receive": "receive"
            }
          ],
          "effective-rib-in": {
            "tables": [
              {
                "afi": "bgp-types:ipv4-address-family",
                "safi": "bgp-types:unicast-subsequent-address-family",
                "attributes": {
                  "uptodate": true
                },
                "bgp-inet:ipv4-routes": {
                  "ipv4-route": [
                    {
                      "path-id": 0,
                      "route-key": "192.168.135.1/32",
                      "prefix": "192.168.135.1/32",
                      "attributes": {
                        "origin": {
                          "value": "igp"
                        },
                        "multi-exit-disc": {
                          "med": 0
                        },
                        "local-pref": {
                          "pref": 100
                        },
                        "ipv4-next-hop": {
                          "global": "192.168.47.135"
                        }
                      }
                    },
                    {
                      "path-id": 0,
                      "route-key": "192.168.1.1/32",
                      "prefix": "192.168.1.1/32",
                      "attributes": {
                        "origin": {
                          "value": "igp"
                        },
                        "multi-exit-disc": {
                          "med": 0
                        },
                        "local-pref": {
                          "pref": 100
                        },
                        "ipv4-next-hop": {
                          "global": "192.168.47.135"
                        }
                      }
                    }
                  ]
                }
              }
            ]
          },
          "adj-rib-out": {
            "tables": [
              {
                "afi": "bgp-types:ipv4-address-family",
                "safi": "bgp-types:unicast-subsequent-address-family"
              }
            ]
          },
          "adj-rib-in": {
            "tables": [
              {
                "afi": "bgp-types:ipv4-address-family",
                "safi": "bgp-types:unicast-subsequent-address-family",
                "attributes": {
                  "uptodate": true
                },
                "bgp-inet:ipv4-routes": {
                  "ipv4-route": [
                    {
                      "path-id": 0,
                      "route-key": "192.168.135.1/32",
                      "prefix": "192.168.135.1/32",
                      "attributes": {
                        "origin": {
                          "value": "igp"
                        },
                        "multi-exit-disc": {
                          "med": 0
                        },
                        "local-pref": {
                          "pref": 100
                        },
                        "ipv4-next-hop": {
                          "global": "192.168.47.135"
                        }
                      }
                    },
                    {
                      "path-id": 0,
                      "route-key": "192.168.1.1/32",
                      "prefix": "192.168.1.1/32",
                      "attributes": {
                        "origin": {
                          "value": "igp"
                        },
                        "multi-exit-disc": {
                          "med": 0
                        },
                        "local-pref": {
                          "pref": 100
                        },
                        "ipv4-next-hop": {
                          "global": "192.168.47.135"
                        }
                      }
                    }
                  ]
                }
              }
            ]
          },
          "peer-role": "rr-client"
        }
      ],
      "loc-rib": {
        "tables": [
          {
            "afi": "bgp-types:ipv4-address-family",
            "safi": "bgp-types:unicast-subsequent-address-family",
            "attributes": {
              "uptodate": true
            },
            "bgp-inet:ipv4-routes": {
              "ipv4-route": [
                {
                  "path-id": 0,
                  "route-key": "192.168.135.1/32",
                  "prefix": "192.168.135.1/32",
                  "attributes": {
                    "origin": {
                      "value": "igp"
                    },
                    "multi-exit-disc": {
                      "med": 0
                    },
                    "local-pref": {
                      "pref": 100
                    },
                    "ipv4-next-hop": {
                      "global": "192.168.47.135"
                    }
                  }
                },
                {
                  "path-id": 0,
                  "route-key": "192.168.1.1/32",
                  "prefix": "192.168.1.1/32",
                  "attributes": {
                    "origin": {
                      "value": "igp"
                    },
                    "multi-exit-disc": {
                      "med": 0
                    },
                    "local-pref": {
                      "pref": 100
                    },
                    "ipv4-next-hop": {
                      "global": "192.168.47.135"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }
  ]
}
```

## 3. BGP ODL Server port binding

**PUT:** `http://192.168.47.132:8181/rests/data/odl-bgp-peer-acceptor-config:bgp-peer-acceptor-config=default`

**BODY:**

```xml
<bgp-peer-acceptor-config xmlns="urn:opendaylight:params:xml:ns:yang:odl-bgp-peer-acceptor-config">
<config-name>default</config-name>
<binding-address>0.0.0.0</binding-address>
<binding-port>1790</binding-port>
</bgp-peer-acceptor-config>
```

**NOTE:** At this point, you can verify if ODL is listening on 1790 by opening a terminal window on the host where ODL is running and issuing:

```bash
# 1) Best: socket summary with process name
sudo ss -ltnp | grep :1790
# or with a filter:
sudo ss -ltnp '( sport = :1790 )'
# 2) Alternative
sudo lsof -iTCP:1790 -sTCP:LISTEN -Pn
# 3) Old-school
sudo netstat -plnt | grep :1790
```

**Expected output:**

```
LISTEN 0 128 192.168.47.129:1790 0.0.0.0:* users:(("java",pid=1234,fd=...))
```

### From VyOS (or another host)

```bash
vyos@VyOSR1:~$ nc -vz 192.168.47.132 1790
```

**Output:**

```
Connection to 192.168.47.132 1790 port [tcp/*] succeeded!
```

## If it's not listening

Re-apply your acceptor:

- binding-address must be a real IP on ODL (or use 0.0.0.0)
- binding-port must be 1790

Restart ODL if needed, then re-run ss/lsof.

If the host is not listening on the port 1790, then you need to solve the port binding problem else BGP will not establish between ODL and VyOS1.

## 4. BGP Peering add the VyOS1 router as neighbor

**POST:** `http://192.168.47.132:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/openconfig-network-instance:protocols/protocol=openconfig-policy-types:BGP,bgp-to-r1/bgp-openconfig-extensions:bgp/neighbors`

**BODY:**

```xml
<neighbor xmlns="urn:opendaylight:params:xml:ns:yang:bgp:openconfig-extensions" >
<neighbor-address>192.168.47.135</neighbor-address>
<timers>
<config>
<hold-time>90</hold-time>
<connect-retry>10</connect-retry>
</config>
</timers>
<transport>
<config>
<remote-port>1790</remote-port>
<!--<local-address>192.0.2.5</local-address>-->
<passive-mode>true</passive-mode> <!-- ODL won't initiate -->
</config>
</transport>
<!-- <odlpol:neighbor-role>rr-client</odlpol:neighbor-role> -->
<config>
<peer-type>INTERNAL</peer-type>
<peer-as>65002</peer-as>
</config>
<afi-safis>
<afi-safi>
<afi-safi-name xmlns:x="http://openconfig.net/yang/bgp-types">x:IPV4-UNICAST</afi-safi-name>
<config>
<afi-safi-name xmlns:x="http://openconfig.net/yang/bgp-types">x:IPV4-UNICAST</afi-safi-name>
<enabled>true</enabled>
</config>
</afi-safi>
</afi-safis>
</neighbor>
```

## 5. BGP RIB Check (After BGP link is established)

**GET:** `http://192.168.47.132:8181/rests/data/bgp-rib:bgp-rib/rib=bgp-to-r1/peer=bgp%3A%2F%2F192.168.47.135?content=nonconfig`

**Response:**

```json
{
  "bgp-rib:peer": [
    {
      "peer-id": "bgp://192.168.47.135",
      "supported-tables": [
        {
          "afi": "bgp-types:ipv4-address-family",
          "safi": "bgp-types:unicast-subsequent-address-family",
          "send-receive": "receive"
        }
      ],
      "effective-rib-in": {
        "tables": [
          {
            "afi": "bgp-types:ipv4-address-family",
            "safi": "bgp-types:unicast-subsequent-address-family",
            "attributes": {
              "uptodate": true
            },
            "bgp-inet:ipv4-routes": {
              "ipv4-route": [
                {
                  "path-id": 0,
                  "route-key": "192.168.135.1/32",
                  "prefix": "192.168.135.1/32",
                  "attributes": {
                    "origin": {
                      "value": "igp"
                    },
                    "multi-exit-disc": {
                      "med": 0
                    },
                    "local-pref": {
                      "pref": 100
                    },
                    "ipv4-next-hop": {
                      "global": "192.168.47.135"
                    }
                  }
                },
                {
                  "path-id": 0,
                  "route-key": "192.168.1.1/32",
                  "prefix": "192.168.1.1/32",
                  "attributes": {
                    "origin": {
                      "value": "igp"
                    },
                    "multi-exit-disc": {
                      "med": 0
                    },
                    "local-pref": {
                      "pref": 100
                    },
                    "ipv4-next-hop": {
                      "global": "192.168.47.135"
                    }
                  }
                }
              ]
            }
          }
        ]
      },
      "adj-rib-out": {
        "tables": [
          {
            "afi": "bgp-types:ipv4-address-family",
            "safi": "bgp-types:unicast-subsequent-address-family"
          }
        ]
      },
      "adj-rib-in": {
        "tables": [
          {
            "afi": "bgp-types:ipv4-address-family",
            "safi": "bgp-types:unicast-subsequent-address-family",
            "attributes": {
              "uptodate": true
            },
            "bgp-inet:ipv4-routes": {
              "ipv4-route": [
                {
                  "path-id": 0,
                  "route-key": "192.168.135.1/32",
                  "prefix": "192.168.135.1/32",
                  "attributes": {
                    "origin": {
                      "value": "igp"
                    },
                    "multi-exit-disc": {
                      "med": 0
                    },
                    "local-pref": {
                      "pref": 100
                    },
                    "ipv4-next-hop": {
                      "global": "192.168.47.135"
                    }
                  }
                },
                {
                  "path-id": 0,
                  "route-key": "192.168.1.1/32",
                  "prefix": "192.168.1.1/32",
                  "attributes": {
                    "origin": {
                      "value": "igp"
                    },
                    "multi-exit-disc": {
                      "med": 0
                    },
                    "local-pref": {
                      "pref": 100
                    },
                    "ipv4-next-hop": {
                      "global": "192.168.47.135"
                    }
                  }
                }
              ]
            }
          }
        ]
      },
      "peer-role": "rr-client"
    }
  ]
}
```

## 6. Configure route reflector

**PUT:** `http://192.168.47.132:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/openconfig-network-instance:protocols/protocol=openconfig-policy-types:BGP,bgp-to-r1/bgp-openconfig-extensions:bgp/neighbors/neighbor=192.168.47.135/route-reflector`

**BODY:**

```xml
<route-reflector xmlns="urn:opendaylight:params:xml:ns:yang:bgp:openconfig-extensions">
<config>
<route-reflector-client>true</route-reflector-client>
<!-- optional but recommended: set an explicit cluster-id -->
<route-reflector-cluster-id>192.168.47.132</route-reflector-cluster-id>
</config>
</route-reflector>
```

## Verification Commands on ODL Box (Linux/Ubuntu/Karaf host)

```bash
# 1) Best: socket summary with process name
sudo ss -ltnp | grep :1790
# or with a filter:
sudo ss -ltnp '( sport = :1790 )'
# 2) Alternative
sudo lsof -iTCP:1790 -sTCP:LISTEN -Pn
# 3) Old-school
sudo netstat -plnt | grep :1790
```

**Good output looks like:**

```
LISTEN 0 128 192.168.47.129:1790 0.0.0.0:* users:(("java",pid=1234,fd=...))
```

(You might see 0.0.0.0:1790 or [::]:1790 — both are fine. The process should be java/karaf.)

## From VyOS (or any other host)

This checks reachability to that listener:

```bash
nc -vz 192.168.47.129 1790
```

- succeeded → TCP handshake completed; listener is up and reachable.
- connection refused → host reached but nothing is listening on 1790.
- timed out → likely firewall/path issue (packet dropped/blocked).

## If it's not listening

- Re-apply your acceptor:
    - binding-address must be a real IP on ODL (or use 0.0.0.0)
    - binding-port must be 1790
- Restart ODL if needed, then re-run ss/lsof.
- Quick log peek in Karaf:
    
    ```bash
    log:tail | grep -i 1790
    ```

----
# Kronos configuration


# Postman BGP Setup Guide - GA1 Assignment

## Your Network Details

- **Ubuntu (ODL Controller):** 192.168.x.105
- **Router (VyOS):** 192.168.x.100

---

## Step 1: Check Default Policy Exists

**Method:** GET  
**URL:** `http://192.168.x.105:8181/rests/data/openconfig-routing-policy:routing-policy/openconfig-routing-policy:policy-definitions`

**Expected Response:** ODL returns the default routing policies if they exist.

---

## Step 2: Check RIB Policy Config

**Method:** GET  
**URL:** `http://192.168.56.105:8181/rests/data/openconfig-routing-policy:routing-policy?content=config`

**Expected Response:** ODL returns RIB configuration if it exists.

---

## Step 3: Create BGP Protocol Instance

**Method:** POST  
**URL:** `http://192.168.56.105:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/protocols`

**Headers:**

- `Content-Type: application/xml`

**Body (XML):**

```xml
<protocol xmlns="http://openconfig.net/yang/network-instance">
<name>bgp-to-r1</name>
<identifier xmlns:x="http://openconfig.net/yang/policy-types">x:BGP</identifier>
<bgp xmlns="urn:opendaylight:params:xml:ns:yang:bgp:openconfig-extensions">
<global>
<config>
<router-id>192.168.56.105</router-id>
<as>65002</as>
</config>
<apply-policy>
<config>
<default-export-policy>REJECT-ROUTE</default-export-policy>
<default-import-policy>REJECT-ROUTE</default-import-policy>
<import-policy>default-odl-import-policy</import-policy>
<export-policy>default-odl-export-policy</export-policy>
</config>
</apply-policy>
</global>
</bgp>
</protocol>
```

**Expected Response:** 201 Created

---

## Step 4: Verify Protocol Instance Created

**Method:** GET  
**URL:** `http://192.168.56.105:8181/rests/data/bgp-rib:bgp-rib/rib=bgp-to-r1?content=nonconfig`

**Expected Response:** Returns the BGP RIB with peer information (will be empty initially if no peers connected yet).

---

## Step 5: Configure BGP Server Port Binding

**Method:** PUT  
**URL:** `http://192.168.56.105:8181/rests/data/odl-bgp-peer-acceptor-config:bgp-peer-acceptor-config=default`

**Headers:**

- `Content-Type: application/xml`

**Body (XML):**

```xml
<bgp-peer-acceptor-config xmlns="urn:opendaylight:params:xml:ns:yang:odl-bgp-peer-acceptor-config">
<config-name>default</config-name>
<binding-address>0.0.0.0</binding-address>
<binding-port>1790</binding-port>
</bgp-peer-acceptor-config>
```

**Expected Response:** 201 Created or 204 No Content

**Verify Listening:**

```bash
# On Ubuntu terminal (where ODL is running)
sudo ss -ltnp | grep :1790

# Expected output:
# LISTEN 0 128 0.0.0.0:1790 0.0.0.0:* users:(("java",pid=XXXX,fd=...))
```

---

## Step 6: Add VyOS Router as BGP Neighbor

**Method:** POST  
**URL:** `http://192.168.56.105:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/openconfig-network-instance:protocols/protocol=openconfig-policy-types:BGP,bgp-to-r1/bgp-openconfig-extensions:bgp/neighbors`

**Headers:**

- `Content-Type: application/xml`

**Body (XML):**

```xml
<neighbor xmlns="urn:opendaylight:params:xml:ns:yang:bgp:openconfig-extensions">
<neighbor-address>192.168.56.100</neighbor-address>
<timers>
<config>
<hold-time>90</hold-time>
<connect-retry>10</connect-retry>
</config>
</timers>
<transport>
<config>
<remote-port>1790</remote-port>
<passive-mode>true</passive-mode>
</config>
</transport>
<config>
<peer-type>INTERNAL</peer-type>
<peer-as>65002</peer-as>
</config>
<afi-safis>
<afi-safi>
<afi-safi-name xmlns:x="http://openconfig.net/yang/bgp-types">x:IPV4-UNICAST</afi-safi-name>
<config>
<afi-safi-name xmlns:x="http://openconfig.net/yang/bgp-types">x:IPV4-UNICAST</afi-safi-name>
<enabled>true</enabled>
</config>
</afi-safi>
</afi-safis>
</neighbor>
```

**Expected Response:** 201 Created

---

## Step 7: Verify BGP Neighbor Connection

**Method:** GET  
**URL:** `http://192.168.56.105:8181/rests/data/bgp-rib:bgp-rib/rib=bgp-to-r1/peer=bgp%3A%2F%2F192.168.56.100?content=nonconfig`

**Expected Response:** Should show BGP RIB data with routes from your VyOS router

---

## Step 8: Configure Route Reflector (Optional but Recommended)

**Method:** PUT  
**URL:** `http://192.168.x.105:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/openconfig-network-instance:protocols/protocol=openconfig-policy-types:BGP,bgp-to-r1/bgp-openconfig-extensions:bgp/neighbors/neighbor=192.168.x.100/route-reflector`

**Headers:**

- `Content-Type: application/xml`

**Body (XML):**

```xml
<route-reflector xmlns="urn:opendaylight:params:xml:ns:yang:bgp:openconfig-extensions">
<config>
<route-reflector-client>true</route-reflector-client>
<route-reflector-cluster-id>192.168.x.105</route-reflector-cluster-id>
</config>
</route-reflector>
```

**Expected Response:** 201 Created or 204 No Content

---

## Troubleshooting Checklist

- [ ] ODL is running on Ubuntu (.105)
- [ ] VyOS router (.100) has iBGP configured for AS 65002
- [ ] Both routers can ping each other
- [ ] Port 1790 is listening on Ubuntu: `sudo ss -ltnp | grep :1790`
- [ ] In Postman, use Basic Auth if required (check your ODL setup)
- [ ] Replace `x` with your actual subnet (e.g., 192.168.1.105)

---

## Screenshot Requirements for Report

1. **FIG: POSTMAN_BGP** – Capture Step 7 (Verify BGP Neighbor Connection) showing successful JSON/XML response with routes

---

## VyOS Verification Commands

Run these on your VyOS router to verify BGP is established:

```bash
show ip bgp summary          # Check BGP neighbor status
show ip bgp neighbors        # Detailed neighbor info
show ip route bgp            # BGP-learned routes
show ip bgp ipv4 unicast     # BGP IPv4 routes
```

Expected: Neighbor status should show "Established" with received/sent route counts.