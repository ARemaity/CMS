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
    public function update_curency($id,$name,$symbol,$value)
    {

        $stmt = $mysqli->prepare(' CALL `update_currency`(?, ?, ?, ?)');
        $stmt->bind_param('issd', $id,$name,$symbol,$value);
        if ($stmt->execute()) {

            $stmt->close();
            return true;
        } else {
            return false;
        }
    }

}
