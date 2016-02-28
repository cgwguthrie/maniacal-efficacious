<?php
    // mysql database connection details
    $host = "localhost";
    $username = "root";
    $password = "bairns1";
    $dbname = "emage";

    // open connection to mysql database
    $connection = mysqli_connect($host, $username, $password, $dbname) or die("Connection Error " . mysqli_error($connection));

    // open connection to mysql database
function display_parent_nodes($id)
{
    global $data;
    $current = $data[$id];
    $parent_id = $current["parent_id"] === NULL ? "NULL" : $current["parent_id"];
    $parents = array();
    while (isset($data[$parent_id])) {
        $current = $data[$parent_id];
        $parent_id = $current["parent_id"] === NULL ? "NULL" : $current["parent_id"];
        $parents[] = $current["name"];
    }
    echo implode(" > ", array_reverse($parents));
}
display_parent_nodes(10);
    //close the db connection
    mysqli_close($connection);
?>