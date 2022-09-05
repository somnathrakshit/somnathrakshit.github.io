---
title: "Create a PostgreSQL server and expose it remotely using Lets Encrypt"
date: 2022-09-04
---
I have been trying for some days to create a PostgreSQL server and expose it on the web so that it can be accessed by external clients. This is useful to me for hosting several personal projects that require a database. 

First things first, let's create our env variables.

```bash
HOSTNAME="subdomain.domain.tld" # Hostname of your server
EMAIL="email@email.com" # Used for Let's Encrypt certificate
VERSION="14" # PostgreSQL version
NAME="db" # Database name
```

Let's update our packages now.
```bash
sudo apt update
sudo apt install postgresql
```

Now, we will use `nano` to edit PostgreSQL config file and set `listen_addresses = '*'`.
```bash
sudo nano /etc/postgresql/$VERSION/main/postgresql.conf
# In this file, add the following line somewhere under the "CONNECTIONS AND AUTHENTICATION" section. 
# This will instruct PostgreSQL to listen on all network interfaces for incoming connections.
#
# listen_addresses = '*'
```
Now, restart PostgreSQL for the config changes to take place. Then, add firewall configs as below. This will make your server reachable from anywhere (`0.0.0.0/0`) and opens ports `5432` and `80` to accept incoming traffic. You need to open port `80` in order to set up SSL certificates with Let's Encrypt.
```bash
sudo systemctl restart postgresql
sudo bash -c "echo host    all          all            0.0.0.0/0  md5 >> /etc/postgresql/"$VERSION"4/main/pg_hba.conf"
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 5432 -j ACCEPT
sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT
sudo netfilter-persistent save
```
Let us now set up SSL certificates using Let's Encrypt. This will also accept their terms and conditions automatically.
```bash
sudo apt-cache policy certbot
sudo apt-get -y install certbot
sudo certbot certonly --standalone -d $HOSTNAME --staple-ocsp -m $EMAIL --agree-tos
```
Having set up our SSL certificates, we now need to instruct PostgreSQL to use them to transfer data securely instead of transferring data without encryption. Edit the configuration file at `/etc/postgresql/$VERSION/main/postgresql.conf`, where $VERSION is your Postgres version (mine is 14). Find the SSL section, then edit it to enable SSL and specify the locations of the certificate and key.
```markdown
ssl = on
ssl_cert_file = '/etc/postgresql/$VERSION/main/fullchain.pem'
ssl_key_file = '/etc/postgresql/$VERSION/main/privkey.pem'
```
Now, copy the certificate files from their original location to the one that you just mentioned.
```bash
sudo cp /etc/letsencrypt/live/$HOSTNAME/fullchain.pem /etc/postgresql/$VERSION/main/fullchain.pem
sudo cp /etc/letsencrypt/live/$HOSTNAME/privkey.pem /etc/postgresql/$VERSION/main/privkey.pem
sudo chmod 600 /etc/postgresql/$VERSION/main/fullchain.pem /etc/postgresql/$VERSION/main/privkey.pem
sudo chown postgres:postgres /etc/postgresql/$VERSION/main/fullchain.pem /etc/postgresql/$VERSION/main/privkey.pem
sudo systemctl restart postgresql
```
Remember that these SSL certificates are valid for 90 days and should be updated every 60 days. One way of automating this process is by using `cron`.
```bash
crontab -e
```
Now go to the last line and paste the text given below. Make sure to replace $HOSTNAME and $VERSION with their actual values before saving. This command may look messy but it gets the job done.
```markdown
02  08  *   *   *   /opt/certbot/bin/certbot renew --post-hook "sudo cp /etc/letsencrypt/live/$HOSTNAME/fullchain.pem /etc/postgresql/$VERSION/main/fullchain.pem && sudo cp /etc/letsencrypt/live/$HOSTNAME/privkey.pem /etc/postgresql/$VERSION/main/privkey.pem && sudo chmod 600 /etc/postgresql/$VERSION/main/fullchain.pem /etc/postgresql/$VERSION/main/privkey.pem && sudo chown postgres:postgres /etc/postgresql/$VERSION/main/fullchain.pem /etc/postgresql/$VERSION/main/privkey.pem && sudo systemctl restart postgresql" --quiet
```
That's it, we should be able to create test database now.
```bash
sudo -u postgres psql
```
Within the SQL prompt, use the following query to create a database now. Make sure that you use a long (more than 20 characters with uppercase, lowercase, digits, and special characters included) and strong password since your database is exposed to the public and is vulnerable against attacks.
```sql
create database mydb;
create user myuser with encrypted password 'mypass';
grant all privileges on database mydb to myuser;
```
Let us reboot our server now to make sure everything works well.
```bash
sudo reboot
```
To verify if your connections are using SSL, run the following SQL query.
```sql
SELECT ssl.pid, usename, datname, ssl, ssl.version, ssl.cipher, ssl.bits, client_addr
FROM pg_catalog.pg_stat_ssl ssl, pg_catalog.pg_stat_activity activity
WHERE ssl.pid = activity.pid
LIMIT 100
```
That's it! You can now run your own PostgreSQL instance on the web. 

## References
1. https://linuxconfig.org/ubuntu-22-04-postgresql-installation
1. https://www.learnitguide.net/2022/04/install-certbot-on-ubuntu.html
1.  https://docs.min.io/docs/generate-let-s-encypt-certificate-using-concert-for-minio.html
1. https://loganmarchione.com/2020/10/securing-postgres-connections-using-lets-encrypt-certificates/
1. https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e

All commands are available on this Github Gist.

<script src="https://gist.github.com/somnathrakshit/4d4cd4c19f13013075164490dc4b6827.js"></script>