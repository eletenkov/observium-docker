# Docker container for Observium Community Edition
Observium is network monitoring with intuition. It is a low-maintenance auto-discovering network monitoring platform supporting a wide range of device types, platforms and operating systems including Cisco, Windows, Linux, HP, Juniper, Dell, FreeBSD, Brocade, Netscaler, NetApp and many more. Observium focuses on providing a beautiful and powerful yet simple and intuitive interface to the health and status of your network. For more information, go to http://www.observium.org site.

## Usage
Either follow the choice 1. or 2. below to run Observium.

### 1. Manual Run Containers
- Prepare working directory for docker containers, for example below.
```
  $ mkdir /srv/docker/observium
  $ cd /srv/docker/observium
  $ mkidr data logs rrd
```
- Run official MariaDB container
```
  $ docker run --name observiumdb
    -v /srv/docker/observium/data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=passw0rd \
    -e MYSQL_USER=observium \
    -e MYSQL_PASSWORD=passw0rd \
    -e MYSQL_DATABASE=observium
    -e TZ=Asia/Bangkok
    mariadb
```

- Run this Observium container
```
  $ docker run --name observiumapp --link observiumdb:observiumdb \
    -v /srv/docker/observium/logs:/opt/observium/logs \
    -v /srv/docker/observium/rrd:/opt/observium/rrd \
    -e OBSERVIUM_ADMIN_USER=admin \
    -e OBSERVIUM_ADMIN_PASS=passw0rd \
    -e OBSERVIUM_DB_HOST=observiumdb \
    -e OBSERVIUM_DB_USER=observium \
    -e OBSERVIUM_DB_PASS=passw0rd \
    -e OBSERVIUM_DB_NAME=observium \
    -e TZ=Asia/Bangkok
    -p 80:80
    mbixtech/observium
```

> Note: You must replace passwords specified in environment parameters of both containers with your secure passwords instead.

### 2. Use Docker Composer
- Follow instuctions below to create extra working directory of docker containers.
```
  $ mkdir /srv/docker/observium
  $ cd observium
  $ mkdir db lock mysql
```
> You can change /home/docker directory to your desired directory and you need to change the volume mapping directories in docker-compose.yml file also.

- Download docker-compose.yml file from https://github.com/MandarinSolutions/observium-docker github repository. Then, place docker-compose.yml file into /home/docker/observium directory.

- Run both database and observium containers.
```
  $ docker-compose up
```

## Changes


## Source Repository
See source of project at https://github.com/MandarinSolutions/observium-op
and https://github.com/MandarinSolutions/observium-docker
