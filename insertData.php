<?php

	require 'db_conn.php';
	
	$show_id = $_REQUEST['userInput'];
		
	echo $show_id;

	$sql = "INSERT INTO user_input VALUES ($show_id)";
	
	if(mysqli_query($conn, $sql))
	{
		echo "<h3>data stored in a database successfully</h3>";
	}
	else
	{
		echo "\nERROR: VALUE NOT FOUND IN SHOW_TABLE" . mysqli_error($conn);
	}

	mysqli_close($conn);
?>
