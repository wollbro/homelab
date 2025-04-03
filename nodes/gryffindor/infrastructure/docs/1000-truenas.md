# 1000-truenas - Main NAS

## Background

This VM is my main NAS that runs TrueNAS Scale.. YES, I am virtualizing my NAS
and the reason for this is because I have tried running TrueNAS a the host VM
before and then used the internal VM support for when I needed to run VM's for
testing but due to the limitations that TrueNAS has for more advanced settings
of VM's it is easier to runt Proxmox as the host OS and then virtualize TrueNAS
with a lot of passthrough and it has worked great!

## VM setup

The entire VM setup is made using Terraform so look through the terraform 
directory to se the setup in more detail, but everything is configured to give
as much realtime performance as possible like setting the CPU Type as host and
passthrough hardware that is dedicated to the NAS like HBA and NIC to remove as
much bottlenecks as possible that can occure when virtualizing a NAS.

## Structure

### Infrastructure

Here I store the IaC code that setups the infrastructure of the VM using
Terraform, the provider I have used is linked below.

[bpg/proxmox provider](https://registry.terraform.io/providers/bpg/proxmox/0.73.1)

### Configuration

Currently TrueNAS Scale is so new that no good tool has yet been released to
manage the configuration of TrueNAS so currently everything is managed manually
from the GUI, as soon as I find a stable and reliable tool that I can use I 
will add it to this directory.

## Future plans

My end goal is to build a smaller server that can focus on only running the NAS
because even if running the NAS as a VM has worked great, I want to separate
it to another machine to reduce the risk of single point of failure if
something happens when doing my testing of other things and because my family
is also using the NAS for things like watching movies or storing personal
backups of images and files I want to reduce the risk of downtime for the NAS.
