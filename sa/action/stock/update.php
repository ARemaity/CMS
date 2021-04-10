<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_POST = json_decode(file_get_contents("php://input"),true);
    require_once (dirname(__FILE__, 3)) . '/include/DB_manage.php';
    $dbm=new DB_manage();
    $id=$_POST["stock_id"];
    $name=$_POST["stock_name"];
    $number=$_POST["stock_number"];
    $adress=$_POST["stock_address"];
    

if(!empty($id)&&!empty($name)&&!empty($number)&&!empty($adress)){

    $result = $dbm->update_stock($id,$name,$number,$adress);

    echo ($result)?1:0;
    }else{
    echo 0;}

}
else{
echo 0;}
