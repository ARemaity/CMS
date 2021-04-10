<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_POST = json_decode(file_get_contents("php://input"),true);
    require_once (dirname(__FILE__, 3)) . '/include/DB_manage.php';
    $dbm=new DB_manage();
$stockid=$_POST['id'];
if(!empty($stockid)){
$result = $db->delete_stock($stockid);
echo ($result)?1:0;
}else{echo 0;}
}
else{echo 0;}
?>