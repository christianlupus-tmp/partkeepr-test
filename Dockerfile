
FROM php:7.1
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
