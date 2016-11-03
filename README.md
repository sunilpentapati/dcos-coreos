# dcos-coreos
DC/OS vagrant on coreos

Build on top of coreos-vagrant project. This vagrant file follows (or tries to follow) the DC/OS install instructions from 

https://dcos.io/docs/1.8/administration/installing/custom/advanced/

System Requirements:

1. Vagrant (obviously)
2. Minimum 6G RAM (very conservative)
3. 3 Cores 

This config will create a minimum 3 machines 

1. Bootstrap server
2. Mesos-master node
3. Mesos-agent nodes

It only makes sense to modify the value of mesos-agent nodes, as you want to modify anything, you might as well run the official mesosphere vagrant box based on CentOS. The reason I have created this project itself is to have lower system requirement for some poor devs who cannot afford 16G of spare memory to run the vagrant box.
