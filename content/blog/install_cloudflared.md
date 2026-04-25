---
title: "Install cloudflared to set up secure Cloudflare Tunnels for free"
date: 2026-04-25
---
I have been using Cloudflare Tunnels increasingly over the last year to securely enable my applications to be reached publicly without having to open firewall ports in my server. However, installing cloudflared and then setting up tunnels is not very straightforward. So, I wanted to develop this tutorial as a way to get tunnels up and running quickly. These steps are tested on Ubuntu 22.04.

## TL;DR: The "One-Script" Method
If you want to automate everything, save the following script as `setup_tunnel.sh`, make it executable (`chmod +x`), and run it as `./setup_tunnel.sh <name> <hostname> <port>`.

```bash
#!/bin/bash
TUNNEL_NAME=$1
HOSTNAME=$2
PORT=${3:-80} # Default to port 80 if not provided

# 1. Install cloudflared
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflared.list
sudo apt-get update && sudo apt-get install -y cloudflared

# 2. Login (Interactive)
cloudflared login

# 3. Create Tunnel & Config
CREATE_OUTPUT=$(cloudflared tunnel create "$TUNNEL_NAME")
UUID=$(echo "$CREATE_OUTPUT" | grep -oE "[a-f0-9]{8}-([a-f0-9]{4}-){3}[a-f0-9]{12}" | head -n 1)
sudo mkdir -p /etc/cloudflared
sudo mv "$HOME/.cloudflared/$UUID.json" /etc/cloudflared/

cat <<EOF | sudo tee /etc/cloudflared/config.yml > /dev/null
tunnel: $UUID
credentials-file: /etc/cloudflared/$UUID.json
ingress:
  - hostname: $HOSTNAME
    service: http://localhost:$PORT
  - service: http_status:404
EOF

# 4. Route & Start
cloudflared tunnel route dns "$TUNNEL_NAME" "$HOSTNAME"
sudo cloudflared service install
sudo systemctl start cloudflared
```
---

## Step 1: Install cloudflared
Let us create env variables first.
```bash
NAME="tunnelname"
HOSTNAME="subdomain.domain.tld"
PORT="8080"
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
Cloudflare utilizes a configuration file to determine how to route traffic. For a system service, it is best to store everything in `/etc/cloudflared/`.

First, create the directory and the config file:
```bash
sudo mkdir -p /etc/cloudflared
sudo nano /etc/cloudflared/config.yml
```

Then, paste your configuration. **Important:** Ensure you replace the UUID and paths with your actual values generated in Step 3.
```yaml
tunnel: <YOUR-TUNNEL-UUID>
credentials-file: /etc/cloudflared/<YOUR-TUNNEL-UUID>.json

ingress:
  - hostname: your-app.example.com
    service: http://localhost:<PORT>
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
By running the following command, the tunnel can be installed as a system service. To ensure the service can find your credentials, move the config and the JSON file to the global directory.

```bash
# Move config and credentials to the global directory
sudo mv ~/.cloudflared/config.yml /etc/cloudflared/
sudo mv ~/.cloudflared/<YOUR-UUID>.json /etc/cloudflared/
```

Now, install and start the service:
```bash
sudo cloudflared service install 
sudo systemctl start cloudflared
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