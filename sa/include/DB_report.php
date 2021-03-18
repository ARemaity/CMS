<?php
class DB_report
{
    private $conn;

    public function __construct()
    {
        require_once 'DB_Connect.php';
        $db = new Db_Connect();
        $this->conn = $db->connect();

    }

    /**
     * single_currency
     *
     * @param  int $id
     * @return array
     */
    public function single_currency($id)
    {

        $stmt = $mysqli->prepare(' CALL `get_single_currecny`(?)');
        $stmt->bind_param('i', $id);
        $stmt->execute();
        if ($stmt->execute()) {
            $currency = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $currency;
        } else {
            return null;
        }
    }

/**
 * read_currency
 *
 * @return array
 */
    public function read_currency()
    {

        $stmt = $mysqli->prepare('CALL get_currency()');
        if ($stmt->execute()) {
            $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

            return $project;
            $stmt->close();
        } else {
            die("Adding record failed: " . $stmt->error);
            $stmt->close();

        }
    }


    /**
     * single_currency
     *
     * @param  int $id
     * @return array
     */
    public function single_brand($id)
    {

        $stmt = $mysqli->prepare(' CALL `get_single_currecny`(?)');
        $stmt->bind_param('i', $id);
        $stmt->execute();
        if ($stmt->execute()) {
            $currency = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $currency;
        } else {
            return null;
        }
    }

/**
 * read_currency
 *
 * @return array
 */
    public function read_brand()
    {

        $stmt = $mysqli->prepare('CALL get_currency()');
        if ($stmt->execute()) {
            $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

            return $project;
            $stmt->close();
        } else {
            die("Adding record failed: " . $stmt->error);
            $stmt->close();

        }
    }





 /**
     * read_categry
     *
     * @param  int $id
     * @return array
     */
    public function single_cat($id)
    {

        $stmt = $mysqli->prepare(' CALL `get_single_cat`(?)');
        $stmt->bind_param('i', $id);
        $stmt->execute();
        if ($stmt->execute()) {
            $currency = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $currency;
        } else {
            return null;
        }
    }

/**
 * read_categry
 *
 * @return array
 */
    public function read_cat()
    {

        $stmt = $mysqli->prepare('CALL get_cat()');
        if ($stmt->execute()) {
            $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

            return $project;
            $stmt->close();
        } else {
            die("Adding record failed: " . $stmt->error);
            $stmt->close();

        }
    }






}
