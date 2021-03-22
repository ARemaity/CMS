
<?php

require_once ('../include/DB_manage.php');
$dbm=new DB_Manage();


require_once ('../include/DB_report.php');
$dbr=new DB_report();


// $result=$dbm->new_customer(1,"new","new","new","new","new");
// echo $result;

// $result=$dbm->delete_customer(7);
// echo $result;


// $result=$dbm->delete_customer(7);
// echo $result;


// $result=$dbm->update_customer(5,1,"php","php","php","php","php");
// echo $result;

// $result=$dbr->get_customer();
// print_r($result);


$result=$dbr->get_single_customer(4);
print_r($result);

?>