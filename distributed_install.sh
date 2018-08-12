# author: @debarron
# 
# RUN IT AS: ./distributed_install.sh machine_list.txt USER
# 
# This script copies and runs the local_install.sh script into
# each machine included in the machines_list.txt file.

log_file="DISTRIBUTED_LOG.log"
machine_list=$1
user=$2
key=$3


sudo echo -n ">> Checking sudo privileges.."
if [[  "$user" == "root" ]]; then
    echo -e "\nError: Do not run script via sudo, but you must have sudo privileges."
    echo -e "\nError: Do not run script via sudo, but you must have sudo privileges." >> $log_file
    exit 1
fi
echo "OK"


# Let's have fun
for machine in $(cat $machine_list)
do
  copy_cmd="scp -o StrictHostChecking no -i $key local_install.sh $user@$machine:~"
  run_cmd="ssh -o StrictHostChecking no -i $key $user@$machine \"~/local_install.sh\""

  echo ">> Working in $machine"
  echo ">> Running: $copy_cmd"
  echo ">> Working in $machine" >> $log_file
  echo ">> Running: $copy_cmd" >> $log_file 
  eval "$copy_cmd &"

  echo ">> Running: $run_cmd"
  echo ">> Running: $run_cmd" >> $log_file 
  eval "$run_cmd &"

  echo ">> Machine $machine completed"
  echo ">> Machine $machine completed" >> $log_file 
  echo " "
done




echo ">> Script completed"
echo ">> Script completed" >> $log_file 
