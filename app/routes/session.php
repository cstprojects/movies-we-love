<?php


include(main_path . "/app/data/movies.php");
include(main_path . "/app/lib/movies-lib.php");
include(main_path . "/app/data/apiclient.php");

$app->get('/movies', function () {
  $movies = getmovies();
  print  embed("movies", array('vars' => $movies));

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
  print  embed("top", array('vars' => '1'));
  print  embed("movie", array('movie' => $movie));
});

$app->get('/movies/search/:qparam', function ($qparam) {

  /*  $result = db_search_movies($qparam);*/
  $result = apiclient_search_movies($qparam);
  print embed("search-results", array('results' => json_decode($result)));
});


$app->get('/', function () {

  print  embed("main", array('vaime' => 'hey'));


});