#!/bin/bash

# Enable PHP modules
#a2query -m php7.0
#a2enmod php7.0
phpenmod mcrypt

# Install Composer
curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin --version=1.0.0-alpha8
