#!/bin/bash

sed -i 's|192.168.100.102|'"${DBHOST}"'|g' web/index_raw.php
sed -i 's|".*\FrameworkBenchmarks/php-silex|"'"${TROOT}"'|g' deploy/php-silex
sed -i 's|Directory .*/FrameworkBenchmarks/php-silex|Directory '"${TROOT}"'|g' deploy/php-silex
sed -i 's|root .*/FrameworkBenchmarks/php-silex|root '"${TROOT}"'|g' deploy/nginx_raw.conf
sed -i 's|/usr/local/nginx/|'"${IROOT}"'/nginx/|g' deploy/nginx_raw.conf

export PATH="$COMPOSER_HOME:$PHP_HOME/bin:$PHP_HOME/sbin:$PATH"

composer.phar install --optimize-autoloader
$PHP_FPM --fpm-config $FWROOT/config/php-fpm.conf -g $TROOT/deploy/php-fpm.pid
$NGINX_HOME/sbin/nginx -c $TROOT/deploy/nginx_raw.conf