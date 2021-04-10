<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_POST = json_decode(file_get_contents("php://input"),true);
    require_once (dirname(__FILE__, 3)) . '/include/DB_report.php';
    $dbr=new DB_report();
$stockid=$_POST['id'];
if(!empty($stockid)){
$result = $dbr->get_single_stock($stockid);
echo ($result)?json_encode($result):0;
}else{echo 0;}
}
else{echo 0;}
?>