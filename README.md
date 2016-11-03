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

It only makes sense to modify the value of mesos-agent nodes, if you want to modify master, you might as well run the official mesosphere vagrant box based on CentOS. The reason I have created this project itself is to have lower system requirement for some poor devs who cannot afford 16G of spare memory to run the vagrant box.

Setup Instructions:

1. git clone git@github.com:sivaramsk/dcos-coreos.git
2. cd dcos-coreos
3. Edit the Vagrantfile if you want to increase the number of agent with the variable 
	$num_agent = 3 
4. vagrant up
5. Related IP's
	bootstrap server = 172.17.8.100
        mesos master     = 172.17.8.101
        agent 		 = 172.17.8.102
6. Hit the ip https://172.17.8.101 to use the SSO and sign on.	

