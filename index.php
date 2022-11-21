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
