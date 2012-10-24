<?php


function db_lets_connect() {
  $connectionInfo = array("Database" => db_name, "UID" => user_id, "PWD" => password);
  $conn = sqlsrv_connect(server_name, $connectionInfo);
  if ($conn) {
    return $conn;
  } else {
    die(print_r(sqlsrv_errors(), true));
  }

}

function db_insert_movie($movie) {


  $abriged_cast ="";
  foreach($movie->abridged_cast as $star){
    $abriged_cast .= $star->name . '.';
  }
  $links = json_encode($movie->links);
  $posters = json_encode($movie->posters);
  $ratings = json_encode($movie->ratings);
  $release_dates = json_encode($movie->release_dates);
  $genres = json_encode($movie->genres);
  $imdb = $movie->alternate_ids->imdb;
  $conn = db_lets_connect();
  $query =    "INSERT INTO movies
           VALUES(
           '$movie->id',
           '$abriged_cast',
           '$links',
           '$movie->mpaa_rating',
           '$posters',
           '$ratings',
           '$release_dates',
           '$movie->runtime',
           '$movie->title',
           '$movie->year',
           '$imdb',
           '$genres',
           '$movie->synopsis',
           '$movie->critics_consensus')";
  $result = sqlsrv_query($conn,$query );
/*  if( $result === false ) {
    die( print_r( sqlsrv_errors(), true));
  }
  exit();*/
}

function db_select_movie_by_id($id) {
  $output = false;
  $conn = db_lets_connect();
  $result = sqlsrv_query($conn, "SELECT * FROM movies.dbo.movies where movie_id = $id");
  if ($result) {
    $output = sqlsrv_fetch_array($result);
  }
  return $output;

}