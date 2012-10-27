<?php
/* @file apiclient.php
 * Implements RottenTomatoes API CLIENT functions
 */


include("db-interactions.php");


/*
 * Implements search_movies() function
 * params:
 *       $api_url -  RottenTomatoes API URL
 *       $api_key -  RottenTomatoes API key for auth
 *       $qparams -  Search Parameters key => value array
 *       $addition - api endpoint url addition in case it exists
 *
 * returns search results
 */

function generate_rapi_endpoint($api_url, $api_key, $addition = "", $qparams = "") {
  $qparams['apikey'] = $api_key;
  $endpoint = $api_url . $addition . '?' . http_build_query($qparams);
  return $endpoint;
}


function get_movie_by_id($id) {
  $movie = db_select_movie_by_id($id);
  if ($movie) {
    return $movie;
  } else {
    $endpoint = generate_rapi_endpoint(api_url, api_key, "movies/" . $id);
    $rapi_result = file_get_contents($endpoint);
    if ($rapi_result) {


      $movie = json_decode($rapi_result);
      db_insert_movie($movie);
      $movie = db_select_movie_by_id($id);
      return $movie;
    } else {
      return false;
    }
  }


}




