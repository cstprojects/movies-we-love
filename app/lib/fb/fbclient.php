<?php

require 'src/facebook.php';

function fbclient() {

  $facebook = new Facebook(array(
    'appId' => '458440324202105',
    'secret' => '0879ede91636082c3799a954e02196f3',
  ));

// See if there is a user from a cookie
  $user = $facebook->getUser();
  $output['fb_app_id'] = $facebook->getAppID();

  if ($user) {

    try {
      // Proceed knowing you have a logged in user who's authenticated.
      $user_profile = $facebook->api('/me');
      $output['user_profile'] = $user_profile;

    } catch (FacebookApiException $e) {
      echo "Authentication failed";
      $user = null;
    }
  }

  return $output;

}


?>