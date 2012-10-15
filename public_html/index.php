<?php
/**
 * This is main index file
 *
 */
require 'Slim/Slim.php';
\Slim\Slim::registerAutoloader();


$app = new \Slim\Slim();
require '../app/routes/session.php';
require '../app/routes/member.php';
require '../app/routes/admin.php';
$app->run();
