# my_k3s_cluster
Configuration of my K3s cluster

I have built an kubernetes cluster on bare-metal using K3s.

## Hardware

<img src="images/hardware_setup.jpg">

For the hardware setup, I followed the following guide: https://anthonynsimon.com/blog/kubernetes-cluster-raspberry-pi/


I used three used Chromeboxes as nodes. In order to use the chromeboxes for this purpose, it is necesarry that they are deprovisioned by admin of the company that used them. In order to use a different OS than the pre-installed Chrome-OS, the UEFI- Firmware must be modified. This guy has made a fantastic script to make this possible: https://mrchromebox.chrx.org/#fwscript


### Nodes

1 Master node: Asus ChromeBox N62
- Fedora 36
- 4GiB RAM
- Intel inside Core i7 (4 cores)
- 14GiB Storage

2 Worker nodes: Asus ChromeBox N62
- Fedora 36
- 4GiB RAM
- Intel inside Core i7 (4 cores)
- 14GiB Storage

### Networking

Tp-link TI-Sg1005P 5-Ort Gigabit Poe Switch

Tp-Link AC750 Mini Picket Wifi-router (installed OpenWRT firmware on it https://www.youtube.com/watch?v=LIM_2BLi91M&t=315s)

### Storage

Sandisk 128 USB 3.0

## Open WRT


![image](https://user-images.githubusercontent.com/76623233/215530647-0131e1ef-66ef-4b28-a12c-84fa5ced75d8.png)

## Software

# CoreOS



With this project, I tried to 

| Purpose | Tool | Note |
|---|---|---|
| Kubernetes | <img src="https://k3s.io/img/k3s-logo-light.svg" width="100"><br>K3s |  |
| Networking | <img src="https://containous.github.io/slides/online-meetup-201901/images/traefik.logo.png" width="100"><br />Traefik | Default on K3s |
| GIT | <img src="https://docs.gitea.io/images/gitea.png" width="100"><br />Gitea |  |
| Repository Management | <img src="https://www.sonatype.com/hubfs/Repo%20Combined%20Manager/Repo%20Icon%20with%20green.png" width="100"><br />Nexus |  |
| CI/CD | <img src="https://cloudevents.io/img/logos/integrations/tekton.png" width="100"><br />Tekton |  |
| GitOps | <img src="https://luktom.net/wordpress/wp-content/uploads/2019/11/argo.png" width="100"><br />ArgoCD |  |

Planned:
- Secret Management: Hashicorp Vault
- Identity Management: OpenIAM
- Monitoring/Log management: ELK Stack



