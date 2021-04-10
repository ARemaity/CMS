
<?php
// header('Access-Control-Allow-Origin: *');
// header('Content-type: application/json');
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once (dirname(__FILE__, 3)) . '/include/DB_manage.php';
$dbm=new DB_manage();
$_POST = json_decode(file_get_contents("php://input"),true);
$name=$_POST["stock_name"];
$number=$_POST["stock_number"];
$adress=$_POST["stock_address"];

if(!empty($name)&&!empty($number)&&!empty($adress)){
$result=$dbm->new_stock($name,$number,$adress);
echo ($result)?1:0;}
else{echo 0;}
}
else{echo 0;}

?>