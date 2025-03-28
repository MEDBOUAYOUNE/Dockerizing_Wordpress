all: 
	sudo docker-compose -f ./srcs/docker-compose.yml up

down:
	sudo docker-compose -f srcs/docker-compose.yml down -v 

rmf:
	sudo docker rm -f $$(sudo docker ps -qa) ; \
	sudo docker rmi -f $$(sudo docker images -qa) ; \
	sudo docker volume rm $$(sudo docker volume ls -q) ; \
	sudo rm -rf /home/mbouayou/data/mariadb/* ; \
	sudo rm -rf /home/mbouayou/data/wordpress/*


clean: down rmf
