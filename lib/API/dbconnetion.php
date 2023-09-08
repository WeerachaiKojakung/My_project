<?php


function dbconnection()
{
   $con=mysql_connect("localhost", "root", "practice");
   return $con;
}

?>