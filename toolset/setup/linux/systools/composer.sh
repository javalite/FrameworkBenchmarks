#!/bin/bash

RETCODE=$(fw_exists ${IROOT}/php-composer.installed)
[ ! "$RETCODE" == 0 ] || { return 0; }

fw_depends php
fw_get https://getcomposer.org/installer -O composer-installer.php

mkdir -p php-composer

# Use the PHP from our IROOT directory
PHP_HOME=${IROOT}/php-5.5.17
${PHP_HOME}/bin/php composer-installer.php --install-dir=$IROOT

touch ${IROOT}/php-composer.installed