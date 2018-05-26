#!/bin/bash
set -ex
echo "Configuring nginx.conf"
/bin/sed -i "s~__BUCKET__~$BUCKET~" /nginx.conf
/bin/sed -i "s~__AWS_ACCESS_KEY__~$AWS_ACCESS_KEY~" /nginx.conf
/bin/sed -i "s~__AWS_SECRET_KEY__~$AWS_SECRET_KEY~" /nginx.conf
echo "$WEB_USER_PWD" | htpasswd -ci /nginx.users $WEB_USER
echo "starting nginx"
/usr/local/nginx/sbin/nginx -c /nginx.conf 