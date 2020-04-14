<?php
class User extends  UserAbstract{
    public $name;
    public $login;
    public $password;
	static public $countUser=0;

     function __construct($name,$login,$password){  // Конструктор
      $this->name=$name;
      $this->login=$login;
      $this->password=$password;
	  ++self::$countUser;

      echo "sozdan obiekt" .self::$countUser. " klassa '".__CLASS__."'.
      name: '{$this->name}';
      login: '{$this->login}';
      password: '{$this->password}';
      <br>\n";
    }

    function __clone(){  // Клон
      echo "klon klassa '".__CLASS__."'.
      name: '{$this->name}';
      login: '{$this->login}';
      password: '{$this->password}';
      <br>\n";
    }

   function __destruct(){  // Деструктор
      echo "ydalen klass '".__CLASS__."'. name: {$this->name};<br>\n";
    }

    function showInfo(){
      echo "obiekt klassa '".__CLASS__."'.
      name: '{$this->name}';
      login: '{$this->login}';
      password: '{$this->password}';
      <br>\n";
    }

  }


