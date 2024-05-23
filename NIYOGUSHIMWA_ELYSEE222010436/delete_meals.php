<?php
include('db_connection.php');

// Check if MealID is set
if(isset($_REQUEST['MealID'])) {
    $MealID = $_REQUEST['MealID'];
    
    // Prepare and execute the DELETE statement
    $stmt = $connection->prepare("DELETE FROM meals WHERE MealID=?");
    $stmt->bind_param("i", $MealID);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Record</title>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this record?");
        }
    </script>
</head>
<body>
    <form method="post" onsubmit="return confirmDelete();">
        <input type="hidden" name="MealID" value="<?php echo $MealID; ?>">
        <input type="submit" value="Delete">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if ($stmt->execute()) {
            echo "Record deleted successfully.";
        } else {
            echo "Error deleting data: " . $stmt->error;
        }
    }
    ?>
</body>
</html>
<?php

    $stmt->close();
} else {
    echo "Meal ID is not set.";
}

$connection->close();
?>
