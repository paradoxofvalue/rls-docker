#!/bin/bash
apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php5-oldstable
apt-get update
apt-get install -y php5
# Enable PHP modules
php5enmod mcrypt

# Install Composer
curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin --version=1.0.0-alpha8
