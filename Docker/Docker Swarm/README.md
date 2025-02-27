Run commands on Node1:

sudo docker swarm init --advertise-addr <Master1-IP>

docker swarm join-token manager

docker swarm join-token worker


Run Commands on Node 2 (Master):

docker swarm join --token <Manager TOKEN> <Master1-IP>:2377

Run commands on Worker Nodes:

docker swarm join --token <Worker TOKEN> <Master1-IP>:2377