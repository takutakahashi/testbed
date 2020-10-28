#!/bin/bash

ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
mv /root/.ssh/id_rsa.pub /var/www/html/
nginx
sleep 40
sleep infinity
