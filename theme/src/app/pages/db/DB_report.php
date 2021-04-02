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

        $stmt =$this->conn->prepare(' CALL get_single_brand(?)');
        $stmt->bind_param('i', $id);
      
        if ($stmt->execute()) {
            $brand = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $brand;
        } else {
            return null;
        }
    }



//get all brands
    public function get_brand()
    {

        $stmt =$this->conn->prepare(' CALL get_brand()');
      
      
        if ($stmt->execute()) {
            $brand = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $brand;
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
    public function get_single_category($id)
    {

        $stmt = $this->conn->prepare(' CALL `get_single_category`(?)');
        $stmt->bind_param('i', $id);
       
        if ($stmt->execute()) {
            $category = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $category;
        } else {
            return null;
        }
    }

/**
 * read_categry
 *
 * @return array
 */
    public function get_category()
    {

        $stmt = $this->conn->prepare('CALL get_category()');
        if ($stmt->execute()) {
            $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }

    public function get_supplier()
    {

        $stmt = $this->conn->prepare('CALL `get_supllier`()');
        if ($stmt->execute()) {
            $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }

    public function get_single_supplier($id)
    {

        $stmt = $this->conn->prepare('CALL `get_single_supplier`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $all = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }
    public function get_single_stock($id)
    {

        $stmt = $this->conn->prepare('CALL `get_single_stock`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $all = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }

    public function get_stock()
    {

        $stmt = $this->conn->prepare('CALL `get_stock`()');
        if ($stmt->execute()) {
            $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }
    
    /**
     * get_stock_action
     *
    * @param  int action_id
     * @return array single row
     */
    public function get_stock_action($sid)
    {

        $stmt = $this->conn->prepare('CALL `get_stock_action`(?)');
        $stmt->bind_param('i', $sid);
        if ($stmt->execute()) {
            $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }

    
    /**
     * get_single_stock_action
     *
     * @param  int action_id
     * @return array single row
     */
    public function get_single_stock_action($id)
    {

        $stmt = $this->conn->prepare('CALL `read_single_stock_action`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $all = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();
        }
    }

        /**
     * get_stock_action_transaction
     *
    * @param  int action_id
     * @return array single row
     */
    public function get_stock_action_transaction($sid)
    {

        $stmt = $this->conn->prepare('read_stock_action_t`(?)');
        $stmt->bind_param('i', $sid);
        if ($stmt->execute()) {
            $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }
//customer
public function get_customer()
{

    $stmt = $this->conn->prepare('CALL `get_customer`()');
    if ($stmt->execute()) {
        $all = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
        return $all;
        
    } else {
        return false;
        $stmt->close();

    }
}
public function get_single_customer($id)
    {

        $stmt = $this->conn->prepare('CALL `get_single_customer`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $all = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }



    public function read_product()
    {

        $stmt = $this->conn->prepare('CALL `read_product`()');
       
        if ($stmt->execute()) {

            $all = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }


//read stock detail
public function get_single_stock_detail($id)
    {

        $stmt = $this->conn->prepare('CALL `get_single_stock_detail`(?)');
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {

            $all = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $all;
            
        } else {
            return false;
            $stmt->close();

        }
    }


}
