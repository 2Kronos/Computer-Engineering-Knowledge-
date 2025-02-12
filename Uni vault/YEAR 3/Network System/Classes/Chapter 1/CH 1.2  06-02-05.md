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


### Wireless access networks

- Normally have bases station "Acces points"

<u>Wireless Local Area Networks (WLANs)</u>

- Typically cover areas within or around a building (~100 ft).
- Use **802.11b/g/n (WiFi)** with transmission rates of **11, 54, or 450 Mbps**.
- Provide wireless access to the Internet.

<u> Wide-Area Cellular Access Networks </u>

- Offered by mobile cellular network operators, covering distances of **tens of kilometers**.
- Provide data speeds of **tens of Mbps**.
- Use **4G cellular networks**, with **5G** as the emerging technology.

### Access networks: enterprise networks

- Companies, Universities, etc
- Mixed of wired, wireless link tech, connecti

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
