<?php
    $connect = mysqli_connect( "localhost", "root", "", "student" );
    $query   = "SELECT * FROM student_list ORDER BY ID ASC";
    $result  = mysqli_query( $connect, $query ); 

    
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Form</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
            width: 300px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Personal Details</h1>
        <form action="insert.php" method="POST">
            <label for="name">First Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter valid email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter 6 digit password" required>
            <input type="submit" name="submit" value="Submit">
        </form>
    </div>
</body>
</html>
