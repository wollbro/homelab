> [!WARNING]
> If you are reading this from my Github then I have moved to my personal
> Gitlab, please visit [git.wollbro.se](https://git.wollbro.se) for the latest
> changes.

# Welcome to my `Homelab`

Welcome friend,

I am Daniel, I am a full fledged nerd who loves to works with everything from
servers and networking, to code and automation.

I am a strong advocate for GitOps and using automations as much as possible,
to be clear, not everything should be automated but everything that can remove
waste (waste as time that is spent on repetetive tasks) should be automated as 
long as it is secure.

This repository is my Homelab in code, it is an representation of what I am
running in my Homelab and how my Homelab is configured. This is both for my own
documentation but also to help and inspire and show others that want to do the
same how I am doing it.

## Structure

### Nodes

Here I store information about each server node in my Homelab so if you want
to know more about a specific node then go into that node and there will be an
separate readme file with details regarding that node and what VM's and
services that is running on that that node.

### Networking

Under networking I store all code and information regarding my home network,
because I setup my network in a way that an enterprise would I consider it a 
part of my homelab and therefore it is added also to the repo.

The same here as with everything else, can I setup and configure the networking
using IaC tools then I will do it.

## Shell.nix

You might be wondering what that shell.nix file is and why it is in the repo?
Because I work from many different computers all the time it get's frustrating
having to install and update each tool on each computer, therefore I have
setup an Nix shell that setup everything for me with with a single command.
If you have never heard of NixOS before I strongly advice you to look into it,
you can think of it as Docker for your development environment where you setup
a configuration file of the tools that you need and then run `nix-shell` and 
get's all the tools preconfigured for you on each machine you run it on.

