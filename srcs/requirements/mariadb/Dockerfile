# FROM debian:bullseye

# # Installation de MariaDB
# RUN apt-get update && \
#     apt-get install -y mariadb-server && \
#     rm -rf /var/lib/apt/lists/*

# # Configuration personnalisée de MariaDB
# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# # Exposition du port 3306
# EXPOSE 3306

# # Commande pour démarrer MariaDB
# CMD ["mysqld"]


FROM debian:buster

RUN apt update; \
    apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/createdb.sql /

RUN service mysql start && mysql < createdb.sql && rm -f createdb.sql

EXPOSE 3306

CMD /usr/bin/mysqld_safe