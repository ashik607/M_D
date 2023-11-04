<?php
$base = mysqli_connect('localhost', 'root', '', 'insert');
if(isset($_POST['submit'])){ 
    $name = mysqli_real_escape_string($base, $_POST['name']);
    $email = mysqli_real_escape_string($base, $_POST['email']);
    $password = mysqli_real_escape_string($base, $_POST['password']);
    
    // Hash the password for security
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    
    $sql = "INSERT INTO insertform (name, email, password) VALUES ('$name', '$email', '$hashed_password')"; 
    if(mysqli_query($base, $sql)){ 
        echo "Inserted successfully";
    }
    else{
        echo "Insertion failed: " . mysqli_error($base); // Log the error message for debugging
    }
}

mysqli_close($base); // Close the connection after use
?>

<!-- 
CREATE TABLE insertform (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
); -->
