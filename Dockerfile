FROM phpdockerio/php72-fpm:latest
WORKDIR "/application"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
		&& apt-get -y install openssh-server \
    && apt-get -y --no-install-recommends install  php7.2-mysql php-xdebug php7.2-bcmath php7.2-gd php-imagick php-yaml \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
