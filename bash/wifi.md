Getting instructions from the arch wiki (Wireless network configuration)
========================================================================

## setting up a wireless network

1. You need a configuration for the network before you can conect. you can create one through: 
```bash
wpa_passphrase [network name] [password] > /path/to/config
```
1. Setup your wireless interface, you can do this through:
```bash
ip link set [interface] up
```
1. Once the config is in place, run wpa supplicant:
```bash
wpa_supplicant -B -i[interfaceName] -c /path/to/config
```
**WHERE**
-B stands for running this process in the background.
1. start the ip address service to get connected properly:
```bash
systemctl start dhcpcd.service
dhcpcd #Gives ip's to all devices.
```

 You should be good to go!
