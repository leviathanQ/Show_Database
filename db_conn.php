<?php

//variable of server and database
$servername = "ecs-pd-proj-db.ecs.csus.edu";
$username = "CSC174023";
$password = "Csc134_614284180";
$database_name = "CSC174023";      //The name of the database
//=============================================

$conn = mysqli_connect($servername, $username, $password, $database_name);

//now check the connection
if (!$conn)     //if the connection with the server fail
{
    die("Connection Failed:" . mysqli_connect_error());
}
?>
