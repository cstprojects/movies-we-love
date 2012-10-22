<?php

include("Slim/Slim.php");
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

include("../app/routes/admin.php");
include("../app/routes/member.php");
include("../app/routes/session.php");


$app->run();