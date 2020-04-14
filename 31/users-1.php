<?php
class User{
      public $name;
      public $login;
      public $password;

      function showInfo(){
        echo "name: '{$this->name}'; login: '{$this->login}'; password: '{$this->password}';<br>\n";
      }

    }

    $user01 = new User;
    $user01 -> name = "Di";
    $user01 -> login = "di";
    $user01 -> password =  "di" ;

    $user02 = new User;
    $user02 -> name = "di2";
    $user02 -> login = "di2";
    $user02 -> password = "di2";

    $user03 = new User;
    $user03 -> name = "di3";
    $user03 -> login = "di3";
    $user03 -> password = "di3";

    $content.=$user01 -> showInfo();
    $content.=$user02 -> showInfo();
    $content.=$user03 -> showInfo();

?>
