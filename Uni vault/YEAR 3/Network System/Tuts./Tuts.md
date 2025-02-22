Sure! Here's a summary of the key points explaining the purpose of each line in the `UDPClient.py` code:
## UDP Client
- **from socket import \***: Imports the socket module, which is necessary for network communications in Python.
- **serverName = 'hostname'**: Sets the server's hostname (or IP address) where the client will send the message.
- **serverPort = 12000**: Specifies the server's port number.
- **clientSocket = socket(AF_INET, SOCK_DGRAM)**: Creates a UDP socket for the client. `AF_INET` indicates IPv4 and `SOCK_DGRAM` indicates UDP.
- **message = input('Input lowercase sentence:')**: Prompts the user to input a lowercase sentence.
- **clientSocket.sendto(message.encode(), (serverName, serverPort))**: Sends the encoded message to the server at the specified hostname and port.
- **modifiedMessage, serverAddress = clientSocket.recvfrom(2048)**: Receives the modified message from the server, with a buffer size of 2048 bytes.
- **print(modifiedMessage.decode())**: Decodes and prints the modified message received from the server.
- **clientSocket.close()**: Closes the client socket.

I hope this helps! If you have any other questions or need further clarification, feel free to ask.

## UDP server
Here's a summary of the key points explaining the purpose of each line in the `UDPServer.py` code:

- **from socket import \***: Imports the socket module necessary for network communications in Python.
- **serverPort = 12000**: Sets the server's port number to 12000.
- **serverSocket = socket(AF_INET, SOCK_DGRAM)**: Creates a UDP socket for the server. `AF_INET` indicates IPv4 and `SOCK_DGRAM` indicates UDP.
- **serverSocket.bind(('', serverPort))**: Binds the server's socket to port 12000. This means any packet sent to port 12000 at the server's IP address will be directed to this socket.
- **print("The server is ready to receive")**: Prints a message indicating that the server is ready to receive data.
- **while True**: Enters an infinite loop to continually receive and process packets from clients.
- **message, clientAddress = serverSocket.recvfrom(2048)**: Receives a packet from the client. The packet's data is stored in `message` and the client's address in `clientAddress`.
- **modifiedMessage = message.decode().upper()**: Decodes the received message and converts it to uppercase.
- **serverSocket.sendto(modifiedMessage.encode(), clientAddress)**: Sends the capitalized message back to the client.

## TCP Client

- **from socket import \***: Imports the socket module necessary for network communications in Python.
- **serverName = 'servername'**: Sets the server's hostname (or IP address) where the client will send the message.
- **serverPort = 12000**: Specifies the server's port number.
- **clientSocket = socket(AF_INET, SOCK_STREAM)**: Creates a TCP socket for the client. `AF_INET` indicates IPv4 and `SOCK_STREAM` indicates TCP.
- **clientSocket.connect((serverName, serverPort))**: Initiates a TCP connection between the client and server using the server's address and port.
- **sentence = input('Input lowercase sentence:')**: Prompts the user to input a lowercase sentence.
- **clientSocket.send(sentence.encode())**: Sends the encoded sentence through the TCP connection to the server.
- **modifiedSentence = clientSocket.recv(1024)**: Receives the modified sentence from the server, with a buffer size of 1024 bytes.
- **print('From Server:', modifiedSentence.decode())**: Decodes and prints the modified sentence received from the server.
- **clientSocket.close()**: Closes the client socket, thereby closing the TCP connection between the client and the server.

## TCP Server

- **from socket import \***: Imports the socket module necessary for network communications in Python.
- **serverPort = 12000**: Sets the server's port number to 12000.
- **serverSocket = socket(AF_INET, SOCK_STREAM)**: Creates a TCP socket for the server. `AF_INET` indicates IPv4 and `SOCK_STREAM` indicates TCP.
- **serverSocket.bind(('', serverPort))**: Binds the server's socket to port 12000. This means any packet sent to port 12000 at the server's IP address will be directed to this socket.
- **serverSocket.listen(1)**: Has the server listen for TCP connection requests from the client. The parameter specifies the maximum number of queued connections (at least 1).
- **print('The server is ready to receive')**: Prints a message indicating that the server is ready to receive data.
- **while True**: Enters an infinite loop to continually receive and process requests from clients.
- **connectionSocket, addr = serverSocket.accept()**: When a client connects, creates a new socket (`connectionSocket`) for this client, and completes the TCP handshake.
- **sentence = connectionSocket.recv(1024).decode()**: Receives a sentence from the client with a buffer size of 1024 bytes and decodes it.
- **capitalizedSentence = sentence.upper()**: Converts the received sentence to uppercase.
- **connectionSocket.send(capitalizedSentence.encode())**: Sends the capitalized sentence back to the client.
- **connectionSocket.close()**: Closes the connection socket, allowing the server to accept another client.

## Differnce between TCP and UDP

The three-way handshake is a process used in TCP (Transmission Control Protocol) to establish a reliable connection between a client and a server. It ensures that both parties are ready to communicate and that the connection is established correctly. Here's how it works:

### **Three-Way Handshake Steps**

1. **SYN (Synchronize)**: The client initiates the connection by sending a TCP segment with the SYN (synchronize) flag set. This segment includes an initial sequence number (ISN) chosen by the client.
   - **Client:** Sends a SYN segment to the server.
   
2. **SYN-ACK (Synchronize-Acknowledge)**: The server responds to the client's SYN segment with a SYN-ACK segment. The SYN-ACK segment includes the server's initial sequence number and an acknowledgment number that is one more than the client's ISN.
   - **Server:** Sends a SYN-ACK segment to the client.
   
3. **ACK (Acknowledge)**: The client responds to the server's SYN-ACK segment with an ACK segment. The ACK segment includes an acknowledgment number that is one more than the server's ISN.
   - **Client:** Sends an ACK segment to the server.

### **Visual Representation**
```
Client              Server
  |---- SYN ----->|
  |<--- SYN-ACK --|
  |---- ACK ----->|
```

Once the three-way handshake is complete, a reliable TCP connection is established, and data can be exchanged between the client and server. This process ensures that both parties agree on the initial sequence numbers and are ready to communicate.

# Explanation of the Three-Way Handshake Process in the Code
Server Creates Welcoming Socket (TCPServer.py):

The server creates a TCP socket and binds it to a port (12000), then starts listening for incoming connections.

Server Waits for Connection (TCPServer.py):

The server calls accept(), which blocks and waits for an incoming connection request from a client.

Client Creates TCP Socket (TCPClient.py):

The client creates a TCP socket using socket(AF_INET, SOCK_STREAM).

Client Initiates Connection (TCPClient.py):

The client calls connect() with the server's address and port, initiating the TCP three-way handshake.

Server Accepts Connection (TCPServer.py):

When the server accepts the connection, a new socket (connectionSocket) is created specifically for this client.

The three-way handshake is completed, and both client and server are ready to communicate over this connection.

Client and Server Communicate (TCPServer.py and TCPClient.py):

The client sends a message, the server processes it (e.g., converts it to uppercase), and sends the response back to the client.
