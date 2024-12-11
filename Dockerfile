FROM ubuntu:latest
MAINTAINER team6

### install iproute2 server

RUN apt-get update && apt-get install iproute2 inetutils-ping net-tools iputils-tracepath sudo -y

### Create team user with sudo privileges

RUN useradd -ms /bin/bash team
RUN echo 'team:team1' | chpasswd

### PORT WE WANT TO EXPOSE

EXPOSE 80

### APPLICATION SPECIFIC ITEMS

RUN apt-get install -y nginx
COPY index.html /var/www/html/index.nginx-debian.html

###Entrypoint

CMD ["nginx", "-g", "daemon off;"]
