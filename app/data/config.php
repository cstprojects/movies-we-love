<?php

/*
 * MSSQL database connection
 */
/*define("server_name", "MERINSPIRON");
define("db_name", "movies");
define("user_id", "sa");
define("password", "12OtZa34");*/
/*$connectionInfo = array( "Database"=>"movies", "UID"=>"sa", "PWD"=>"12OtZa34");*/

/*
 * MySQL database connection
 */

define("server", "localhost");
define("user", "root");
define("password", "");
define("DB_NAME", "movies");



/*
 * RAPI config
 */
define("api_url", "http://api.rottentomatoes.com/api/public/v1.0/");
define("api_key", "8wu69vmaagyc2cge2a74m9tt");
define("path_to_templates", "/templates");
define("SITE_URL", "http://ibaby.ge/movieator/");
define("main_path", $_SERVER['DOCUMENT_ROOT']. ""); //add folder name if movieator isnt in root of your site
define("REL_PATH_TO_TEMPLATES", SITE_URL . path_to_templates);
define("TEMPLATES_DIR", main_path . path_to_templates);