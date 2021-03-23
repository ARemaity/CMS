
<?php

require_once ('../include/DB_manage.php');
$dbm=new DB_Manage();


require_once ('../include/DB_report.php');
$dbr=new DB_report();



// $result=$dbm->update_stock_detail(1,1,1,1);
// echo $result;
// $result=$dbm->delete_stock_detail(1);
// echo $result;

$result=$dbr->get_single_stock_detail(2);
print_r( $result);

?>