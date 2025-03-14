# Network Infrastructure

I try to setup my network infrastructure as what an business would setup so
that I can learn the more advanced functionality that comes with professional
equipment, this is an ongoing process and I will keep updating it when my
budget allows.

## Current situation

Here I have an diagram showing my current network infrastructure, I am running
a Ubiquti DreamMachine Pro that is connected to my fiber box that then 
downlink to my US-48-500W switch using an SFP cabel with a speed of 10GbE.

From my US-48-500W switch I downlink to 3 UniFi U7 Pro Max that is spread out
through out the house to get the best coverage possible.
It is also other devices through out the house that is connected using Cat6 
cable that requires better stability.

![Image of the network infrastructure](https://github.com/digidaniel-dev/homelab/blob/update-readme/assets/network-2025.webp?raw=true)

## IaC

I am currently in process trying to migrate my configuration to code but due
to the limited support in the Unifi API there is not much I can manage using
Terraform or Ansible at the time being, but I will keep an eye open for added
support and then update when more support is added.

## Future Plans

* Add a 2.5G switch so I can utilize the full speed of my U7 Pro Max AP's.
* Run a fiber cable to my office
