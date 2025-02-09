
# **The Network core

- Consists simply of a set of routers that are interconnected  by set of communication links 
- The internet core operation is based on a principle known as `packet swithing`
	- The end host take application level messages divide those messages into chunks of data put those chunks of data inside packets and send those packets into the Internet

## Two key network-core functions

- `Forwarding`
	- local action
	- Controlled by forwarding table
	- There is a forwarding table each in each and every route is in the Internet when a packet arrives a router will look inside the package for a destination address and then look up the destination address in each forwarding table and then transmit that incoming packet on the output link that leads to that destination
	- How are contents of the forwarding table created in the first place thats where we encounter the second key function known as routing
- `Routing`
	- Global action 