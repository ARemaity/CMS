<?php
// header('Access-Control-Allow-Origin: *');
// header('Content-type: application/json');

require_once (dirname(__FILE__, 3)) . '/include/DB_report.php';
$dbr=new DB_report();
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
$result=$dbr->get_stock();
echo ($result)?json_encode($result) : 0;
}else{
echo 0;}

?>