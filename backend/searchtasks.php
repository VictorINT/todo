<?php
        $conn;
            
        $id = "";
        $title = "";

        if (isset($_GET['id'])) {
            $id = $_GET["id"];
        }
        if (isset($_GET['title'])) { 
            $title = $_GET["title"];
        }
        function connect()
        {
            global $conn;
            $servername = "127.0.0.1";
            $username = "username";
            $password = "password";
            $conn = mysqli_connect($servername, $username, $password, "todo");
            if ($conn->connect_error) {
                 die("Connection failed: " . $conn->connect_error);
            }
        }
        
        function by()
        {
            global $conn;
            global $id;
            global $title;
            /*
            if($id === "")
            {
                $sql = "SELECT ID, Title, Description, completed FROM todo.tasks WHERE Title LIKE \"%" . $title . "%\"";
             //   echo "SELECT ID, date, title, story FROM agenda.entries WHERE title LIKE \"%" . $title . "%\"";
            }
            else 
            if($title === "")
            {
                $sql = "SELECT ID, date, title, story FROM agenda.entries WHERE id LIKE " . $id;
             //   echo "caz 1 SELECT ID, date, title, story FROM agenda.entries WHERE id LIKE " . $id;
            }
            else if ($id === "")
	        {
               $sql = "SELECT ID, date, title, story FROM agenda.entries";
            }
	        else
            {
                $sql = "SELECT ID, date, title, story FROM agenda.entries WHERE title LIKE \"%" . $title . "%\" AND id LIKE " . $id;
            //    echo "caz 2 SELECT ID, date, title, story FROM agenda.entries WHERE title LIKE \"%" . $title . "%\" AND id LIKE " . $id;
            }
            */
            $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo json_encode($row);
                  //  echo "<br>";
                }
            } else {
                echo "0 results";
            }
        }
        
        connect();
        
        by();
        
        $conn->close();
    ?>
