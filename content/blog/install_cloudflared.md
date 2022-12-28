---
title: "Install cloudflared to set up secure Cloudflare Tunnels for free"
date: 2022-09-05
---
I have been using Cloudflare Tunnels increasingly over the last year to securely enable my applications to be reached publicly without having to open firewall ports in my server. However, installing cloudflared and then setting up tunnels is not very straightforward. So, I wanted to develop this tutorial as a way to get tunnels up and running quickly. These steps are tested on Ubuntu 22.04.

## Step 1: Install cloudflared
Let us create env variables first.
```bash
NAME="tunnelname"
HOSTNAME="subdomain.domain.tld"
```
Now, let us install cloudflared using their package. The commands below are specifically for Ubuntu 22.04. You can find instructions for other operating systems [here](https://pkg.cloudflare.com/).
```bash
# Add cloudflare gpg key
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

# Add this repo to your apt repositories
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared jammy main' | sudo tee /etc/apt/sources.list.d/cloudflared.list

# install cloudflared
sudo apt-get update && sudo apt-get install cloudflared
```
This will install `cloudflared`. 

## Step 2: Authenticate cloudflared
Let us login and authenticate the cloudflared daemon to our account.
```bash
cloudflared login
```
Running the above command will launch the default browser window and prompt you to login to your Cloudflare account. Then, you will be prompted to select a site, which we have created previously. As soon as you have chosen your hostname, Cloudflare will download a certificate file to authenticate `cloudflared` with Cloudflare's network. Once authorization is completed successfully, your cert.pem will be download to the default directory. If you're running a headless server (no monitor or keyboard), you could copy the authentication URL and paste it in a browser manually.

## Step 3: Create a Cloudflare Tunnel
Now, we are ready to create a Cloudflare Tunnel that will connect `cloudflared` to Cloudflare's edge. Running the following command will create a Tunnel with tht name and generate an ID credentials file for it.
```bash
cloudflared tunnel create $NAME
```
Once the Tunnel is created, a credential file is generated. It's a JSON file that has the Universally Unique Identifier (UUID) assigned for the Tunnel.

_Note: although the Tunnel is created, the connection is not established yet._
## Step 4: Configure the Tunnel details
Cloudflare utilizes a configuration file to determine how to route traffic. The configuration file contains keys and values, which is written in YAML syntax. You may need to modify the following keys and values to meet your configuration file requirements. By default, on Linux systems, Tunnel expects to find the configuration file in `~/.cloudflared`, `/etc/cloudflared` and `/usr/local/etc/cloudflared` in that order.
Let's create our config file and save in the default expected directory for this tutorial.
```bash
sudo nano ~/.cloudflared/config.yml
```
Then, we will paste our keys and values as shown below:
```markdown
tunnel: 1082b601-bce9-45e4-b6ae-f19020e7d071
credentials-file: /root/.cloudflared/1082b601-bce9-45e4-b6ae-f19020e7d071.json

ingress:
  - hostname: test.mytunnel.ml
    service: http://localhost:80
  - service: http_status:404
```
## Step 5: Create DNS records to route traffic to the Tunnel
Run the following command from the command line. This command will generate a CNAME record that points to the subdomain of a specific Tunnel. The result is the same as creating a CNAME record from the dashboard. 
```bash
cloudflared tunnel route dns $NAME $HOSTNAME
```
_Note: unlike the previous Argo Tunnel architecture, this DNS record will not be deleted if the Tunnel disconnects._
## Step 6: Run and manage the Tunnel
The `run` command will connect cloudflared to Cloudflare's edge network using the configuration created in step 4. We will not specify a configuration file location so Cloudflared retrieves it from the default location, which is `~/.cloudflared/config.yml`.
```bash
cloudflared tunnel run $NAME
```
## Step 7: Run Tunnel as a service
By running the following command, the tunnel can be installed as a system service which allows the tunnel to run at boot automatically as launch daemon. By default, the tunnel expects to find the configuration file in the default directory, `~/.cloudflared/config.yml` but to run tunnel as a service, we might need to move the `config.yml` file to `/etc/cloudflared/`.
```bash
sudo mkdir -p /etc/cloudflared/
sudo mv ~/.cloudflared/config.yml /etc/cloudflared/
```
Now, we are ready to run Tunnel as a service utilizing the command below
```bash
sudo cloudflared service install 
```

## Step 8: Add more services (optional)
Pair another hostname: 
```bash
cloudflared tunnel route dns <UUID or NAME> demo2.example.com
```
Add another ingress point to the config:
```
ingress:
  - hostname: demo.example.com
    service: http://localhost:80
  - hostname: demo2.example.com
    service: http://localhost:8080
  - service: http_status:404
```
Re-install the previous config:
```bash
sudo cloudflared service uninstall
sudo cloudflared service install
```
Restart service: 
```bash
sudo systemctl restart cloudflared
```
# References
1. https://dev.to/omarcloud20/a-free-cloudflare-tunnel-running-on-a-raspberry-pi-1jid
1. https://cyberhost.uk/cloudflare-argo-tunnel