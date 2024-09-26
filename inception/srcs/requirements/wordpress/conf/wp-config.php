<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //

/** The name of the database for WordPress */
define('DB_NAME', getenv('WORDPRESS_DB_NAME'));

/** Database username */
define('DB_USER', trim(file_get_contents(getenv('WORDPRESS_DB_USER_FILE'))));

/** Database password */
define('DB_PASSWORD', trim(file_get_contents(getenv('WORDPRESS_DB_PASSWORD_FILE'))));

/** Database hostname */
define('DB_HOST', getenv('WORDPRESS_DB_HOST'));

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         trim(file_get_contents('/run/secrets/auth_key')));
define('SECURE_AUTH_KEY',  trim(file_get_contents('/run/secrets/secure_auth_key')));
define('LOGGED_IN_KEY',    trim(file_get_contents('/run/secrets/logged_in_key')));
define('NONCE_KEY',        trim(file_get_contents('/run/secrets/nonce_key')));
define('AUTH_SALT',        trim(file_get_contents('/run/secrets/auth_salt')));
define('SECURE_AUTH_SALT', trim(file_get_contents('/run/secrets/secure_auth_salt')));
define('LOGGED_IN_SALT',   trim(file_get_contents('/run/secrets/logged_in_salt')));
define('NONCE_SALT',       trim(file_get_contents('/run/secrets/nonce_salt')));

/**#@-*/
/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */

// define( 'WP_DEBUG', false );
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', true );

/* Add any custom values between this line and the "stop editing" line. */

// define('WPLANG', 'fr_FR');

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';