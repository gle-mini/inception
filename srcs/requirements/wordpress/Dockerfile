FROM debian:bullseye

RUN apt update; \
    apt install -y php7.4 php-mysqli php-fpm mariadb-client curl sendmail

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./conf /var/www/

EXPOSE 9000

CMD ["bash", "/var/www/setup.sh"]
