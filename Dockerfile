FROM php:8-apache

ARG DEBIAN_FRONTEND=noninteractive

# Instalar extensiones y dependencias necesarias
RUN apt-get update \
    && apt-get install -y sendmail libpng-dev libzip-dev zlib1g-dev libonig-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install mysqli mbstring zip gd

# Habilitar mod_rewrite para Apache
RUN a2enmod rewrite
