
build:
	perl make_bootstrap.pl
	sudo docker build -t dante .

stop:
	sudo docker rm -f dante; true

start:
	sudo docker run -d --network host --name dante dante

restart: stop start
