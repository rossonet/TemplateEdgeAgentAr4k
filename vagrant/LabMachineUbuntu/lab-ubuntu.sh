#!/bin/bash
sudo apt-get update
sudo apt-get install bash gawk sed grep bc coreutils wget binutils openjdk-11-jdk git -y --fix-missing
echo "clone git repository"
git clone https://github.com/rossonet/EdgeAgentAr4k.git
cd /home/vagrant/EdgeAgentAr4k
echo "build project Debian package"
./gradlew makeDebianDruido
echo "install deb on system"
sudo apt install ./build/distributions/ar4k-agent-druido_*_all.deb -y
echo "restart and enable agent"
sudo systemctl restart ar4k-druido && sudo systemctl enable ar4k-druido
echo "clean"
sudo chown -R vagrant:vagrant /home/vagrant
