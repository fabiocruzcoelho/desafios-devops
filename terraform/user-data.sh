#!/bin/bash

# Atualiza SO
yum update -y

# Instala Docker
yum install docker -y 

# Start docker
service docker start

# Inicia container com apache
docker run -p 80:80 -d httpd
