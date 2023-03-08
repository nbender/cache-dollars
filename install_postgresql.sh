sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service
sudo -i -u postgres createuser ubuntu -d -r -s
createdb ubuntu

