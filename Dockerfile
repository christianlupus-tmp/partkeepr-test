
FROM php:7.1

RUN apt-get update && apt-get install wget

# Install Composer
# See https://tecnstuff.net/how-to-install-composer-on-debian-10/
RUN cd /tmp && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	HASH="$(wget -q -O - https://composer.github.io/installer.sig)" && \
	php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); exit(1); } echo PHP_EOL;" && \
	php composer-setup.php --install-dir=/usr/local/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
