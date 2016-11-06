# Netzwerk wie folgt erstellt:
#docker network create private --subnet 172.28.0.0/16

docker run -itd -h dev1 -v /home/pepi/docker/ansible/shared_filesystem:/var/shared_filesystem  -p 9999:80 -p 9998:8080 krh/ansible
docker run -itd -h prod1 --net private --ip 172.28.0.2 -v /home/pepi/docker/ansible/shared_filesystem:/var/shared_filesystem  krh/ansible



