#!/bin/bash
# Définit le shell utilisé pour exécuter le script, ici bash.

chown -R www-data /var/www/wordpress
# Change le propriétaire de tous les fichiers dans /var/www/wordpress à l'utilisateur 'www-data'.

chmod -R 775 /var/www/wordpress
# Modifie les permissions pour tous les fichiers dans /var/www/wordpress. 
# 775 signifie que le propriétaire et le groupe peuvent lire, écrire et exécuter, tandis que les autres peuvent lire et exécuter.

mkdir -p /run/php/
# Crée le répertoire /run/php/ s'il n'existe pas déjà.

touch /run/php/php7.3-fpm.pid
# Crée un fichier vide nommé php7.3-fpm.pid dans /run/php/. 
# Ce fichier est souvent utilisé pour stocker l'ID de processus du daemon PHP-FPM.

if [ ! -f /var/www/wordpress/wp-config.php ]; then
# Vérifie si le fichier wp-config.php n'existe pas dans /var/www/wordpress.

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    # Télécharge le fichier wp-cli.phar depuis le dépôt GitHub de WP-CLI.

    chmod +x wp-cli.phar
    # Rend le fichier wp-cli.phar exécutable.

    mv wp-cli.phar /usr/local/bin/wp
    # Déplace wp-cli.phar dans le répertoire /usr/local/bin/ et le renomme en 'wp'.

    cd /var/www/wordpress
    # Change le répertoire courant en /var/www/wordpress.

    wp core download --allow-root
    # Télécharge les fichiers core de WordPress en utilisant WP-CLI, permettant l'exécution en tant que root.

    mv /var/www/wp-config.php /var/www/wordpress/
    # Déplace wp-config.php du répertoire /var/www/ au répertoire /var/www/wordpress/.

    wp core install --allow-root --url=${DOMAIN_NAME} \
                    --title=${WORDPRESS_NAME} \
                    --admin_user=${WORDPRESS_ROOT_LOGIN} \
                    --admin_password=${MYSQL_ROOT_PASSWORD} \
                    --admin_email=${WORDPRESS_ROOT_EMAIL}
    # Installe WordPress avec les paramètres spécifiés.

    wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} \
                    --user_pass=${MYSQL_PASSWORD} \
                    --role=author --allow-root
    # Crée un utilisateur WordPress avec le rôle 'author'.

    wp theme install inspiro --activate --allow-root
    # Installe et active le thème 'inspiro'.

    wp plugin install redis-cache --activate --allow-root
    # Installe et active le plugin 'redis-cache'.

    wp plugin update --all --allow-root
    # Met à jour tous les plugins installés.

    wp plugin activate redis-cache --allow-root
    # Active le plugin 'redis-cache'.

fi
# Fin du bloc 'if'.

wp redis enable --force --allow-root
# Active le support de Redis pour la mise en cache, même si déjà activé.

/usr/sbin/php-fpm7.3 -F
# Lance PHP-FPM 7.3 en mode foreground.
