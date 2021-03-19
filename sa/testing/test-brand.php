<!-- test page for table brand  -->
<?php

require_once ('../include/DB_manage.php');
$db=new DB_Manage();




// $result=$db->single_brand(125);
                                                  //done
// print_r($result);


// $result=$db->delete_brand(125);
                                             //done
//  echo $result;


// $result=$db->get_brand();
                                    //done             
// print_r($result);


$result=$db->update_brand(125,"ok","ok");
                                                
print_r($result);














?>