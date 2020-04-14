<?php

  spl_autoload_register(function($class){
    include "/domains/localhost/php/$class.class.php";
  });


$user01 = new User("Di","di","di");
$user02 = new User("di2","di2", "di2");
$user03 = new User("di3","di3","di3");

echo "<br>\n";

$user04 = new SuperUser("DI","DI","DI","main");
  echo "<br>\n";

  $user04->showInfo();
  echo "<br>\n";

  echo "sozdan ".User::$countUser." obiekt klassa User_be<br>\n";
  echo "sozdan ".SuperUser::$countSuperUser." obiekt klassa SuperUser_be<br>\n";
  echo "<br>\n";

  unset($user01,$user02,$user03,$user04);

?>
