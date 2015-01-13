#!/bin/bash

sed -i 's|localhost|'"${DBHOST}"'|g' index.php
sed -i 's|.*/FrameworkBenchmarks/php-fatfree|'"${TROOT}"'|g' deploy/php
sed -i 's|Directory .*/FrameworkBenchmarks/php-fatfree|Directory '"${TROOT}"'|g' deploy/php
sed -i 's|root .*/FrameworkBenchmarks/php-fatfree|root '"${TROOT}"'|g' deploy/nginx.conf
sed -i 's|/usr/local/nginx/|'"${IROOT}"'/nginx/|g' deploy/nginx.conf

export PATH="$PHP_HOME/bin:$PHP_HOME/sbin:$PATH"

$PHP_FPM --fpm-config $FWROOT/config/php-fpm.conf -g $TROOT/deploy/php-fpm.pid
$NGINX_HOME/sbin/nginx -c $TROOT/deploy/nginx.conf