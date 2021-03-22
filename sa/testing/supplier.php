
<?php

require_once ('../include/DB_manage.php');
$dbm=new DB_Manage();


require_once ('../include/DB_report.php');
$dbr=new DB_report();


// $result=$dbm->new_supplier(4,"maxi","ayad","here","07415466","asd@gmail");

// echo $result;


// $result=$dbr->get_supplier();

// print_r( $result);


$result=$dbr->get_single_supplier(8);

print_r( $result);


// $result=$dbm->delete_supplier(9);

// echo $result;


// $result=$dbm->update_supplier(8,4,"maxi","ayad","here","07415466","asd@gmail");
// echo $result;
?>