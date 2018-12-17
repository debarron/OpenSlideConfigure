# OpenSlideConfigure 

Install <a href="https://openslide.org/">OpenSlide</a> over a computing cluster. This repository has been tested using the <a href="https://cloudlab.us/">CloudLab</a> platform.

## Distributed Pre-requisites:
The scripts assume that:
1. All nodes share a trusted connection between them.
2. A distributed execution is done by a machine outside the computing cluster.
3. There is a trusted connection between the machine executing the script and all nodes in the cluster.
4. All machines' public host names are written in a text file.

## Distributed execution
Please meet all the pre-requisites listed above first, then:
`./openslide-configure.sh MACHINE_LIST_FILE.txt USER_NAME PRIVATE_KEY`

Example:
`./openslide-configure.sh my_machines.txt jhondoe ~/.ssh/id_cluster_key`

## Local execution
If a local install is needed, run:
`./openslide-setup.sh`

Big shout out to <a href="https://github.com/anask">@anask</a> and <a href="https://github.com/hastimal">@hastimal</a> for their support and guidance.

