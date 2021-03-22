<?php



class DB_manage
{

    private $conn;

    public function __construct()
    {
        require_once 'DB_Connect.php';
        // connecting to database
        $db = new Db_Connect();
        $this->conn = $db->connect();

    }

    // destructor
    public function __destruct()
    {

    }

    /**
     * delete_curency
     *
     * @param  int $id
     * @return bool
     */
    public function delete_curency($id)
    {

        $stmt = $mysqli->prepare('  CALL `delete_currency`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

    /**
     * update_curency
     *
     * @param  int $id
     * @return bool
     */
    public function update_currency($id, $name, $symbol, $value)
    {

        $stmt = $mysqli->prepare(' CALL `update_brand`(?, ?, ?, ?)');
        $stmt->bind_param('issd', $id, $name, $symbol, $value);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

    /**
     * delete_brand
     *
     * @param  int $id
     * @return bool
     */
    public function delete_brand($id)
    {

        $stmt = $this->conn->prepare(' CALL `delete_brand`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

     
    /**
     * update_brand
     *
     * @param  int $id
     * @param  string $name
     * @param  string $description
     * @return bool
     */
    public function update_brand($id,$name,$description)
    {

        $stmt = $this->conn->prepare('CALL `update_brand`(?,?,?,NOW())');
        $stmt->bind_param('iss',$id,$name,$description);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }





    /**
     * delete_CAT
     *
     * @param  int $id
     * @return bool
     */
    public function delete_category($id)
    {

        $stmt =  $this->conn->prepare('  CALL `delete_category`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

     
    /**
     * update_cat
     *
     * @param  int $id
     * @param  string $name
     * @param  string $description
     * @return bool
     */
    public function update_category($id, $name,$description)
    {

        $stmt = $this->conn->prepare(' CALL `update_category`(?,?, ?,NOW())');
        $stmt->bind_param('iss',$id,$name,$description);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

    //inser supplier
    public function new_supplier($person_type, $fname,$lname,$adress,$phone,$email)
    {

        $stmt = $this->conn->prepare(' CALL `new_supplier`(?,?,?,?,?,?)');
        $stmt->bind_param('isssss',$person_type,$fname,$lname,$adress,$phone,$email);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

    public function delete_supplier($id)
    {

        $stmt =  $this->conn->prepare(' CALL `delete_supplier`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

    public function update_supplier($sid, $person_type,$fname,$lname,$address,$phone,$email)
    {

        $stmt = $this->conn->prepare(' CALL `update_supplier`(?,?,?,?,?,?,?)');
        $stmt->bind_param('iisssss',$sid,$person_type,$fname,$lname,$address,$phone,$email);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }




    public function delete_stock($id)
    {

        $stmt =  $this->conn->prepare(' CALL `delete_stock`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }


    public function update_stock($sid, $stock_name,$stock_number,$stock_address)
    {

        $stmt = $this->conn->prepare(' CALL `update_stock`(?,?,?,?)');
        $stmt->bind_param('isss',$sid,$stock_name,$stock_number,$stock_address);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

    //customer
    public function new_customer($person_type, $fname,$lname,$adress,$phone,$email)
    {

        $stmt = $this->conn->prepare(' CALL `new_customer`(?,?,?,?,?,?)');
        $stmt->bind_param('isssss',$person_type,$fname,$lname,$adress,$phone,$email);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

    public function delete_customer($id)
    {

        $stmt =  $this->conn->prepare(' CALL `delete_customer`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

    public function update_customer($cid, $person_type,$fname,$lname,$address,$phone,$email)
    {

        $stmt = $this->conn->prepare(' CALL `update_customer`(?,?,?,?,?,?,?)');
        $stmt->bind_param('iisssss',$cid,$person_type,$fname,$lname,$address,$phone,$email);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }




}
