docker stop squid
docker rm squid
docker rmi daeus/squid

docker build -t daeus/squid .
docker run -d -t --name squid -p 3128:3128 -e ALLOWED_IP="10.0.0.0/8" daeus/squid
