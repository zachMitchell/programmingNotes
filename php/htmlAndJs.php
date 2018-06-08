<?php
#you can use session variables to save data from a user!!!
session_start();

#The session array carries all your precious data passing between pages
$_SESSION["thingy"] = "precious data";

#removing variables:
session_unset();

#aaaand removing the session:
session_destroy();
?>

<?php
//Grabbing variables from the address bar:
$whatever = $_GET['varName'];

//inserting php code from an external source:

include "src.php"; //if the server can't find it, than it will be ignored.

require 'src.php'; //the server will fail if you can't find this.
?>