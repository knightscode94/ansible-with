#! /bin/bash
ssh qa-manager << EOF
git clone https://github.com/FP-T4/DevOps-Final.git
cd DevOps-Final/
export SECRET_KEY=${SECRET_KEY} 
export DATABASE_URI=${DATABASE_URI} 
docker pull sch0tterfoinfoin/service1:latest
docker pull sch0tterfoinfoin/service2:latest
docker stack deploy --compose-file docker-compose.yaml DevOps-Final
docker service ls
cd .. 
sleep 5
rm -r DevOps-Final/
EOF