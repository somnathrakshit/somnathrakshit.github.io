---
title: "Install Mastodon using Docker on Linux and expose instance using Cloudflare Tunnels"
date: 2022-12-26
---
This post is about the following:
1. Setup Cloudflare Tunnels to access your website publicly without the risks of opening ports on your router.
1. Install Docker and Docker-Compose on Linux.
1. Install Postgres database using Docker.
1. Install Mastodon on Docker

# Setup Cloudflare Tunnels
I have [another post]({{< ref "/blog/install_cloudflared" >}}) on how to setup Cloudflare Tunnels on Linux. Please follow those steps and then return here. Make sure you use port `3000` instead of port `80` as shown in the example `config.yml` file.

# Install Docker and Docker-Compose
The easiest way to install docker and docker-compose on Linux is to run these commands on your terminal:
```bash
sudo apt-get update && sudo apt-get upgrade
```
Docker provides an automated script that will install docker for you. Beware, always study the script before running it. To study the script, replace `sh` by `cat` in the below command. To run this script, use the below command, unchanged.
```bash
curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh
```
After installing, you may want to add a non-root user to the docker user group so that you can run docker commands without using `sudo` or logging in as root. The syntax for adding users to the Docker group is:
`sudo usermod -aG docker [user_name]`. To add current user to docker group, run:
```bash
sudo usermod -aG docker ${USER}
```
Now, log out of the server with the following command to allow this chage to take effect:
```bash
exit
```
Log back in and run these commands to install docker-compose.
```bash
sudo apt-get install -y libffi-dev libssl-dev
sudo apt install -y python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose
```
Now, enable the Docker system service to start your containers on boot. This is a very nice and important addition. With the following command you can configure your Raspberry Pi to automatically run the Docker system service, whenever it boots up.
```bash
sudo systemctl enable docker
```
The best way to test whether Docker has been set up correctly is to run the Hello World container.
To do so, type in the following command:
```bash
docker run hello-world
```
Once it goes through all the steps, the output should inform you that your installation appears to be working correctly.

# Install Postgres using Docker
Run the commands below to install PostgreSQL using docker.
```bash
docker pull postgres
docker run --name postgresql -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=YOUR_STRONG_PASSWORD -p 5432:5432 -v /data:/var/lib/postgresql/data -d postgres
docker ps -a
```
The output of `docker ps -a` should show the name of the container running and the port associated with it.

# Install Mastodon using Docker
In order to install Mastodon, let us clone the repo from Github using these commands and create a branch called latest using the latest commit. Then, we will checkout this branch and use it to install Mastodon on our instance.
```bash 
git clone https://github.com/mastodon/mastodon.git
cd mastodon
latest=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $lastest -b ${latest}-branch
```
Now, replace docker-compose.yml file using the contents provided below.
```yaml
version: '3'
services:
  db:
    restart: always
    image: postgres:14-alpine
    container_name: postgres
    shm_size: 256mb
    networks:
      - internal_network
    healthcheck:
      test: ['CMD', 'pg_isready', '-U', 'postgres']
    volumes:
      - ./postgres14:/var/lib/postgresql/data
    environment:
      - 'POSTGRES_HOST_AUTH_METHOD=trust'

  redis:
    restart: always
    image: redis:7-alpine
    container_name: redis
    networks:
      - internal_network
    healthcheck:
      test: ['CMD', 'redis-cli', 'ping']
    volumes:
      - ./redis:/data

  # es:
  #   restart: always
  #   image: docker.elastic.co/elasticsearch/elasticsearch:7.17.4
  #   environment:
  #     - "ES_JAVA_OPTS=-Xms512m -Xmx512m -Des.enforce.bootstrap.checks=true"
  #     - "xpack.license.self_generated.type=basic"
  #     - "xpack.security.enabled=false"
  #     - "xpack.watcher.enabled=false"
  #     - "xpack.graph.enabled=false"
  #     - "xpack.ml.enabled=false"
  #     - "bootstrap.memory_lock=true"
  #     - "cluster.name=es-mastodon"
  #     - "discovery.type=single-node"
  #     - "thread_pool.write.queue_size=1000"
  #   networks:
  #      - external_network
  #      - internal_network
  #   healthcheck:
  #      test: ["CMD-SHELL", "curl --silent --fail localhost:9200/_cluster/health || exit 1"]
  #   volumes:
  #      - ./elasticsearch:/usr/share/elasticsearch/data
  #   ulimits:
  #     memlock:
  #       soft: -1
  #       hard: -1
  #     nofile:
  #       soft: 65536
  #       hard: 65536
  #   ports:
  #     - '127.0.0.1:9200:9200'

  web:
#    build: .
    image: tootsuite/mastodon:v4.0.2
    restart: always
    container_name: web
    env_file: .env.production
    command: bash -c "rm -f /mastodon/tmp/pids/server.pid; bundle exec rails s -p 3000"
    networks:
      - external_network
      - internal_network
    healthcheck:
      # prettier-ignore
      test: ['CMD-SHELL', 'wget -q --spider --proxy=off localhost:3000/health || exit 1']
    ports:
      - '127.0.0.1:3000:3000'
    depends_on:
      - db
      - redis
      # - es
    volumes:
      - ./public/system:/mastodon/public/system

  streaming:
#    build: .
    image: tootsuite/mastodon:v4.0.2
    restart: always
    container_name: streaming
    env_file: .env.production
    command: node ./streaming
    networks:
      - external_network
      - internal_network
    healthcheck:
      # prettier-ignore
      test: ['CMD-SHELL', 'wget -q --spider --proxy=off localhost:4000/api/v1/streaming/health || exit 1']
    ports:
      - '127.0.0.1:4000:4000'
    depends_on:
      - db
      - redis
  sidekiq:
#    build: .
    image: tootsuite/mastodon:v4.0.2
    restart: always
    container_name: sidekiq
    env_file: .env.production
    command: bundle exec sidekiq
    depends_on:
      - db
      - redis
    networks:
      - external_network
      - internal_network
    volumes:
      - ./public/system:/mastodon/public/system
    healthcheck:
      test: ['CMD-SHELL', "ps aux | grep '[s]idekiq\ 6' || false"]
  ## Uncomment to enable federation with tor instances along with adding the following ENV variables
  ## http_proxy=http://privoxy:8118
  ## ALLOW_ACCESS_TO_HIDDEN_SERVICE=true
  # tor:
  #   image: sirboops/tor
  #   networks:
  #      - external_network
  #      - internal_network
  #
  # privoxy:
  #   image: sirboops/privoxy
  #   volumes:
  #     - ./priv-config:/opt/config
  #   networks:
  #     - external_network
  #     - internal_network

networks:
  external_network:
  internal_network:
    internal: true
```
You don't need to enable the es instance unless you intend to enable fulltext searching (which is outside the scope of this post). We're almost ready to launch Mastodon's setup utility.

However, if we simply try and launch setup, Docker will refuse to start the containers because .env.production doesn't exist.

I had initially just touch'd the file (because you won't know what to put in it until after setup is complete), however, doing this leads to setup failing part way through.

There's a step where the setup script exports environment variables for use by later steps. However, some of those steps execute within a different container and variables exported in one container won't be available to another, so the streaming container fails to connect to Redis (because it tries to connect to the default - localhost rather than the redis container).

To resolve this, we start by creating .env.production with known connection details (replace the Database password with the correct value)
```bash
cat << EOM > .env.production
DB_HOST=db
DB_PORT=5432
DB_NAME=mastodon
DB_USER=mastodon
DB_PASS=<replace>
REDIS_HOST=redis
REDIS_PORT=6379
REDIS_PASSWORD=
EOM
```
(REDIS_PASSWORD is supposed to have an empty value in the above).

With this file created, we're ready to fire off the setup process
```bash
docker-compose run --rm web bundle exec rake mastodon:setup
```
This will prompt you for some information:
```
Domain name: mastodon.bentasker.co.uk

Single user mode disables registrations and redirects the landing page to your public profile.
Do you want to enable single user mode? No

Are you using Docker to run Mastodon? Yes

PostgreSQL host: db
PostgreSQL port: 5432
Name of PostgreSQL database: postgres
Name of PostgreSQL user: mastodon
Password of PostgreSQL user: 
Database configuration works! 

Redis host: redis
Redis port: 6379
Redis password: 
Redis configuration works!

Do you want to store uploaded files on the cloud? No

Do you want to send e-mails from localhost? No
```
You'll be prompted for SMTP details.

Once you've provided all the necessary information, it'll print a bunch of environment variables
```
LOCAL_DOMAIN=mastodon.bentasker.co.uk
SINGLE_USER_MODE=false
SECRET_KEY_BASE=<redacted>
OTP_SECRET=<redacted>
VAPID_PRIVATE_KEY=<redacted>
VAPID_PUBLIC_KEY=<redacted>
DB_HOST=db
DB_PORT=5432
DB_NAME=mastodon
DB_USER=mastodon
DB_PASS=<redacted>
REDIS_HOST=redis
REDIS_PORT=6379
REDIS_PASSWORD=
SMTP_SERVER=<redacted>
SMTP_PORT=587
SMTP_LOGIN=<redacted>
SMTP_PASSWORD=<redacted>
SMTP_AUTH_METHOD=plain
SMTP_OPENSSL_VERIFY_MODE=peer
SMTP_ENABLE_STARTTLS=always
SMTP_FROM_ADDRESS=<redacted>
```
Take a copy of these, and in another terminal, save them into `.env.production` (you can remove the lines added earlier).

The setup script will ask whether you want to create the admin user, and once that's done will print the initial auto-generated password for this account.
```
Do you want to create an admin user straight away? Yes
Username: admin
E-mail: <redacted>
You can login with the password: <redacted>
You can change your password once you login.
```
The initial setup is now complete, and the container should exit.

If the process failed for some reason, once you've figured out what you need to correct, you can't just re-run the setup script: you'll need to add the following to `.env.production` first
```bash
# Don't add this unless your initial setup failed
DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```
On your re-run, when it asks you if you want to proceed with destroying the database, choose `Yes` (otherwise you'll run into key constraints when it tries to create the admin user).

We now want to briefly run the containers. This will cause the volume directories to be created on disk so that we can set permissions appropriately (reducing risk if something else gets compromised)
```bash
docker-compose up -d # will take a bit
docker-compose down
```
Fix permissions
```bash
sudo chown -R 70:70 postgres
sudo chown -R 991:991 public/
```
It's time to bring the containers up
```bash
docker-compose up -d
```
The system is now up and running: the web container will be listening on the loopback interface for port 3000, and streaming is on 4000.
# References
1. https://dev.to/elalemanyo/how-to-install-docker-and-docker-compose-on-raspberry-pi-1mo
1. https://hevodata.com/learn/docker-postgresql/
1. https://www.bentasker.co.uk/posts/blog/general/running-mastodon-in-docker-compose.html