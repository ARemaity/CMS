<!-- test page for table  category   -->

<?php

require_once ('../include/DB_manage.php');
$dbm=new DB_Manage();


require_once ('../include/DB_report.php');
$dbr=new DB_report();



// $result=$dbr->single_cat(2);
// print_r($result);





// $result=$dbr->get_category();
// print_r($result);


// $result=$dbm->delete_category(1);
// echo $result;



// $result=$dbm->update_category(2,"name","desc");
// echo $result;

// BEGIN

// INSERT INTO `person`(`person_id`, `person_type`, `fname`, `lname`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES (person_id,person_type,fname,lname,address,phone,email,created_at,updated_at);

// SELECT LAST_INSERT_ID()into supfr;

// INSERT INTO `supplier`(`supplier_id`, `fk_person_id`) VALUES (Null,supfr);
// END
// SELECT LAST_INSERT_ID()into supfr;

?>