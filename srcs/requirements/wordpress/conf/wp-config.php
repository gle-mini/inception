<?php
/** The base configuration for WordPress
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 */

/** The name of the database for WordPress */
define('DB_NAME', 'Base');

/** MySQL database username */
define('DB_USER', '${MYSQL_USER}');

/** MySQL database password */
define('DB_PASSWORD', '${MYSQL_PASSWORD}');

/** MySQL hostname */
define('DB_HOST', 'mariadb');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

//** Redis cache settings. */
define('WP_CACHE', true);
define('WP_CACHE_KEY_SALT', 'gurvan.42.fr');
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
// define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_READ_TIMEOUT', 1);
define('WP_REDIS_DATABASE', 0);

/** Authentication Unique Keys and Salts. */

/** WordPress Database Table prefix. */
$table_prefix = 'wp_unic_'; // Remplacez par votre préfixe unique

/** For developers: WordPress debugging mode. */
define('WP_DEBUG', false);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);
@ini_set('display_errors', 0);

/** Security Enhancements */
define('FORCE_SSL_ADMIN', true);
define('DISALLOW_FILE_EDIT', true);

/** Language Settings */
define('WPLANG', 'fr_FR');

/** Memory Limit */
define('WP_MEMORY_LIMIT', '128M');

/** Post Revisions */
define('WP_POST_REVISIONS', 5);

/** Autosave Settings */
define('AUTOSAVE_INTERVAL', 300);
define('WP_AUTO_UPDATE_CORE', true);

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
