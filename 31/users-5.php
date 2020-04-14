<?php
 abstract class UserAbstract{
    abstract function showInfo();
  }





  class User extends  UserAbstract{
    public $name;
    public $login;
    public $password;
	static public $countUser=0;

     function __construct($name,$login,$password){  // �����������
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

    function __clone(){  // ����
      echo "klon klassa '".__CLASS__."'.
      name: '{$this->name}';
      login: '{$this->login}';
      password: '{$this->password}';
      <br>\n";
    }

   function __destruct(){  // ����������
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
