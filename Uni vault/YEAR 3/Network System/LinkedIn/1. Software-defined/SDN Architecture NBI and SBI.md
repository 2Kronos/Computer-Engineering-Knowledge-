**SDN Architecture: NBI and SBI**

The core of **Software-Defined Networking (SDN)** involves separating the control plane from the data plane. This architecture is typically broken down into three layers:

- **Application Layer:** Contains various applications that dictate network behavior.
    
- **Control Layer:** Houses the **SDN controller**, which acts as the "brain" of the network. It receives instructions from applications and translates them into commands for network devices.
    
- **Infrastructure Layer:** Comprises the actual network devices (routers, switches, etc.) that forward data traffic.
    

Communication between these layers happens via interfaces:

- **Northbound Interface (NBI):** This is the interface that applications use to communicate with the **SDN controller**.
    
    - It's often referred to as the **Northbound API (Application Programming Interface)**.
        
    - NBIs are typically high-level, allowing applications to express their intent without needing to know the granular details of how the network devices operate.
        
    - **REST (Representational State Transfer)** or **RESTful APIs** are very common for NBIs (e.g., in Cisco's APIC-EM and Open Daylight).
        
    - Examples of applications that use the NBI include Intelligent WAN (IWAN), Plug and Play, Easy QoS, and Path Trace.
        
- **Southbound Interface (SBI):** This is the interface that the **SDN controller** uses to communicate with and control the underlying network devices.
    
    - SBIs are generally lower-level protocols that translate the controller's instructions into commands that network devices can understand and execute.
        
    - There are many different protocols that can be used on the SBI, and OpenFlow is just one of them.
        
    - **Examples of Southbound Protocols:**
        
        - **OpenFlow:** One of the earliest and most well-known SDN protocols, primarily used for modifying the forwarding plane (how traffic is sent) of network devices. However, not all SDN implementations use OpenFlow (e.g., Cisco's APIC-EM does not).
            
        - **NETCONF (Network Configuration Protocol):** A robust protocol for programmatically configuring network devices. It offers advantages over older protocols like SNMP for configuration management.
            
        - **SNMP (Simple Network Management Protocol):** Used for managing and monitoring network devices. While it can configure, NETCONF is often preferred for more advanced programmatic changes.
            
        - **CLI (Command Line Interface):** In some cases, the controller might even emulate CLI commands to configure devices, especially for legacy equipment.
            
        - **OVSDB (Open vSwitch Database protocol):** Used for managing Open vSwitch virtual switches.
            
        - **OF-Config:** Used for managing OpenFlow switches.
            
        - **BGP (Border Gateway Protocol):** Can be used programmatically to change routing tables from an application, especially **BGPLS (BGP Link-State)**.
            
        - **PCEP (Path Computation Element Protocol):** Used to program **MPLS (Multiprotocol Label Switching)** networks by controlling the paths that traffic takes.
            

**Abstraction**

A fundamental concept in SDN is **abstraction**. The **SDN controller** acts as an abstraction layer between high-level applications and low-level network device details.

- **How it works:** Applications (often written in high-level languages like Python) interact with the controller using a high-level NBI (like REST).
    
- **Benefit:** The controller "abstracts away" or hides the complex, low-level operational details of network devices (like understanding specific ASICs or device-specific CLI commands) from the application developer.
    
- **Intent-Based Networking:** This abstraction enables "intent-based networking," where application developers can simply state _what_ they want the network to do (their "intent") without needing to specify _how_ to do it in granular, low-level commands. The controller then translates this intent into the necessary low-level configurations and commands for the devices via the SBI.
    

**PCEP (Path Computation Element Protocol)**

- **Purpose:** **PCEP** is a southbound protocol specifically designed to program **MPLS (Multiprotocol Label Switching)** networks.
    
- **Functionality:** It allows the **SDN controller** to compute and control the explicit paths that traffic takes through an MPLS network. This is crucial for traffic engineering, ensuring optimal routing, and meeting specific Quality of Service (QoS) requirements.


------



