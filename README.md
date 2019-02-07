# packer-virtualbox
This repo allows for the building of Vagrant boxes for Virtualbox using Packer.

You will need to create a file named `setenv.sh` in the current directory.
vagrant plugin install vagrant-vbguest
vagrant init rustic/fedora29-minimal 
vagrant up
dnf -y upgrade
reboot

dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
dnf -y install git docker-ce docker-ce-cli containerd.io
systemctl start docker
git clone https://github.com/rustic/packer-virtualbox.git
export ATLAS_TOKEN="{{fill in atlas token}}"
cd packer-virtualbox
https://github.com/rustic/fedora29-minimal.git

docker run -v $(pwd):/tmp -i -t --entrypoint /bin/bash packer-virtualbox