apk update
apk upgrade

# install docker
apk add docker docker-cli

# start docker daemon
sudo service docker start

# enable docker to start on boot
# create a symbolic link from the Docker service script 
# in /etc/init.d/docker to the boot runlevel directory.- 
#	
#	/etc/runlevels/boot/docker -> /etc/init.d/docker
sudo rc-update add docker boot
# theres no more docker shenanigans after this line

# install my neovim config dependecies
apk add clang ripgrep luarocks unzip gzip
# install neovim
apk add neovim
