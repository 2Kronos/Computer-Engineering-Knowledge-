
# Ubuntu IP:
# Router IP: .100
## Check if the default Policy Exist 

GET: http://192.168.47.132:8181/rests/data/openconfig-routing-policy:routing-policy/openconfig-routing-policy:policy-definitions 

### Response from ODL: 

ODL will return the default policy if it exists.

-----

## Check for RIB Policy Config 

GET http://192.168.47.132:8181/rests/data/openconfig-routing-policy:routing-policy?content=config 

 ### Response from ODL: 
 
 ODL will respond with RIB if it exists.
 
----

# OpenDaylight BGP Configuration via RESTCONF

## 1. Configure a new protocol instance

**POST:** `http://192.168.47.132:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/protocols`

**Body:**
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

-----
## 2. Verify the new protocol instance

**GET:** `http://192.168.47.132:8181/rests/data/bgp-rib:bgp-rib/rib=bgp-to-r1?content=nonconfig`

----
## 3. BGP ODL Server port binding

**PUT:** `http://192.168.47.132.8181/rests/data/odl-bgp-peer-acceptor-config-bgp-peer-acceptor-config-default`

**Body:**
```xml
<bgp-peer-acceptor-config xmlns="urn:opendaylight:params:xml:ns:yang:odl-bgp-peer-acceptor-config">
  <config-name>default</config-name>
  <binding-address>0.0.0.0</binding-address>
  <binding-port>1790</binding-port>
</bgp-peer-acceptor-config>
```

----

## 4. BGP Peering - add the VyOS1 router as neighbor

**POST:** `http://192.168.47.132:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/openconfig-network-instance:protocols/protocol=openconfig-policy-types:BGP,bgp-to-r1/bgp-openconfig-extensions:bgp/neighbors`

**Body:**
```xml
<neighbor xmlns="urn:opendaylight:params:xml:ns:yang:bgp:openconfig-extensions">
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
      <passive-mode>true</passive-mode>
    </config>
  </transport>
  <!-- optional: neighbor-route-reflector-client -->
  <config>
    <peer-type>INTERNAL</peer-type>
    <peer-as>65002</peer-as>
  </config>
  <afi-safis>
    <afi-safi>
      <afi-safi-name xmlns:bgp-types="http://openconfig.net/yang/bgp-types">bgp-types:ipv4-unicast</afi-safi-name>
      <config>
        <afi-safi-name xmlns:bgp-types="http://openconfig.net/yang/bgp-types">bgp-types:ipv4-unicast</afi-safi-name>
        <enabled>true</enabled>
      </config>
    </afi-safi>
  </afi-safis>
</neighbor>
```

## 5. BGP RIB Check (After BGP link is established)

**GET:** `http://192.168.47.132:8181/rests/data/bgp-rib:bgp-rib/rib=bgp-to-r1/peer=bgp%3A%2F%2F192.168.47.135?content=nonconfig`

---
## 6. Configure route reflector

**PUT:** `http://192.168.47.132:8181/rests/data/openconfig-network-instance:network-instances/network-instance=global-bgp/openconfig-network-instance:protocols/protocol=openconfig-policy-types:BGP,bgp-to-r1/bgp-openconfig-extensions:bgp/neighbors/neighbor=192.168.47.135/route-reflector`


**Body:**
```xml
<route-reflector xmlns="urn:opendaylight:params:xml:ns:yang:bgp:openconfig-extensions">
  <config>
    <route-reflector-cluster-id>192.168.47.133</route-reflector-cluster-id>
    <route-reflector-client>true</route-reflector-client>
  </config>
</route-reflector>
```

-----
## Verification Commands

### On the ODL box (Linux/Ubuntu/Karaf host)
```bash
# 1) Best: socket summary with process name
sudo ss -ltnp | grep :1790
# or with a filter:
sudo ss -ltnp '{ sport = :1790 }'

# 2) Alternative
sudo lsof -iTCP:1790 -sTCP:LISTEN -Pn

# 3) Old-school
sudo netstat -plnt | grep :1790
```

### From VyOS (or any other host)
```bash
nc -vz 192.168.47.129 1790
```


