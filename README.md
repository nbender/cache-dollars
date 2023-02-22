# cache-dollars
cache benchmarking

# software

https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart

sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service
sudo -u postgres createuser --interactive
createdb ubuntu

https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04

sudo apt install redis-server
sudo nano /etc/redis/redis.conf
sudo vi /etc/redis/redis.conf
sudo systemctl restart redis.service
sudo systemctl status redis

https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
sudo apt-get install gnupg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl status mongod

# data

https://github.com/eliangcs/pystock-data

# script

mkdir ~/git
cd ~/git
git clone https://github.com/nbender/cache-dollars
git clone https://github.com/eliangcs/pystock-data

cd ~/git/pystock-data
