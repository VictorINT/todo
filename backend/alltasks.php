<?php

$conn;

function connect()
{
    global $conn;
    $servername = "127.0.0.1";
    $username = "username";
    $password = "password";
    $conn = mysqli_connect($servername, $username, $password, "todo"); // todo -> db name
    if ($conn->connect_error) {
         die("Connection failed: " . $conn->connect_error);
    }
}

function all()
{
    global $conn;
    $sql = "SELECT ID, Title, Description, Completed FROM todo.tasks";
    $result = $conn->query($sql);
    
    //create an array
    $emparray = array();

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            //echo json_encode($row);
            $emparray[] = $row;
        }
        echo json_encode($emparray);
    } else {
        echo "0 results";
    }
}

connect();

all();

$conn->close();
?>
