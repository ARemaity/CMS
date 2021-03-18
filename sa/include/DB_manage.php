<?php

//America/New_York

class DB_Manage
{

    private $conn;

//private $timezone;
    // constructor
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

        $stmt = $mysqli->prepare('  CALL `delete_brand`(?)');
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
    public function update_brand($id, $name,$description)
    {

        $stmt = $mysqli->prepare(' CALL `update_brand`(?,?, ?)');
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
    public function delete_cat($id)
    {

        $stmt = $mysqli->prepare('  CALL `delete_brand`(?)');
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
    public function update_cat($id, $name,$description)
    {

        $stmt = $mysqli->prepare(' CALL `update_cat`(?,?, ?)');
        $stmt->bind_param('iss',$id,$name,$description);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

}
