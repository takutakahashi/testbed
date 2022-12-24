#!/bin/bash -x
apt update && apt install -y rsync
cat /mnt/ssh/ssh_host_ecdsa_key |base64 --decode > /etc/ssh/ssh_host_ecdsa_key
cat /mnt/ssh/ssh_host_ed25519_key |base64 --decode > /etc/ssh/ssh_host_ed25519_key
cat /mnt/ssh/ssh_host_rsa_key |base64 --decode > /etc/ssh/ssh_host_rsa_key
chmod 600 /etc/ssh/ssh_host_ecdsa_key
chmod 600 /etc/ssh/ssh_host_ed25519_key
chmod 600 /etc/ssh/ssh_host_rsa_key
apt install -y ssh
