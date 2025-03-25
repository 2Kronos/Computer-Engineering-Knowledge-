# Network Edge

## Closer look at internet structure 
1. Network edge:  
	- hosts: clients and servers  

2. Access networks, physical media: 
	- Communication links 

3. Network core:
	- Interconnected routers
	- network of networks

## **Acces networks and physical media

- Network that connects the end systems host, device into the larger internet
### 3 types of access network

- Residential access nets
- Institutional access nets
- Mobile access nets

![Image](https://github.com/user-attachments/assets/0ab16732-363f-4848-b759-fc9308887ee1)


## **Access Networks

#### **Cable-Based Access**

- **Examples:** Cable modem, CMTS (Cable Modem Termination System)
#### **Digital Subscriber Line (DSL)**

- **Examples:** DSL modem, DSLAM (DSL Access Multiplexer)   
#### **Home Networks**

- **Examples:** WiFi access point, Wired Ethernet
#### **Wireless Access Networks**

- **Examples:** 802.11 WiFi, 4G Cellular Network
#### **Enterprise Networks**

- **Examples:** Ethernet switch, Institutional router
#### **Data Center Networks**

- **Examples:** High-bandwidth links, Server clusters

### **Internet Service Providers (ISPs)** 

- are companies that provide access to the internet for individuals and organizations. Here's what they do:

- **Connectivity**: ISPs provide the infrastructure and services needed to connect users to the internet. This involves various technologies like DSL, fiber optics, cable, and wireless connections.
    
- **Data Transmission**: They facilitate the transmission of data between users and websites, ensuring that information can be sent and received efficiently.
    
- **IP Addresses**: ISPs assign IP addresses to users, which are unique identifiers that allow devices to communicate over the internet.
    
- **Access to Online Services**: They provide access to various online services, including websites, email, streaming, and more.
    

Overall, ISPs play a crucial role in making the internet accessible and functional for users.
## **Host: Sends packets of data

<u>Host send function:</u>

**Packet Transmission Process**

- Takes an application message and breaks it into smaller chunks, known as packets, each of length **L** bits.
	- In addition to the data itself will add some additional information to each chunk of data in whats called a packet header 
	- A protocol will determine exactly what info is addded into this header
- Transmits each packet into the access network at a transmission rate **R**.
- **Link transmission rate (R)** is also known as:
    - Link capacity
    - Link bandwidth
- **R** also varies from one type of access network to another 
- Devices comes with a card that send packets onto the transmission line the  card also comes with its own transmission dela
<u>Packet Transmission Delay</u>

The time needed to transmit an **L-bit** packet into the link is given by:

$$Delay = \frac{L \text{ (bits)}}{R \text{ (bits/sec)}}$$


## **Links: Physical Media 

<u>Transmission and Media Types</u>

- **Bit:** Propagates between transmitter and receiver pairs.
- **Physical link:** The medium that connects the transmitter and receiver.

<u>Types of Transmission Media</u>

**Guided Media

- Signals propagate through a solid medium:
    - Copper
    - Fiber
    - Coaxial cable

**Unguided Media

- Signals propagate freely, e.g., radio waves.

**Twisted Pair (TP)

- Consists of two insulated copper wires.
- Performance categories:
    - **Category 5 (Cat 5):** Supports 100 Mbps and 1 Gbps Ethernet.
    - **Category 6 (Cat 6):** Supports 10 Gbps Ethernet.
