CREATE DATABASE Base;
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON Base.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';


-- -- Créer une nouvelle base de données
-- CREATE DATABASE IF NOT EXISTS wordpress_db;

-- -- Créer un nouvel utilisateur et définir un mot de passe
-- CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'wp_pass';

-- -- Accorder tous les privilèges à l'utilisateur sur la base de données
-- GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'%';

-- -- Appliquer immédiatement les privilèges
-- FLUSH PRIVILEGES;
