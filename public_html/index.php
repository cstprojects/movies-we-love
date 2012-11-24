<?php
include("../app/data/config.php");


include("Slim/Slim.php");
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

include("../app/routes/admin.php");
include("../app/routes/member.php");
include("../app/routes/session.php");


$app->run();





















/*$serverName = "MERINSPIRON"; //serverName\instanceName
$connectionInfo = array( "Database"=> db_name, "UID"=> user_id, "PWD"=> password);
$conn = sqlsrv_connect( $serverName, $connectionInfo);

if( $conn ) {
    echo "Connection established.<br />";
}else{
    echo "Connection could not be established.<br />";
    die( print_r( sqlsrv_errors(), true));
}

$id = '1';
$result = sqlsrv_query($conn, "SELECT movie_id FROM movies.dbo.movies where id = $id" );


while($row =sqlsrv_fetch_array($result) ){
  $out[] = $row;
}




$result = sqlsrv_fetch_array($result);

if(!$result){
  echo "vaime";
}

print_r($out);*/