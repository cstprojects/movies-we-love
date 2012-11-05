<?php


function db_insert_movie($movie) {


//retrieving abridged cast if it exists

  if (property_exists($movie, "abridged_cast")) {
    $abriged_cast = mysql_real_escape_string(json_encode($movie->abridged_cast));
  } else {
    $abriged_cast = '';
  }


//retrieving mpaa_rating if it exists
  if (property_exists($movie, "mpaa_rating")) {
    $mpaa_rating = mysql_real_escape_string($movie->mpaa_rating);
  } else {
    $mpaa_rating = '';
  }

//retrieving posters if it exists
  if (property_exists($movie, "posters")) {
    $posters = mysql_real_escape_string(json_encode($movie->posters));
  } else {
    $posters = '';
  }


//retrieving ratings if it exists
  if (property_exists($movie, "ratings")) {
    $ratings = mysql_real_escape_string(json_encode($movie->ratings));
  } else {
    $ratings = '';
  }

//retrieving release_dates if it exists
  if (property_exists($movie, "release_dates")) {
    $release_dates = mysql_real_escape_string(json_encode($movie->release_dates));
  } else {
    $release_dates = '';
  }

//retrieving runtime if it exists
  if (property_exists($movie, "runtime")) {
    $runtime = mysql_real_escape_string($movie->runtime);
  } else {
    $runtime = '';
  }

//retrieving title if it exists
  if (property_exists($movie, "title")) {
    $title = mysql_real_escape_string($movie->title);
  } else {
    $title = '';
  }

//retrieving year if it exists
  if (property_exists($movie, "year")) {
    $year = mysql_real_escape_string($movie->year);
  } else {
    $year = '';
  }

//retrieving genres if it exists
  if (property_exists($movie, "genres")) {
    $genres = mysql_real_escape_string(json_encode($movie->genres));
  } else {
    $genres = '';
  }


//retrieving synopsis if it exists
  if (property_exists($movie, "synopsis")) {
    $synopsis = mysql_real_escape_string($movie->synopsis);
  } else {
    $synopsis = '';
  }


//retrieving alternate_ids if it exists
  if (property_exists($movie, "alternate_ids")) {
    $imdb = mysql_real_escape_string($movie->alternate_ids->imdb);
  } else {
    $imdb = '';
  }

  /*  print_r($movie);
    exit();*/

//retrieving critics_consensus if it exists
  if (property_exists($movie, "critics_consensus")) {
    $critics_consensus = mysql_real_escape_string($movie->critics_consensus);
  } else {
    $critics_consensus = '';
  }
  $conn = mysql_db_lets_connect();

  //inserting movie
  $query = "INSERT INTO movies (
            movie_id,
            abridged_cast,
            links,
            mpaa_rating,
            posters,
            ratings,
            release_dates,
            runtime,
            title,
            year,
            imdb_id,
            genres,
            synopsis,
            critics_consensus)
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
  $result = mysql_query($query);
  if ($result === false) {
    die(print_r(mysql_error() . " From movies insert", true));
  }


  $query = "SELECT @@identity";
  $result = mysql_query($query);
  if ($result === false) {
    die(print_r(mysql_error(), true));
  }
  $result = mysql_fetch_array($result);
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
    $self = mysql_real_escape_string($movie->links->self);
  }
  if (property_exists($movie->links, 'alternate')) {
    $alternate = mysql_real_escape_string($movie->links->alternate);
  }
  if (property_exists($movie->links, 'similar')) {
    $similar = mysql_real_escape_string($movie->links->similar);
  }
  if (property_exists($movie->links, 'cast')) {
    $cast = mysql_real_escape_string($movie->links->cast);
  }
  if (property_exists($movie->links, 'clips')) {
    $clips = mysql_real_escape_string($movie->links->clips);
  }
  if (property_exists($movie->links, 'reviews')) {
    $reviews = mysql_real_escape_string($movie->links->reviews);
  }

  $query = "INSERT INTO links
    (movies_id,
    self,
    alternate,
    similar,
    cast,
    clips,
    reviews
     )
   VALUES(
  '$movie_last_id',
  '$self',
  '$alternate',
  '$similar',
  '$cast',
  '$clips',
  '$reviews')";

  $result = mysql_query($query);
  if ($result === false) {
    die(print_r(mysql_error() . " links movies insert", true));
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
    $detailed = mysql_real_escape_string($movie->posters->detailed);
  }
  if (property_exists($movie->posters, 'original')) {
    $original = mysql_real_escape_string($movie->posters->original);
  }
  if (property_exists($movie->posters, 'profile')) {
    $profile = mysql_real_escape_string($movie->posters->profile);
  }
  if (property_exists($movie->posters, 'thumbnail')) {
    $thumbnail = mysql_real_escape_string($movie->posters->thumbnail);
  }


  $query = "INSERT INTO posters
    (movies_id,
    detailed,
    original,
    profile,
    thumbnail
     )
   VALUES(
  '$movie_last_id',
  '$detailed',
  '$original',
  '$profile',
  '$thumbnail')";

  $result = mysql_query($query);
  if ($result === false) {
    die(print_r(mysql_error() . " posters insert", true));
  }

  /*
 * end posters INSERT
 */
  /* begin transaction*/
  begin();
  //insert genres
  if (property_exists($movie, "genres")) {
    foreach ($movie->genres as $genre) {
      $genre = mysql_real_escape_string($genre);
      $query = "SELECT genre_name FROM genres
            WHERE genre_name = '$genre'";
      $result = mysql_query($query);
      $result = mysql_fetch_array($result);
      if (!$result) {
        $query = "INSERT INTO genres (genre_name)
           VALUES(
           '$genre')";
        $result = mysql_query($query);
        if ($result === false) {
          die(print_r(mysql_error() . " genres insert", true));
        }
      }
      $query = "INSERT INTO bridge_movies_genres (movies_id, genres_id)
           VALUES(
           '$movie_last_id',
           (SELECT id FROM genres WHERE genre_name = '$genre') )";
      $result = mysql_query($query);
      if ($result === false) {
        die(print_r(mysql_error . " bridge_movies_genres insert", true));
      }
    }
  }


  //insert directors
  if (property_exists($movie, "abridged_directors")) {
    foreach ($movie->abridged_directors as $director) {
      $director_name = mysql_real_escape_string($director->name);
      $query = "SELECT full_name FROM directors
            WHERE full_name = '$director_name'";
      $result = mysql_query($query);
      $result = mysql_fetch_array($result);

      if (!$result) {
        $query = "INSERT INTO directors (full_name)
           VALUES(
           '$director_name')";
        $result = mysql_query($query);
        if ($result === false) {
          die(print_r(mysql_error() . "directors insert", true));
        }
      }

      $query = "INSERT INTO bridge_movies_directors (movies_id, directors_id)
           VALUES(
           '$movie_last_id',
           (SELECT id FROM directors WHERE full_name = '$director_name') )";
      $result = mysql_query($query);
      if ($result === false) {
        die(print_r(mysql_error() . "bridge_movies_directors insert", true));
      }

    }
  }


  //insert stars
  if (property_exists($movie, "abridged_cast")) {
    foreach ($movie->abridged_cast as $star) {
      $star_name = mysql_real_escape_string($star->name);
      $query = "SELECT star_id FROM stars
            WHERE star_id = '$star->id'";
      $result = mysql_query($query);
      $result = mysql_fetch_array($result);
      if (!$result) {
        $query = "INSERT INTO stars (full_name, star_id) VALUES('$star_name','$star->id')";
        $result = mysql_query($query);
        if ($result === false) {
          die(print_r(mysql_error() . "stars insert", true));
        }
      }

      $query = "INSERT INTO bridge_movies_stars (movies_id, stars_id)
           VALUES(
           '$movie_last_id',
           (SELECT id FROM stars WHERE full_name = '$star_name') )";
      $result = mysql_query($query);
      if ($result === false) {
        die(print_r(mysql_error() . "bridge_movies_stars insert", true));
      }
    }
  }

  if ($query) {
    commit();
  } else {
    rollback(); //if something wrong rollback!
    print_r(mysql_error(), true);
  }

  mysql_close(); //close connection to database

}

function db_select_movie_by_id($id) {
  $output = false;
  mysql_db_lets_connect();
  $result_movie = mysql_query("SELECT * FROM movies where movie_id = $id");

  if (mysql_num_rows($result_movie) != 0) {
    $output['movie'] = mysql_fetch_array($result_movie);
    $movie_id = $output['movie']['id'];
    if ($posters = get_posters($movie_id)) {
      $output['posters'] = $posters;
    }
  }
  mysql_close();
  return $output;

}

function get_posters($movies_id) {
  $result_posters = mysql_query("SELECT * FROM posters WHERE movies_id = $movies_id");
  if (mysql_num_rows($result_posters) != 0) {
    return mysql_fetch_array($result_posters);
  }
  return false;
}
