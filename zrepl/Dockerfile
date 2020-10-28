FROM ubuntu:20.04

RUN apt update && apt install -y zfsutils wget \
 && wget https://github.com/zrepl/zrepl/releases/download/v0.3.0/zrepl-linux-amd64 -O /bin/zrepl \
 && chmod +x /bin/zrepl
