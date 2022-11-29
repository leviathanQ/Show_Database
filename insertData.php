<?php

	require 'db_conn.php';
		
	$stmt = mysqli_stmt_init($conn);
	mysqli_stmt_prepare($stmt,  "INSERT INTO user_input SELECT show_id FROM show_table WHERE name = (?)");

	mysqli_stmt_bind_param($stmt, "s", $show_Name);

	$show_Name = $_REQUEST['userInput'];

	echo gettype($show_Name);
	
	mysqli_stmt_execute($stmt);

	//echo "<p>RECORD INSERTED SUCCESSFULLY</p>";
	
	header("Location: home.php");	

	mysqli_stmt_close($stmt);

	mysqli_close($conn);
?>
