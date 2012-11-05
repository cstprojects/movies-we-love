<?php
foreach ($results->movies as $result) {

  ?>
<img src="<?php print $result->posters->thumbnail; ?>">
<a href="http://127.0.0.1:8080/movies-we-love/public_html/movies/<?php print $result->id; ?>"><?php print $result->title; ?></a>
<br>
<?php } ?>