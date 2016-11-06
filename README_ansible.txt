https://oliverveits.wordpress.com/2015/11/09/it-automation-a-hello-world-example-using-ansible-on-docker/


https://serversforhackers.com/an-ansible-tutorial

ansible all -m ping
ansible all --user=root -m shell -a 'apt-get update'
ansible all --user=root -m shell -a 'apt-get install -y nginx'
ansible all -s -m apt -a 'pkg=nginx state=installed update_cache=true'
ansible all -s -m apt -a 'pkg=nginx state=absent update_cache=true'

#: Playbooks can run multiple Tasks and provide some more advanced functionality
file nginx.yml sieht wie folgt aus.
---
- hosts: local
  tasks:
   - name: Install Nginx
     apt: pkg=nginx state=installed update_cache=true

ansible-playbook --user=root nginx.yml


# Handler is exactly the same as a Task (it can do anything a Task can), but it will run when called by another Task

# nginx.yml erweitern wie folgt:
---
- hosts: local
  tasks:
   - name: Install Nginx
     apt: pkg=nginx state=installed update_cache=true
     notify:
      - Start Nginx

  handlers:
   - name: Start Nginx
     service: name=nginx state=started




# Roles are good for organizing multiple, related Tasks and encapsulating data needed to accomplish those Tasks.
# The configuration portion often requires extra data such as variables, files, dynamic templates and more. 
# These tools can be used with Playbooks, but we can do better immediately by organizing related Tasks and data into one coherent structure: a Role.

# Roles have a directory structure like this:

rolename
 - files
 - handlers
 - meta
 - templates
 - tasks
 - vars

# Within each directory, Ansible will search for and read any Yaml file called main.yml automatically


