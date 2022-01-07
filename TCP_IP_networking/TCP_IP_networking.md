---
title: TCP IP networking
author: Pierre Colson
date: Thursday 06 January
output: pdf_document
---

---

**Markdown** version on
[*github*](https://raw.githubusercontent.com/caillouc/Fiche_EPFL/main/TCP_IP_networking/TCP_IP_networking.md)  
Compiled using [*pandoc*](https://pandoc.org/) and [*`gpdf` script*](https://github.com/caillouc/dotfile/blob/linux/gpdf.sh)

# General

* **Application layer** helps people and machines communicates
* **Transport layer** helps Application layer
  * Provides programming interface to application layer
    * **UDP**
    * **TCP**
  * **Port numbers** allow to differentiate source/destination processes on one
    machine
    * Source and destination port number are carried in UPD/TCP header
* **Network layer** provides full connectivity
  * **IPv4** (32 bits)
  * **IPv6** (128 bits)
* Data is broken into chunks called **IP packets** of size $\leq 1500$ bytes
* **Names** are human readable synonyms for IPv4 and IPv6 address
  * Mapped to address by **DNS** servers
* **Link layer** = MAC layer
  * Interconnects a small number of devices without any configuration
  * **MAC address** are hardware address (48 bits, set by manufacturer)
* **Local Area network** : A set of devices that are connected at the MAC layer
* LANs can be interconnected by **routers** : devices that forward packets based
  on IP address
* **Bridges** or **Switch** : A system that forwards packets based on MAC
  addresses
* Every machine must know the IP address of the next router (**default
  gateway**)
* The IP address of all machines in one subnetword must have same **subnet
  prefix**
* The size of IP subnet prefix is often specified using a **network mask**
* **MAC frame**
  * MAC header (detination MAC address + other things)
  * MAC payload
* **IP packet** is included in MAC payload
  * IP header (IP destination address + other things)
  * IP payload
* **TCP segment** is included in IP paylaod
  * TCP header (source and dest port nb + other things)
  * TCP payload
* TCP payload can include encryption header + encrypted bytes of an HTML file
* The **bit rate** of a channel is the numbber of bits per seconds.
* The **bandwidth** is the width of the frequency range that can be used for
  transmission over the channel
* In computer science, many people use *bandwidth* instead of *bit rate*
* **Throughput** is the number of useful data bits / time unit
* **Stop and Go Protocol**
  * Wait acknoledgement before sending a new packet

# The network layer IPv4 and Ipv6

* Every system (host = end-system, router = intermediate system) has a
  forwarding table (= routing table) and performs **Longest prefix match** on
  destination address
* Between subnets (= LANs) use routers, inside subnet don't
* Host in same subnet must have same *subnet router* and same *subnet prefix*
* **NAT** (Network Address Translation) box
  * Allow $n > 1$ devices to use one single IP address 
  * Translates *internal IP address* and *internal port* number into *NAT IP
    address* and *NAT port* number
  * Forwarding is based on exact matching in NAT table
  * Internal addresses are typically private addresses
  * A server port can be accessed only if explicitely configured
  * With IPv6, home routers often do not use NAT because provider typically
    allocates a block if IPv6 addresses, not just one as with IPv4
* With IPv6 the home router provides protection by acting as a **filtering
  router** : allows communication from outside only if initiated from inside or
  manually configured
* **Link local address** : can be used only between systems on same LAN
* Some system still use NAT with IPv6 : Use NAT with link local IPv6 address on
  internal network
* **NDP** : Mac address resolution with IPv6
  * Done via **NS** (Neighbour Solicitation) packet
* **ARP** : Mac address resolution with IPv4
  * ARP request is broadcasted to all nodes in LAN
* Host configuration 
  * IP address of this interface
  * Mask of this interface
  * IP address of default router
  * IP address of DNS server
  * Can be done manually or automatically with
    * IPv4 : DHCP (Dynamic Hsot Configuration Protocol)
    * IPv6 : DHCP stateful, SLAAC (stateless), DHCP stateless
* **DHCP** : Configuration info is kept in central DHCP server, contacted by
  host when it needs an IP address
  * Router implements a **DHCP Relay** because host cannot contact DHCP servers
    since they do not have an IP address yet
