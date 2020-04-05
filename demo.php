<?php
    $username = $_POST['username'];
    $password = $_POST['password'];
    $self =     $_SERVER['PHP_SELF'];
    $referer =  $_SERVER['HTTP_REFERER'];

    if( ( !$username ) or ( !$password ) )
    { header( "Location:$referer" ); exit(); }

    $conn=@mysql_connect( "localhost", "userName", "password" ) or die( "Could not connect" );

    $rs = @mysql_select_db( "my_database", $conn ) or die( "Could not select database" );
    $sql = "SELECT id FROM users WHERE username='" + $username + "' AND password='" + $password + "'";
    
    $rs = mysql_query( $sql, $conn ) or die( "Could not execute query" );

    $num = mysql_numrows( $rs );

    if( $num != 0 ){ 
        $msg = "<h3>Welcome $username - your log-in succeeded!</h3>";
    }else{
        header( "Location:$referer" ); exit(); 
    }
?>