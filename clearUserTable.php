<?php

	require 'db_conn.php';

	$sql = "DELETE FROM user_table WHERE show_id > 0";	//Initializing sql code to run
	
	if (isset($_POST['clearTable']))			//checkign to see if the clear button is ever press
	{
		if (mysqli_query($conn, $sql))			//running the sql code and will output if it succeeds or not
		{
			echo "Records were deleted successfully";
		}
		else
		{
			echo "ERROR";
		}
	}
	header("Location: home.php");				//returns back to home screen
	mysqli_close($conn);
?>
