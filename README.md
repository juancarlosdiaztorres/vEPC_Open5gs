# vEPC_Open5gs
A repo to deploy Open5GS vEPC using Docker containers

## Launch network config
Before launching this repo, It is needed to config the create-net.sh file according to your scenario: choose and change the value of your main interface name inside this file. Once It is changed, execute:
```
sh create-net.sh
```

## Steps to deploy scenario
Only two steps are neccesary to deploy this scenario:
```
sudo docker-compose -f docker-compose.yml build --no-cache
sudo docker-compose -f docker-compose.yml up
```

These steps are compulsory if Docker images are not downloaded yet. If they are:
```
sudo docker-compose -f docker-compose-prebuilt.yml up
```

## e2e scenario
If RAN elements are needed, move to vRAN_srsLTE repo and follow README instructions to install your complete e2e software defined LTE network.

NOTE: Remember, order is pretty important. First net-config, second vEPC, finally run vRAN.