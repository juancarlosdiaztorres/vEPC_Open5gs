sudo docker network create -d macvlan --subnet=172.30.2.0/24 --gateway=172.30.2.1 -o parent=enp0s3.100 physical
#sudo docker network create -d macvlan --subnet=172.30.0.0/16 --gateway=172.30.0.1 -o parent=enp0s3.100 physical

