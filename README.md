# cache-dollars
cache benchmarking

# software

https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart

    sudo apt update
    sudo apt install postgresql postgresql-contrib
    sudo systemctl start postgresql.service
    sudo -u postgres createuser --interactive
    createdb ubuntu

https://www.rosehosting.com/blog/how-to-install-phppgadmin-on-ubuntu-20-04/

    sudo apt install phppgadmin php-pgsql -y
    sudo apt install apache2 php libapache2-mod-php -y
    sudo vi /etc/apache2/sites-enabled/phppgadmin.conf
    
    Alias /phppgadmin /usr/share/phppgadmin
    <Directory /usr/share/phppgadmin>
       <IfModule mod_dir.c>
           DirectoryIndex index.php
       </IfModule>
    AllowOverride None
       <IfModule mod_php.c>
          php_flag magicquotes_gpc Off
          php_flag trackvars On
       </IfModule>
       <IfModule !mod_php.c>
         <IfModule mod_actions.c>
           <IfModule mod_cgi.c>
              AddType application/x-httpd-php .php
              Action application/x-httpd-php /cgi-bin/php
           </IfModule>
           <IfModule mod_cgid.c>
              AddType application/x-httpd-php .php
              Action application/x-httpd-php /cgi-bin/php
           </IfModule>
         </IfModule>
       </IfModule>
    </Directory>
    
    sudo apachectl restart

    sudo vi /etc/apache2/conf-enabled/phppgadmin.conf ## allow connections
    sudo apachectl restart
    psql -c 'ALTER USER ubuntu WITH PASSWORD 'test';'


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

# initialize

    mkdir ~/git
    cd ~/git
    git clone https://github.com/nbender/cache-dollars
    git clone https://github.com/eliangcs/pystock-data

    cd ~/git/cache-dollars
    psql create_tables.sql
    sh load_data.sh
