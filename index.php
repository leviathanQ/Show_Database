<?php
session_start();
require "db_conn.php"; // Making sure this file has the connection to our database
?>
<!DOCTYPE html>
<html>

    <head>
        <title>Show selector</title>
    </head>

    <body>
        <form method="get">
            <label id="userInput" name="userInput">Input show name from table: </label>
            <input id="userTextbox" value="Type in a show name" type="text" onfocus="clearText();">
            <button id="submit" onclick="printUserText();">Submit</button>
            <p id="userShowName"></p>
        </form>
        <table>
            <tr>
                <th>Show_Table</th>
            </tr>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Anime Season</th>
                <th>Anime Year</th>
                <th>Cartoon Network</th>
                <th>Cartoon Release</th>
            </tr>
            <tr id="demo">
            <?php
                $search_result = mysqli_query($conn,"SELECT * FROM show_table");
                while($data = mysqli_fetch_array($search_result)) 
                { ?>
                    <tr>
                        <td><?php echo $data['show_id']; ?></td>
                        <td><?php echo $data['name']; ?></td>
                        <td><?php echo $data['show_Type']; ?></td>
                        <td><?php echo $data['anime_Season']; ?></td>
                        <td><?php echo $data['anime_Year']; ?></td>
                        <td><?php echo $data['cartoon_Network']; ?></td>
                        <td><?php echo $data['cartoon_Release']; ?></td>
                    </tr>
                <?php } ?>
            </tr>
        </table>
    </body>
</html>

<script>
    function printUserText()
    {
        document.getElementById('userShowName').innerHTML = document.getElementById('userTextbox').value;
    }
    function clearText()
    {
        document.getElementById('userTextbox').value = "";
    }
</script>