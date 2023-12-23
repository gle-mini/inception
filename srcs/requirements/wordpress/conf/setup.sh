#!/bin/bash

# Modification du propriétaire et des permissions pour le répertoire WordPress
chown -R www-data /var/www/wordpress
chmod -R 775 /var/www/wordpress

# Création du répertoire et du fichier PID pour PHP-FPM
mkdir -p /run/php/
touch /run/php/php7.4-fpm.pid

# Installation de WordPress si wp-config.php n'existe pas
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    # Téléchargement de WP-CLI pour gérer WordPress en ligne de commande
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    # Téléchargement et vérification de la somme de contrôle de WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar.sha256
    sha256sum -c wp-cli.phar.sha256
    if [ $? -ne 0 ]; then
        echo "La vérification de la somme de contrôle de WP-CLI a échoué."
        exit 1
    fi

    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # Déplacement dans le répertoire WordPress et téléchargement du noyau WordPress
    cd /var/www/wordpress
    wp core download --allow-root

    # Déplacement du fichier de configuration wp-config.php
    mv /var/www/wp-config.php /var/www/wordpress/

    # Installation de WordPress avec les variables d'environnement spécifiées
    wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}

    # Création d'un nouvel utilisateur WordPress
    wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root

    # Installation et activation du thème 'inspiro'
    wp theme install inspiro --activate --allow-root

    # Installation et activation du plugin 'redis-cache'
    wp plugin install redis-cache --activate --allow-root

    # Mise à jour de tous les plugins
    wp plugin update --all --allow-root

    # Activation du plugin 'redis-cache' (répétition, peut être redondant)
    wp plugin activate redis-cache --allow-root
fi

# Activation du cache Redis pour WordPress
wp redis enable --force --allow-root

# Démarrage de PHP-FPM en mode foreground
/usr/sbin/php-fpm7.4 -F
