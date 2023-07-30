#!/bin/bash -e
mount -t nfs4 disk.taka-app.net:/volume1/photo /mnt
cd /mnt/interval
gphoto2 --filename %Y%m%d%H%M%S.%C --capture-image-and-download
