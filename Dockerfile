ARG COMPOSER_VERSION=latest
ARG PHP_VERSION=7.4

FROM composer:${COMPOSER_VERSION} AS build
RUN composer global require overtrue/phplint
RUN composer global require "squizlabs/php_codesniffer=*"

FROM php:${PHP_VERSION}-cli-alpine
COPY --from=build /tmp/vendor /root/.composer/vendor
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/sh"]
