
<?php




foreach ($results->movies as $result) {

  ?>
<img src="<?php print $result->posters->thumbnail; ?>">
<a href="movies/<?php print $result->id; ?>"><?php print $result->title; ?></a>
<br>
<?php } ?>