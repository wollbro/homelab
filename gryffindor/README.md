# Gryffindor - NAS/HomeLab

## Background

Gryffindor is my main server that I have built my entire homelab infrastructure
around. It currently works as a dual purpose server to both run as a NAS and as
a HomeLab. In the long run I want to separate the NAS to a dedicated machine,
but for now this has to do.

The server runs Proxmox as it's OS and everything that can be managed using
IaC tools is managed by code so it is easy to reproduce and also keeps an
history of what is been changed over the time.
Some support is still missing in Proxmox or in the tools to be managed using
IaC tools but once it is added I will update the code with the support, one
example is to setup ACME Certification using ACME plugins ex. Cloudflare. It
is possible to setup self-signed certificates but not when using ACME Plugins
(or I have not just yet figured out how to do it).

## Structure

In this folder I have separated each VM with it's own directory, so if you want
to know more about a specific VM then go into that directory for the specific
VM and read the README.md file for the specific VM.

## Hardware

Here is a list of what hardware the server is running. Some hardware is
salvaged parts from my main PC and will be replaced over time.

* Asrock X99 WD
* Intel Xeon E5-2699v3 18 Core's 36 Threads
* Hyper 212 EVO CPU Cooler
* 88GB non-ecc RAM
* LSI 9207-8i IT P20 HBA (passthrough to NAS VM)
* 6x3TB WD Red (connected to HBA)
* 2x120GB Samsung SSD (Running in RAID-z1 for the OS)
* TP-Link gigabit NIC
* Asus Strix GTX980
* Corsair 750W PSU
* Fractal Define R5

Some future plans for this machine is:

* Replace the PSU to a more reliable PSU.
* Replace the non-ecc RAM with ECC ram for better stability.
* Add another GPU that can act as a main GPU for Proxmox due to the CPU is 
missing iGPU support.
* Move everything to an rack mountable case.
* Replace the GTX980 with something bigger so I can test AI services.

