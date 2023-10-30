# Intro

## What

Configuration of my K3s cluster

I have built an kubernetes cluster on bare-metal using K3s.

## Why

## Hardware
For the hardware setup, I followed the following guide: https://anthonynsimon.com/blog/kubernetes-cluster-raspberry-pi/

### Nodes

1 Master node: Asus ChromeBox N62
- Fedora CoreOS 38
- 16GiB RAM
- Intel inside Core i5 
- ? Storage

2 Worker nodes: Asus ChromeBox N62
- Fedora CoreOS 38
- 16GiB RAM
- Intel inside Core i5
- ? Storage

1 Raspberry Pi 4 8GB
- Fedora 38
- 8GiB RAM
- 

### Networking

Tp-link TI-Sg1005P 5-Ort Gigabit Poe Switch

Tp-Link AC750 Mini Picket Wifi-router (installed OpenWRT firmware on it https://www.youtube.com/watch?v=LIM_2BLi91M&t=315s)

CABLES

USB stick


### Storage

Sandisk 128 USB 3.0

# Installation Guide

## OpenWRT on router

### Install OpenWRT on router

Check this link to learn how to do this:
https://www.youtube.com/watch?v=LIM_2BLi91M&t=315s

### Extend the storage of the router with an USB stick

First, check if you need to install drivers for reading the usb-stick.
SSH into the router and use the commands described here: https://openwrt.org/docs/guide-user/storage/usb-installing


We want to install some packages on the router. This router has just a few mb of storage, therefore we want to put the root system on a usbstick.
Follow this documentation to learh how:
https://openwrt.org/docs/guide-user/additional-software/extroot_configuration

### Install and configure loadbalancer

https://www.domstamand.com/adding-haproxy-as-load-balancer-to-the-kubernetes-cluster/





1. Set router in client mode

2. Make connection to your home WiFi Network
Network > Wireless

![image](https://user-images.githubusercontent.com/76623233/216714058-1477dff3-a184-4ed3-af95-8222eca1e4ca.png)

3. Add an extra IPv4 address the LAN interface:
![image](https://user-images.githubusercontent.com/76623233/216714245-8e012c88-c600-4f2f-85f9-25f3d4ec8647.png)

Now your two interfaces should look like this:
![image](https://user-images.githubusercontent.com/76623233/216714319-d549879d-d965-4bf4-ae72-06fe02bfefdc.png)

4. Make sure that the Firewall allows traffic to all zones:
Network > Firewall
![image](https://user-images.githubusercontent.com/76623233/216714466-07a6a27c-c58b-41a9-8039-7041e925c56b.png)

5. Enable port forwarding for the k8s api endpoint and ssh

![image](https://user-images.githubusercontent.com/76623233/216714671-8b5f5ef3-d176-4439-93bb-f1b555867475.png)

## Masternode1

Use a live-usb and make sure that coreos-installer is installed on it.
Then find out what the disk name is where you want to instalal coreos. in my case this is sda.
Then use the following commands:
```
sudo wipefs -a /dev/sda
sudo coreos-installer install /dev/sda --ignition-url https://raw.githubusercontent.com/lobiplayer/my_k3s_cluster/main/CoreOS/masternode1/k3s-server.ign
```

when installed, reboot the machine. **It is important to remove the live-usb before the reboot**

k3s will be installed. **Now reboot one more time**, k3s should be running now


## Workernode1

## Workernode2




