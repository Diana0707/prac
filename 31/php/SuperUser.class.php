<?php

class SuperUser extends User{
    public $role;
	static public $countSuperUser;

    function __construct($name,$login,$password,$role){
      parent::__construct($name,$login,$password);
      $this->role = $role;
	  ++self::$countSuperUser;

	  echo "sozdan obiekt klassa".self::$countSuperUser." klassa '".__CLASS__."'.
      role: '{$this->role}';
      <br>\n";
    }

    function showInfo(){
      echo "obiekt klassa '".__CLASS__."'.
      name: '{$this->name}';
      login: '{$this->login}';
      password: '{$this->password}';
      role: '{$this->role}';
      <br>\n";
    }
  }
