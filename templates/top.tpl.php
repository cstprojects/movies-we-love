<!DOCTYPE html>
<html xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
    <title></title>
    <link rel="stylesheet" href="<?php print REL_PATH_TO_TEMPLATES; ?>/css/bootstrap.css">
    <link rel="stylesheet" href="<?php print REL_PATH_TO_TEMPLATES; ?>/css/style.css">
</head>
<body>

<?php /*print_r($fb); exit();*/?>

<?php if (array_key_exists('user_profile', $fb)) { ?>
Your user profile is: <?php print  $fb['user_profile']['name']; ?>
  <?php } else { ?>
<fb:login-button></fb:login-button>
  <?php } ?>
<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId:'<?php echo $fb['fb_app_id'] ?>',
            cookie:true,
            xfbml:true,
            oauth:true
        });
        FB.Event.subscribe('auth.login', function (response) {
            window.location.reload();
        });
        FB.Event.subscribe('auth.logout', function (response) {
            window.location.reload();
        });
    };
    (function () {
        var e = document.createElement('script');
        e.async = true;
        e.src = document.location.protocol +
                '//connect.facebook.net/en_US/all.js';
        document.getElementById('fb-root').appendChild(e);
    }());
</script>

<div class="wrapp row">
    <div class="span8">
        <form class="form-search">
            <input type="text" placeholder="Search movies by typing title..." data-provide="typeahead"
                   class="input-xxlarge  typeahead" id="search">
        </form>
        <div id="suggestions"></div>
    </div>
</div>
