#!/bin/bash
cluster_machines="$1"
username="$2"
private_key="$3"

script="openslide-setup.sh"

# 1 Copy script to all nodes
echo -e ">> COPYING SCRIPT 🤖\n"
for machine in $(cat "$cluster_machines")
do
  scp -o "StrictHostKeyChecking no" -i "$private_key" "$script" "$username@$machine":~ &> /dev/null
  echo -e "\t + $machine ... OK ☕"
done
echo -e ">> SCRIPT FINISHED SUCCESSFULLY 🍻 \n"


# 2 Installing openslide in all nodes
echo -e ">> INSTALLING SCRIPT 🤖\n"
for machine in $(cat "$cluster_machines")
do
  ssh -o "StrictHostKeyChecking no" -i "$private_key" "$username@$machine" "~/openslide-setup.sh" &> /dev/null
  echo -e "\t + $machine ... OK ☕"
done
echo -e ">> SCRIPT FINISHED SUCCESSFULLY 🍻 \n"


