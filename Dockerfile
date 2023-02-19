FROM php:8.2.3-fpm

# Let's use bash as a default shell with login each time
SHELL ["/bin/bash", "--login", "-c"]

# Update package list and install necessary libraries
RUN apt-get update \
    && apt-get install -y \
        bash-completion \
        fish \
        g++ \
        git \
        gnupg \
        iproute2 \
        jq \
        libicu-dev \
        libxml2-dev \
        libzip-dev \
        locales \
        nano \
        python3-dev \
        python3-pip \
        python3-setuptools \
        sudo \
        unzip \
        vim \
        wget \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=mlocati/php-extension-installer:2.0.2 /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
    apcu \
    bcmath \
    igbinary \
    intl \
    opcache \
    pdo_mysql \
    xdebug \
    zip

COPY --from=composer:2.5.4 /usr/bin/composer /usr/bin/composer

COPY docker/php/php-dev.ini /usr/local/etc/php/php.ini

# Define used work directory
WORKDIR /app

EXPOSE 9000
