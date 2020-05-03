## Create ip allocation in 1st IP
sudo ip link add link ens3 name ens3.100 type vlan id 100
sudo ip addr add 172.30.2.1/24 brd 172.30.2.255 dev ens3.100
sudo ip link set dev ens3.100 up
sudo docker network create -d macvlan --subnet=172.30.2.0/24 --gateway=172.30.2.1 -o parent=ens3.100 physical

