<?php 

session_start();
ob_start();

$conn = mysqli_connect(
    getenv('MYSQL_HOST') ?: 'localhost',
    getenv('MYSQL_USER') ?: 'root',
    getenv('MYSQL_PASSWORD') ?: '',
    getenv('MYSQL_DATABASE') ?: 'pratik_ecommerce_project'
);



 ?>