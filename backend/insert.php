<?php 
        $username="username";
        $password="password";
        $host="localhost";
        $db_name="todo";

        $connect=mysqli_connect($host,$username,$password,$db_name);

        if(!$connect)
        {
            echo json_encode("Connection Failed");
        }

	    $title = $_POST["title"];
        $desc = $_POST["description"];

        $sql = "INSERT INTO tasks VALUES (default, \"" . $title . "\", \"" . $desc . "\", false)";
        echo "INSERT INTO tasks VALUES (default, \"" . $title . "\", \"" . $desc . "\", false)";

        $result = $conn->query($sql);

	    if($results>0)
	    {
	        echo "user added successfully";
	    }
	    
?>
