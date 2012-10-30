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


//retrieving abridged cast if it exists

  if (property_exists($movie, "abridged_cast")) {
    $abriged_cast = escapeMssql(json_encode($movie->abridged_cast));
  } else {
    $abriged_cast = '';
  }


//retrieving mpaa_rating if it exists
  if (property_exists($movie, "mpaa_rating")) {
    $mpaa_rating = escapeMssql($movie->mpaa_rating);
  } else {
    $mpaa_rating = '';
  }

//retrieving posters if it exists
  if (property_exists($movie, "posters")) {
    $posters = escapeMssql(json_encode($movie->posters));
  } else {
    $posters = '';
  }


//retrieving ratings if it exists
  if (property_exists($movie, "ratings")) {
    $ratings = escapeMssql(json_encode($movie->ratings));
  } else {
    $ratings = '';
  }

//retrieving release_dates if it exists
  if (property_exists($movie, "release_dates")) {
    $release_dates = escapeMssql(json_encode($movie->release_dates));
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
    $genres = escapeMssql(json_encode($movie->genres));
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

  /*  print_r($movie);
    exit();*/

//retrieving critics_consensus if it exists
  if (property_exists($movie, "critics_consensus")) {
    $critics_consensus = escapeMssql($movie->critics_consensus);
  } else {
    $critics_consensus = '';
  }
  $conn = db_lets_connect();

  /* Begin the transaction. */
  if (sqlsrv_begin_transaction($conn) === false) {
    die(print_r(sqlsrv_errors(), true));
  }

  //inserting movie
  $query = "INSERT INTO movies
           VALUES(
           '$movie->id',
           '$abriged_cast',
           'link',
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


  $query = "SELECT @@identity";
  $result = sqlsrv_query($conn, $query);
  if ($result === false) {
    die(print_r(sqlsrv_errors(), true));
  }
  $result = sqlsrv_fetch_array($result);
  $movie_last_id = $result[0];


  /*
   * start links insert
   */
  $self = '';
  $alternate = '';
  $similar = '';
  $cast = '';
  $clips = '';
  $reviews = '';

  if (property_exists($movie->links, 'self')) {
    $self = $movie->links->self;
  }
  if (property_exists($movie->links, 'alternate')) {
    $alternate = $movie->links->alternate;
  }
  if (property_exists($movie->links, 'similar')) {
    $similar = $movie->links->similar;
  }
  if (property_exists($movie->links, 'cast')) {
    $cast = $movie->links->cast;
  }
  if (property_exists($movie->links, 'clips')) {
    $clips = $movie->links->clips;
  }
  if (property_exists($movie->links, 'reviews')) {
    $reviews = $movie->links->reviews;
  }

  $query = "INSERT INTO links
   VALUES(
  '$movie_last_id',
  '$self',
  '$alternate',
  '$similar',
  '$cast',
  '$clips',
  '$reviews')";

  $result = sqlsrv_query($conn, $query);
  if ($result === false) {
    die(print_r(sqlsrv_errors(), true));
  }

  /*
   * end links insert
   */


  /*
   * start posters INSERT
   */

  $detailed = '';
  $original = '';
  $profile = '';
  $thumbnail = '';

  if (property_exists($movie->posters, 'detailed')) {
    $detailed = $movie->posters->detailed;
  }
  if (property_exists($movie->posters, 'original')) {
    $original = $movie->posters->original;
  }
  if (property_exists($movie->posters, 'profile')) {
    $profile = $movie->posters->profile;
  }
  if (property_exists($movie->posters, 'thumbnail')) {
    $thumbnail = $movie->posters->thumbnail;
  }


  $query = "INSERT INTO posters
   VALUES(
  '$movie_last_id',
  '$detailed',
  '$original',
  '$profile',
  '$thumbnail')";

  $result = sqlsrv_query($conn, $query);
  if ($result === false) {
    die(print_r(sqlsrv_errors(), true));
  }

  /*
 * end posters INSERT
 */


  //insert genres
  if (property_exists($movie, "genres")) {
    foreach ($movie->genres as $genre) {
      $query = "SELECT genre_name FROM genres
            WHERE genre_name = '$genre'";
      $result = sqlsrv_query($conn, $query);
      $result = sqlsrv_fetch_array($result);
      if (!$result) {
        $query = "INSERT INTO genres
           VALUES(
           '$genre')";
        $result = sqlsrv_query($conn, $query);
        if ($result === false) {
          die(print_r(sqlsrv_errors(), true));
        }
      }
      $query = "INSERT INTO bridge_movies_genres
           VALUES(
           '$movie_last_id',
           (SELECT id FROM genres WHERE genre_name = '$genre') )";
      $result = sqlsrv_query($conn, $query);
      if ($result === false) {
        die(print_r(sqlsrv_errors(), true));
      }
    }
  }


  //insert directors
  if (property_exists($movie, "abridged_directors")) {
    foreach ($movie->abridged_directors as $director) {
      $director_name = escapeMssql($director->name);
      $query = "SELECT full_name FROM directors
            WHERE full_name = '$director_name'";
      $result = sqlsrv_query($conn, $query);
      $result = sqlsrv_fetch_array($result);

      if (!$result) {
        $query = "INSERT INTO directors
           VALUES(
           '$director_name')";
        $result = sqlsrv_query($conn, $query);
        if ($result === false) {
          die(print_r(sqlsrv_errors(), true));
        }
      }

      $query = "INSERT INTO bridge_movies_directors
           VALUES(
           '$movie_last_id',
           (SELECT id FROM directors WHERE full_name = '$director_name') )";
      $result = sqlsrv_query($conn, $query);
      if ($result === false) {
        die(print_r(sqlsrv_errors(), true));
      }

    }
  }


  //insert stars
  if (property_exists($movie, "abridged_cast")) {
    foreach ($movie->abridged_cast as $star) {
      $star_name = escapeMssql($star->name);
      $query = "SELECT star_id FROM stars
            WHERE star_id = '$star->id'";
      $result = sqlsrv_query($conn, $query);
      $result = sqlsrv_fetch_array($result);
      if (!$result) {
        $query = "INSERT INTO stars VALUES('$star_name','$star->id')";
        $result = sqlsrv_query($conn, $query);
        if ($result === false) {
          die(print_r(sqlsrv_errors(), true));
        }
      }

      $query = "INSERT INTO bridge_movies_stars
           VALUES(
           '$movie_last_id',
           (SELECT id FROM stars WHERE full_name = '$star_name') )";
      $result = sqlsrv_query($conn, $query);
      if ($result === false) {
        die(print_r(sqlsrv_errors(), true));
      }
    }
  }

  if ($query) {
    sqlsrv_commit($conn);
  } else {
    sqlsrv_rollback($conn); //if something wrong rollback!
    print_r(sqlsrv_errors(), true);
  }

  sqlsrv_close($conn); //close connection to database

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

function db_search_movies($param = "") {
  $conn = db_lets_connect();
  $query = "SELECT * FROM movies where title LIKE '%" . $param . "%';";
  $result = sqlsrv_query($conn, $query);
  $output = array();
  while ($row = sqlsrv_fetch_array($result)) {
    $output[] = $row;
  }
  return json_encode($output);
}