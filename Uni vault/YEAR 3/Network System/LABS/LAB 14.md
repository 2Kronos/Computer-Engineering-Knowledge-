- Get another router to be in the middle of the SDN controller
- Get the ping going from the  intermediate router to  the OSPF Toplogy we had in Lab 13 
- Set up the BGP between them 

leave out putting BGP and the ODL 

# LAB 14 Prompt before instructions

# Step-by-Step Guide for Lab 14: OpenDaylight BGP Integration with VyOS

Based on your Lab 13 setup where you have three VyOS routers running as separate VirtualBox VMs connected through GNS3, here's how to proceed with Lab 14:

## Preparation
1. **Verify your current setup**:
   - You have 3 VyOS routers running in VirtualBox, connected via GNS3
   - Your topology has working IP addressing and OSPF configuration from Lab 13
   - You can ping between all router interfaces

## Step 1: Prepare Ubuntu Desktop VM for OpenDaylight

1. **Download Ubuntu Desktop ISO**:
   - Get the latest LTS version from https://ubuntu.com/download/desktop

2. **Create a new VirtualBox VM**:
   - Name: "ODL-Controller"
   - Type: Linux → Ubuntu (64-bit)
   - RAM: 4096 MB (4GB)
   - HDD: 30 GB (VDI, dynamically allocated)
   - Network Adapter 1: NAT (for internet access during setup)
   - Network Adapter 2: Host-only Adapter (for connection to GNS3 network)

3. **Install Ubuntu**:
   - Boot from ISO and complete installation
   - Create a user account with password
   - Install OpenSSH server when prompted or run:  
     `sudo apt install openssh-server`

4. **Update the system**:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

## Step 2: Install OpenDaylight and Postman

1. **Install Java 17**:
   ```bash
   sudo apt install openjdk-17-jdk -y
   java -version  # Verify installation
   ```

2. **Download OpenDaylight**:
   ```bash
   wget https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/karaf/0.20.2/karaf-0.20.2.tar.gz
   tar -xzf karaf-0.20.2.tar.gz
   cd karaf-0.20.2/bin
   ```

3. **Launch OpenDaylight and install features**:
   ```bash
   ./karaf
   feature:install odl-restconf odl-bgpcep-bgp
   ```
   (Wait for installation to complete - may take several minutes)

4. **Install Postman**:
   ```bash
   sudo snap install postman
   ```

## Step 3: Network Configuration

1. **Configure Ubuntu VM network**:
   - Shut down the VM
   - In VirtualBox settings:
     - Adapter 1: NAT (for internet)
     - Adapter 2: Host-only Adapter (vboxnet0 or similar)
   - Start the VM

2. **Configure IP address on host-only interface**:
   - Identify the interface name (usually ens7 or enp0s8):
     ```bash
     ip a
     ```
   - Configure static IP:
     ```bash
     sudo nano /etc/netplan/01-netcfg.yaml
     ```
     Add configuration for the second adapter:
     ```yaml
     network:
       version: 2
       renderer: networkd
       ethernets:
         ens7:  # Change to your interface name
           dhcp4: no
           addresses: [192.168.100.1/24]
     ```
   - Apply changes:
     ```bash
     sudo netplan apply
     ```

3. **Connect to GNS3**:
   - In GNS3, add a "Cloud" node
   - Configure the Cloud node to use the same VirtualBox host-only adapter (vboxnet0)
   - Connect the Cloud node to one of your VyOS routers (e.g., R1)

4. **Configure VyOS router interface**:
   - On the VyOS router connected to the Cloud:
   ```bash
   configure
   set interfaces ethernet eth1 address 192.168.100.2/24
   commit
   save
   exit
   ```

## Step 4: Configure BGP on OpenDaylight

1. **Access OpenDaylight RESTCONF API**:
   - Open Postman
   - Create a new PUT request to:
     ```
     http://localhost:8181/restconf/config/bgp-rib:application-rib/example-bgp-rib/example-bgp-peer
     ```
   - Set headers:
     ```
     Content-Type: application/json
     Authorization: Basic YWRtaW46YWRtaW4=
     ```

2. **Send BGP configuration**:
   - Use this JSON body (adjust as needed):
   ```json
   {
     "example-bgp-peer": [
       {
         "rib-id": "example-bgp-rib",
         "peer-id": "192.168.100.2",
         "peer-as": 65001,
         "local-as": 65000,
         "ipv4-afi-safi": {
           "ipv4-unicast": {
             "enabled": true
           }
         }
       }
     ]
   }
   ```
   - Send the PUT request

## Step 5: Configure BGP on VyOS Router

1. **On the connected VyOS router (R1)**:
   ```bash
   configure
   set protocols bgp 65001 neighbor 192.168.100.1 remote-as 65000
   set protocols bgp 65001 neighbor 192.168.100.1 address-family ipv4-unicast
   commit
   save
   exit
   ```

## Step 6: Verification

1. **Check BGP session on VyOS**:
   ```bash
   show ip bgp summary
   ```
   Should show state as "Established"

2. **Check BGP routes on VyOS**:
   ```bash
   show ip bgp
   ```

3. **Verify on OpenDaylight**:
   - In Postman, send a GET request to:
     ```
     http://localhost:8181/restconf/operational/bgp-rib:application-rib/example-bgp-rib/example-bgp-peer
     ```
   - Check for established session and routes

## Troubleshooting

If BGP session doesn't establish:
1. Verify connectivity:
   ```bash
   ping 192.168.100.1  # From VyOS
   ping 192.168.100.2  # From Ubuntu
   ```

2. Check OpenDaylight logs:
   ```bash
   tail -f karaf-0.20.2/data/log/karaf.log
   ```

3. Verify VyOS BGP configuration:
   ```bash
   show configuration commands | match bgp
   ```

4. Check firewall settings on both systems (ports 179/TCP should be open)

This setup maintains your existing VirtualBox-based VyOS routers while adding the OpenDaylight controller as a separate VM that connects to your GNS3 topology through the VirtualBox host-only network.


<u> Configure a new protocol  </u>

Here in the body you must replace it with your IP
Take the post start a new and click + and then change the verb to post
- Go to the body paste in by postman by the body 
- Save it and the name will change