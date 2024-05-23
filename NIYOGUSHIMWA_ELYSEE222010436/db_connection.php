<?php
// Connection details
$host = "localhost";
$user = "NIYOGUSHIMWA";
$pass = "ELYSEE$07.";
$database = "plantbasedmealdeliveryservice";

// Creating connection
$connection = new mysqli($host, $user, $pass, $database);

// Check connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}
?>