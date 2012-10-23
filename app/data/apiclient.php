<?php
/* @file apiclient.php
 * Implements RottenTomatoes API CLIENT functions
 */

const api_url = 'http://api.rottentomatoes.com/api/public/v1.0/';
const api_key = '8wu69vmaagyc2cge2a74m9tt'; // Rotten Tomatoes API key for auth.
const path_to_templates = 'templates/';
const main_path = '/movies-we-love/public_html/';


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

function generate_rapi_endpoint($api_url, $api_key, $addition = "", $qparams = ""){
  $qparams['apikey'] = $api_key;
  $endpoint = $api_url . $addition . '?' . http_build_query($qparams);
  return $endpoint;
}



function get_movie_by_id($id){
  $endpoint = generate_rapi_endpoint(api_url, api_key,"movies/" .$id);
  $result = json_decode(file_get_contents($endpoint));

  return $result;

}




