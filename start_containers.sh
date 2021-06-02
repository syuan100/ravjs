
C1=ravjs_worker1
C2=ravjs_worker2
C3=ravjs_worker3

sudo docker stop $C1
sudo docker rm $C1

sudo docker stop $C2
sudo docker rm $C2

sudo docker stop $C3
sudo docker rm $C3

sudo docker run -d -p 4444:4444 -P --name selenium-hub selenium/hub
docker run -d --link selenium-hub:hub -P --name $C1 -p 7900:7900 selenium/node-chrome
docker run -d --link selenium-hub:hub -P --name $C2 -p 7901:7900 selenium/node-chrome
docker run -d --link selenium-hub:hub -P --name $C3 -p 7902:7900 selenium/node-chrome