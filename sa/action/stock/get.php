<?php
// header('Access-Control-Allow-Origin: *');
// header('Content-type: application/json');

require_once (dirname(__FILE__, 3)) . '/include/DB_report.php';
$dbr=new DB_report();

$result=$dbr->get_stock();

if($result){

    echo json_encode($result);
die();
}else{
   echo 0;
die();
}












?>