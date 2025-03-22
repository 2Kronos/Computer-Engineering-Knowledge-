# OSI (Open System Interconnection) layers 

## 7 layer model
![Pasted image 20250129140056](https://github.com/user-attachments/assets/369fe504-ad31-455e-b65d-827f97822d17)

## 5 layer model
![Pasted image 20250130234638](https://github.com/user-attachments/assets/1ce857e8-2b2f-40ed-941d-620b207bf27e)

## Simplified 
![Pasted image 20250130234715](https://github.com/user-attachments/assets/b51b5b09-92f9-42ed-8f28-c605aad89b09)



<u> Textbook: Computer Networking: A Top-Down Approach</u> 
- Available as online resource where you can listen to the textbook

# Chapter 1 
## The Internet: a  "Nuts and Bolts " view
1. <u>Billions of connected devices</u> 
	- made up of hosts

2. <u>Packets switches </u>: forward `Packets` chunks of data
	- Routers
	- Switches sit near devices, they take lots of input and send it as one signal
	  
3. <u>Communication links</u>:
	- Fibre, Satellite 

4.  <u>Networks</u> 
	- : Collection device, router links.
	- Enterprise network: Intra network
	  
(Round router, Square switche in slide)

### Definitions

- <u>Switch:</u> Not aware of the network
		What ever signal, input etc it get it pushes out (Plug and play device).
		Take a packet and push it out of a port
- <u>Routing</u> : Aware of the network
		Does routing
		Knows which port to send the signal
-  <u>ISP(Internet Service Provider):</u>
	- Connects you to the world
- <u>Internet</u>: 
	- Interconnected ISP
- <u>Protocols</u> : 
	- Are **rules** that govern how data is transmitted, received, and interpreted across a network. Each layer in the **5-layer model** (Application, Transport, Network, Data Link, Physical) has its own protocols to ensure smooth communication. 
	- In the slide Skype will be known as propriety protocol as it owned by a private company
	- e.g. HTTP, TCP, IP etc
- <u> Internet Standards</u> 
	- Define internet standards and protocols
		- `IETF` (Internet Engineering Task Force):  Body that define internet standards
				- Their standards are known as `RTF` (Request for comments)

## The Internet: a  "Service " view

- `Infrastructure` that provides services to application.
- Provides programming interface to distributed applications 
### What is a protocol 

- Rules for communication
- Different protocol for different layers

- **Definition**: A network protocol governs communication between hardware or software components in devices like computers, smartphones, and routers.

- **Role in the Internet**: Every interaction between remote entities follows a protocol, from data transmission to congestion control and routing.

- **Example**: When requesting a webpage, a sequence of protocol-defined messages occurs (connection request, reply, GET request, and response).

- **Key Elements**: Protocols define message formats, order, and the actions taken upon transmission or receipt.

- **Importance**: Protocols are essential for network communication, with different types handling various tasks, ranging from simple to complex.