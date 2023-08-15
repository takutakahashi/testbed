#!/bin/bash
POD_IP_BEFORE=""
apt update && apt install -y gettext-base curl
curl -LO "https://dl.k8s.io/release/$(curl -LS https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /bin/
while true; do
  POD_IP=`kubectl get pod workspace-0 -o wide |grep workspace |awk '{print $6}'`
  if [[ "$POD_IP_BEFORE" != "$POD_IP" ]]; then
    cat /files/patch.tpl |POD_IP=$POD_IP envsubst |bash -
    POD_IP_BEFORE=$POD_IP
  fi
  sleep 30
done
