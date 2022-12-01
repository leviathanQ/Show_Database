<?php

	require 'db_conn.php';
		
	$stmt = mysqli_stmt_init($conn);

	//Creating a prepared statement for when user want to insert into user's table.
	mysqli_stmt_prepare($stmt,  "INSERT INTO user_input SELECT show_id FROM show_table WHERE name = (?)");

	//Making sure that $show_name is binded or categories as a string variable for the prepared statement
	mysqli_stmt_bind_param($stmt, "s", $show_Name);

	//Getting user's input from an input named 'userInput'
	$show_Name = $_REQUEST['userInput'];

	//echo gettype($show_Name);
	
	//Executing the prepared statement with user's input
	mysqli_stmt_execute($stmt);

	//echo "<p>RECORD INSERTED SUCCESSFULLY</p>";
	
	header("Location: home.php");	//Returning back to home screen

	mysqli_stmt_close($stmt);	//closing off the prepared statement

	mysqli_close($conn);
?>
