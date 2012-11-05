<?php
/*
 * embed() implements function for templating
 */
function embed($file_name, $vars) {
  ob_start();
  extract($vars, EXTR_SKIP);
  $file_path = sprintf('%s/%s.tpl.php', TEMPLATES_DIR, $file_name);
  include($file_path);
  $content = ob_get_contents();
  ob_end_clean();
  return $content;
}

function escape_mssql($string) {
  return str_replace("'", "''", $string);
}

function mssql_db_lets_connect() {
  $connectionInfo = array("Database" => db_name, "UID" => user_id, "PWD" => password);
  $conn = sqlsrv_connect(server_name, $connectionInfo);
  if ($conn) {
    return $conn;
  } else {
    die(print_r(sqlsrv_errors(), true));
  }

}

function mysql_db_lets_connect() {
  $conn = mysql_connect(server, user, password);
  if ($conn) {
    mysql_select_db("movies") or die(mysql_error());
    return $conn;
  } else {
    die('Could not connect: ' . mysql_error());
  }



}



function begin()
{
  mysql_query("BEGIN");
}

function commit()
{
  mysql_query("COMMIT");
}

function rollback()
{
  mysql_query("ROLLBACK");
}


