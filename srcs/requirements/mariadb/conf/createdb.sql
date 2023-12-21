CREATE DATABASE Base;
CREATE USER 'usera'@'%' IDENTIFIED BY '1234abcd';
GRANT ALL PRIVILEGES ON Base.* TO 'usera'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'Gurvan05';


-- -- Créer une nouvelle base de données
-- CREATE DATABASE IF NOT EXISTS wordpress_db;

-- -- Créer un nouvel utilisateur et définir un mot de passe
-- CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'wp_pass';

-- -- Accorder tous les privilèges à l'utilisateur sur la base de données
-- GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'%';

-- -- Appliquer immédiatement les privilèges
-- FLUSH PRIVILEGES;
