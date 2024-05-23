<?php
include('db_connection.php');

// Check if MealID is set
if(isset($_REQUEST['MealID'])) {
    $MealID = $_REQUEST['MealID'];
    
    $stmt = $connection->prepare("SELECT * FROM meals WHERE MealID=?");
    $stmt->bind_param("i", $MealID);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $MealName = $row['MealName'];
        $Description = $row['Description'];
        $Price = $row['Price'];
        $Category = $row['Category'];
    } else {
        echo "Meal not found.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Update Record in Meals Table</title>
    <!-- JavaScript validation and content load for update or modify data-->
    <script>
        function confirmUpdate() {
            return confirm('Are you sure you want to update this record?');
        }
    </script>
</head>
<body><center>
    <!-- Update meals form -->
    <h2><u>Update Form for Meals</u></h2>
    <form method="POST" onsubmit="return confirmUpdate();">
        <label for="MealName">Meal Name:</label>
        <input type="text" name="MealName" value="<?php echo isset($MealName) ? $MealName : ''; ?>">
        <br><br>
        <label for="Description">Description:</label>
        <textarea name="Description"><?php echo isset($Description) ? $Description : ''; ?></textarea>
        <br><br>
        <label for="Price">Price:</label>
        <input type="number" step="0.01" name="Price" value="<?php echo isset($Price) ? $Price : ''; ?>">
        <br><br>
        <label for="Category">Category:</label>
        <input type="text" name="Category" value="<?php echo isset($Category) ? $Category : ''; ?>">
        <br><br>
        <input type="submit" name="up" value="Update">
    </form>
</body>
</html>

<?php
if(isset($_POST['up'])) {
    // Retrieve updated values from form
    $MealName = $_POST['MealName'];
    $Description = $_POST['Description'];
    $Price = $_POST['Price'];
    $Category = $_POST['Category'];
    
    // Update the meal in the database
    $stmt = $connection->prepare("UPDATE meals SET MealName=?, Description=?, Price=?, Category=? WHERE MealID=?");
    $stmt->bind_param("ssdsi", $MealName, $Description, $Price, $Category, $MealID);
    $stmt->execute();
    
    // Redirect to meals.php
    header('Location: meals.php');
    exit(); // Ensure that no other content is sent after the header redirection
}
?>
