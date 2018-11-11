#!/bin/bash

machines="$1"
user="$2"
key="$3"

ssh_command="
export JAVA_HOME='/usr/lib/jvm/default-java'
cd ~/openslide-dep/openslide-java
./configure
make
sudo make install
sudo ln -s /usr/local/lib/openslide-java/libopenslide-jni.so /usr/local/lib/openslide-java/libopenslide-jni.jnilib
"

echo ">> READY TO DISTRIBUTE"
for machine in $(cat "$machines")
do
  ssh -o "StrictHostKeyChecking no" -i "$key" "$user"@"$machine" "$ssh_command"
  echo -e "\t + $machine ... OK 🤖"  
done
echo ">> SCRIPT FINISHED"

