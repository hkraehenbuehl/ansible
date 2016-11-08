#docker run -it --env-file ~/docker/env.env -v /home/isc-krh/docker/ansible/shared_filesystem:/var/shared_filesystem docker-ansible-base 

docker run -itd -h dev1 --env-file ~/docker/env.env -v /home/isc-krh/docker/ansible/shared_filesystem:/var/shared_filesystem -p 9999:80 -p 9998:8080 krh/ansible

docker run -itd -h prod1 --network=private --ip=172.28.0.2 --env-file ~/docker/env.env -v /home/isc-krh/docker/ansible/shared_filesystem:/var/shared_filesystem krh/ansible

