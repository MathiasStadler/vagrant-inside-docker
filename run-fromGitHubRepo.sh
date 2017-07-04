#!/bin/bash
docker run  --cidfile /tmp/vagrant-inside-docker.cid --name "vagrant-inside-docker" --privileged -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxnetctl:/dev/vboxnetctl  -it mathiasstadler/vagrant-inside-docker:latest /bin/bash -c "vagrant up --provider virtualbox && vagrant ssh"  
