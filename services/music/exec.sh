#!/bin/sh

apk add nfs-utils
mount -t nfs disk.taka-app.net:/volume1/music /music
exec /app/navidrome
