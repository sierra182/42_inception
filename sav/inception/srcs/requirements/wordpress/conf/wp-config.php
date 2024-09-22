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
// define( 'DB_NAME', '${WORDPRESS_DB_NAME}' );
// define( 'DB_NAME', 'wordpress_db' );
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME'));
/** Database username */
// define( 'DB_USER', 'mon_utilisateur' );
// define( 'DB_USER', getenv('WORDPRESS_DB_USER') );
// echo "DB_USER: " . getenv('WORDPRESS_DB_USER') . "<br>";
// define( 'DB_USER', $_SERVER['WORDPRESS_DB_USER'] );
// echo "DB_USER: " . $_SERVER['WORDPRESS_DB_USER'] . "<br>";
/** Database password */
// define( 'DB_PASSWORD', '${WORDPRESS_DB_PASSWORD}' );
// define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

// define( 'DB_USER', trim(file_get_contents('/run/secrets/db_user')) );
define( 'DB_USER', trim(file_get_contents(getenv('WORDPRESS_DB_USER_FILE'))) );

define( 'DB_PASSWORD', trim(file_get_contents(getenv('WORDPRESS_DB_PASSWORD_FILE'))) );
// define( 'DB_PASSWORD', trim(file_get_contents('/run/secrets/db_password')) );
// define( 'DB_PASSWORD', 'mon_mot_de_passe' );

/** Database hostname */
// define( 'DB_HOST', '${WORDPRESS_DB_HOST}' );
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST'));// 'mariadb' );

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

define('AUTH_KEY',         '(HE@W#V$&b):^W4x)0I~,F>J=5snW=ajgBNH2*P!5YR&W2qakv@D C)jczVY9yM>');
define('SECURE_AUTH_KEY',  'p ,4$P s,cz_%adLb.QU+xAPS~g;fF2$!(yDoJG1[L{o`J+<0>a%F{a@jew~{QOB');
define('LOGGED_IN_KEY',    '5i3N}+#XSg,G%{!DH%Za8VmQ~x+N6*~)ac$MQO:|%piO8n;OOj9QmE/FQ}aWdNO|');
define('NONCE_KEY',        'b*a-;9}z%Q>>iO)~e~Xu5bZEn-*+w|rni<KF>[4l&l76Bzexy1?E VG_L@576vc)');
define('AUTH_SALT',        'vm]F>56m(v9t(vw_9P+;*tu0CP0)1K/>/gG;CS9, ^Ptmb,,Hnlp:V~4Mf4sto-D');
define('SECURE_AUTH_SALT', 'iA0yt1:sv.n<I+6Qz%D <m<2H1W1S<m7k;oSKJ0}[qo_Tms;Vvt7-GGQ5.4Eb|Gi');
define('LOGGED_IN_SALT',   'w~AnV!FTqP}aH<La`6`G4NHOA Xw3f<~Zi@Fq+|EX7SPtaS+Ws`7f%FK%B5^ VQz');
define('NONCE_SALT',       'x+gLW}DoVWV4U|%(}e 7fr0.Rh5a)PAlAqoD~opRx(eV$KtCtB-9JU|xUq*Q,>Kg');

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