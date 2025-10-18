- Creating a virtual cable 
- Check to see if GNS3 VM is under the same ip and check 
- Make the console type to be Telnet so we can use it on gns3

# BGP 

- Delete protocols bgp

# ODL

```Bash
feature:install odl-bgpcep-bgp odl-restconf
# open a new tab
sudo ss -ltnp | grep :1790

# look for the port to see if it listning 

# run the command below on vyos and see if it say succeeded this is too see if bgp is connected 

nc -vz <ubuntu_ip> 1790
```

- Make sure you have java 21 
- Make sure your odl is running when you are running post man