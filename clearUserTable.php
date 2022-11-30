<?php

	require 'db_conn.php';

	$sql = "DELETE FROM user_table WHERE show_id > 0";
	if (isset($_POST['clearTable']))
	{
		if (mysqli_query($conn, $sql))
		{
			echo "Records were deleted successfully";
		}
		else
		{
			echo "ERROR";
		}
	}
	header("Location: home.php");
	mysqli_close($conn);
?>
