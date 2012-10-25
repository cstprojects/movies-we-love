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

/*   print_r($movie);
   exit();*/

//retrieving abridged cast if it exists

  if (property_exists($movie, "abridged_cast")) {
   $abriged_cast = json_encode($movie->abridged_cast);
  } else {
    $abriged_cast = '';
  }

//retrieving links if it exists
  if (property_exists($movie, "links")) {
    $links = json_encode($movie->links);
  } else {
    $links = '';
  }

//retrieving mpaa_rating if it exists
  if (property_exists($movie, "mpaa_rating")) {
    $mpaa_rating = escapeMssql($movie->mpaa_rating);
  } else {
    $mpaa_rating = '';
  }

//retrieving posters if it exists
  if (property_exists($movie, "posters")) {
    $posters = json_encode($movie->posters);
  } else {
    $posters = '';
  }

//retrieving ratings if it exists
  if (property_exists($movie, "ratings")) {
    $ratings = json_encode($movie->ratings);
  } else {
    $ratings = '';
  }

//retrieving release_dates if it exists
  if (property_exists($movie, "release_dates")) {
    $release_dates = json_encode($movie->release_dates);
  } else {
    $release_dates = '';
  }

//retrieving runtime if it exists
  if (property_exists($movie, "runtime")) {
    $runtime = $movie->runtime;
  } else {
    $runtime = '';
  }

//retrieving title if it exists
  if (property_exists($movie, "title")) {
    $title = escapeMssql($movie->title);
  } else {
    $title = '';
  }

//retrieving year if it exists
  if (property_exists($movie, "year")) {
    $year = $movie->year;
  } else {
    $year = '';
  }

//retrieving genres if it exists
  if (property_exists($movie, "genres")) {
    $genres = json_encode($movie->genres);
  } else {
    $genres = '';
  }

//retrieving synopsis if it exists
  if (property_exists($movie, "synopsis")) {
    $synopsis = escapeMssql($movie->synopsis);
  } else {
    $synopsis = '';
  }


//retrieving alternate_ids if it exists
  if (property_exists($movie, "alternate_ids")) {
    $imdb = $movie->alternate_ids->imdb;
  } else {
    $imdb = '';
  }

//retrieving critics_consensus if it exists
  if (property_exists($movie, "critics_consensus")) {
    $critics_consensus = escapeMssql($movie->critics_consensus);
  } else {
    $critics_consensus = '';
  }
  $conn = db_lets_connect();
  $query = "INSERT INTO movies
           VALUES(
           '$movie->id',
           '$abriged_cast',
           '$links',
           '$mpaa_rating',
           '$posters',
           '$ratings',
           '$release_dates',
           '$runtime',
           '$title',
           '$year',
           '$imdb',
           '$genres',
           '$synopsis',
           '$critics_consensus')";
  $result = sqlsrv_query($conn, $query);
  if ($result === false) {
    die(print_r(sqlsrv_errors(), true));
  }
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