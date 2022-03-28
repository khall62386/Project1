# Project1
Cyber Security ELK-Stack Project 1
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the PLAYBOOK file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly AVAILABLE, in addition to restricting ACCESS to the network.

  The Jump box is a hardened and secure system on a network. Admins will use jump to access other servers.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the DATA and SYSTEM logs.
- _TODO: What does Filebeat watch for?_
1. Filebeat is used to watche for changes in the system logs, and forwards any changes to the Elasticsearch Host. 
- _TODO: What does Metricbeat record?_
2. Metricbeat gathers metric and system resources usage for display in Elasticsearch.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function            | IP Address | Operating System |
|----------|---------------------|------------|------------------|
| Jump Box | Gateway             | 10.0.0.1   | Linux            |
| Web-1    | WebServer           | 10.0.0.8   | Linux            |
| Web-2    | WebServer           | 10.0.0.9   | Linux            |
| Elk      | ElasticSearch Stack | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JUMPBOX machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_
  
  ** 40.78.44.109

Machines within the network can only be accessed by the JUMPBOX.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
  
   **Jumpbox
   -Public IP 191.96.206.31
   -Private IP 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Addresses |
|------------|---------------------|----------------------|
| Jump Box   | yes                 |    40.78.44.109      |
| Web-1      | NO                  |    LB 40.118.230.92  |
| Web-2      | NO                  |                      |
| Web-3      | NO                  |                      |
| Elk-Server | No                  |                      |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with ansible?
1. It allows for full automaiton of a specific server and reduces configuration errors.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
1. Install Docker; Installs the core docker code to a remote server.
2. Install Python3_pip; Pip is an installation module that allows for additional docker modules to be installed easier.
3. Docker Modules: Tells the previous PIP module to install the necessary docker component modules.
4. Increase Memory/Use More Memory: A common issue with the ELK Docker image is to little memory. This helps fix the issuess to allow the server to launch properly.
5. Download and launch ELK Container; This downloads the ELK docker container and initialize it with the specified ports being published.
- ...
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
sudo docker ps (screenshot).

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
1. Web-1 10.0.0.8
2. Web-2 10.0.0.9
3. Web-3 10.0.0.7

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
1. Filebeat: Web1, Web2, Web3, Elk
2. Metricbeat: Web1, Web2, Web3, Elk

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
1. Filebeats collect system events such as logins to see whos actively logging into the system. 
2. Metricbeats collects useful information such as cpu usage and memory, this is particularly useful when seeing if there are any aberant programs or behaviors taking system resources

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELK_INSTALL.YML file to /ETC/ANSIBLE/ROLES/ELK_INSTALL.YML.
- Update the HOST file to include the attribute, such as ELK then include your destination ip of the ELK server directly....
- Run the playbook, Ansible-playbook filebeat-playbook.yml and navigate to http://[20.231.54.23]:5601/app/kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
1. Copy the elk_install.yml file to /etc/ansible/roles/elk_install.yml

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
2. Update the hosts file to include the attribute, such as [elk], then include your destination ip of the ELK server directly below.

- _Which URL do you navigate to in order to check that the ELK server is running?
 3. Run the playbook, Ansible-playbook filebeat-playbook.yml and navigate to http://[20.231.54.23]:5601/app/kibana to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
 1. On Jump Box run the following commands /etc/ansible/install-elk.yml
 2. Edit the hosts file in /etc/ansible, nano hosts and add this script
   [elk]
   10.1.0.4 ansible_python_interpreter=/usr/bin/python3
 3. To run the playbook: ansible-playbook install-elk.yml
 4. Check the installation to see if it is working by visiting http://http://20.231.54.23:5601/app/kibana.
 5. Install Filebeats
   A. Download the playbook with the following command: ansible-playbook filebeat-playbook.yml
