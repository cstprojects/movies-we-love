<?php
include("/../data/movies.php");
include("/../lib/movies-lib.php");
include("/../data/apiclient.php");

$app->get('/movies', function () {
  $movies = getmovies();

  print  embed("/../public_html/templates/movies.tpl.php", array('vars' => $movies));
});


/*
 * implements get search end point router
 */
$app->get('/search', function () {

});


/*
 * implements get single movie page router
 */
$app->get('/movies/:id', function ($id) {
  $movie = get_movie_by_id($id);
  print  embed("/../public_html/templates/movie.tpl.php", array('movie' => $movie));
});

$app->get('/movies/search/:qparam', function($qparam){

/*  $result = db_search_movies($qparam);*/
  $result = apiclient_search_movies($qparam);
  print embed("/../public_html/templates/search-results.tpl.php", array('results' => json_decode($result)));

});


$app->get('/', function(){

  print  embed("/../public_html/templates/main.tpl.php", array('vaime' => 'hey'));

});