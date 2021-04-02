
<?php

require_once ('../db/DB_manage.php');
$dbm=new DB_manage();


$result=$dbm->new_stock("asd",11,"adresssoo");

if($result){

    echo json_encode(["response"=>"inserted"]);
die();
}else{
    echo json_encode(["response"=>"error"]);
die();
}
// $extra = array(  
//     'ETID'=> "name",  
//     'name'=>"ali",
//     'cost'=>"212"
//     );
// echo json_encode($extra);





?>