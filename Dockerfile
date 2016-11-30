# Latest Ubuntu LTS
#FROM ubuntu:14.04
FROM ubuntu
MAINTAINER Toshio Kuratomi <tkuratomi@ansible.com>

ENV http_proxy http://proxy.infet.ejpd.admin.ch:8080
ENV https_proxy http://proxy.infet.ejpd.admin.ch:8080
ENV no_proxy .admin.ch, local, localhost, 127.0.0.1, 172.17.0.2, 172.17.0.3, 172.17.0.4, isc-ejpd-poc-sp.sysp, isc-ejpd-poc-sp, isc-ejpd-poc-idp.sysp, isc-ejpd-poc-idp, isc-ejpd-poc-client.sysp

# inklusive pyhton-apt, sonst geht module apt nicht...
RUN set -x; \
    apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \
    apt-get install -y ssh  && \
    apt-get install python-apt -y && \		
    apt-get install aptitude -y 
    
COPY .ssh /root/.ssh
COPY sshd_config /etc/ssh
#RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts	# Neue Zeile mit \n wird nicht gemacht...?
RUN ["service", "ssh", "start"]
#CMD ["service", "ansible", "start"]
#CMD ["/bin/bash"]
CMD service ssh start && /bin/bash 

