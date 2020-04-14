<?php

  class User{
    public $name;
    public $login;
    public $password;

    function __construct($name,$login,$password){  // �����������
      $this->name=$name;
      $this->login=$login;
      $this->password=$password;
      echo "sozdan klass'".__CLASS__."'.
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

  $user01 = new User("Di","di","di");
  $user02 = new User("di2","di2", "di2");
  $user03 = new User("di3","di3","di3");

  $user04 = clone $user01;  // ������������ User

  unset($user01,$user02,$user03,$user04);  //����� ����������� � ������� �������� ��������
  


?>
