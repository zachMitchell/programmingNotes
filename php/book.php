<?php
//creating objects:
class leClass{
  private $privateVal;
  public $publicVal;
  
  public function __construct($prival,$pubval){
  $privateVal = $prival;
  $publicVal = $pubVal;
  }
  
  public function theAwesomeFunction(){
  echo $this->$privateVal;
  }
}
?>