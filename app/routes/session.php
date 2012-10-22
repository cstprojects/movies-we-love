<?php
include("/../data/movies.php");
include("/../lib/embed.php");

$app->get('/movies', function () {
  $movies = getmovies();

  print  embed("/../public_html/templates/movies.tpl.php", array('vars' => $movies));
});