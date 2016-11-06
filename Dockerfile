FROM ubuntu
 MAINTAINER yourname
 RUN apt-get -y update
 RUN apt-get install -y python-yaml python-jinja2 git ansible ssh vim net-tools
 RUN git clone http://github.com/ansible/ansible.git /tmp/ansible
 #WORKDIR /tmp/ansible
 #ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin:/bin
 #ENV ANSIBLE_LIBRARY /tmp/ansible/library
 #ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH
 #RUN git clone https://github.com/hkraehenbuehl/test.git /tmp/example
 #WORKDIR /tmp/examples
 #RUN pwd
 RUN /bin/ls -l  
 RUN /bin/mkdir -p /etc/ansible 
 RUN /bin/echo -e "[hosts]\nlocalhost ansible_connection=local\n" >/etc/ansible/hosts
 RUN /bin/cat /etc/ansible/hosts
 #ADD inventory /etc/ansible/hosts
 #RUN ansible all -m ping 
 #RUN ansible-playbook /tmp/example/tree.yml -c local
 #EXPOSE 22 3000
 #ENTRYPOINT [“/usr/bin/foo”]
 #RUN ["service","ssh","start"]			# der will einfach nicht....


 COPY .ssh /root/.ssh
 COPY sshd_config /etc/ssh

 cmd service ssh start && /bin/bash




