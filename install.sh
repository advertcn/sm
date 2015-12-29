#!/bin/bash
# auto script to install nginx
cd ~
yum install pcre-devel zlib-devel openssl-devel gcc make subversion wget mail git -y
wget http://nginx.org/download/nginx-1.8.0.tar.gz
git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module.git
tar xzvf nginx-1.8.0.tar.gz
cd nginx-1.8.0
./configure --with-http_ssl_module --add-module=/root/ngx_http_substitutions_filter_module
make
make install
cd ~
wget https://raw.githubusercontent.com/advertcn/server/master/nginx
chmod 755 nginx
cp nginx /etc/init.d/
cp nginx.conf /usr/local/nginx/conf/ -y
chkconfig nginx on
service nginx restart
