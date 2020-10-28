FROM ubuntu:20.04

RUN apt update && apt install -y zfsutils wget curl openssh-server nginx \
 && wget https://github.com/zrepl/zrepl/releases/download/v0.3.0/zrepl-linux-amd64 -O /bin/zrepl \
 && chmod +x /bin/zrepl \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
 && chmod +x kubectl \
 && mv kubectl /bin/

RUN mkdir /run/sshd
RUN mkdir /root/.ssh
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
COPY entrypoint.sh /
COPY replicator.sh /
COPY ssh_config /root/.ssh/config

ENTRYPOINT ["/entrypoint.sh"]
