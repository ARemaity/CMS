
<?php
// header('Access-Control-Allow-Origin: *');
// header('Content-type: application/json');
require_once (dirname(__FILE__, 3)) . '/include/DB_manage.php';

$dbm=new DB_manage();

$_POST = json_decode(file_get_contents("php://input"),true);


$name=$_POST["stock_name"];
$number=$_POST["stock_number"];
$adress=$_POST["stock_address"];

$result=$dbm->new_stock($name,$number,$adress);

if($result){

    echo 1;
die();
}else{
   echo 0;
die();
}
// $extra = array(  
//     'ETID'=> "name",  
//     'name'=>"ali",
//     'cost'=>"212"
//     );
// echo json_encode($extra);





?>