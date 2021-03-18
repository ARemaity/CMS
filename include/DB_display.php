<?php
class DB_Display{

    private $conn;


    // constructor
    function __construct() {
        require_once 'DB_Connect.php';
        // connecting to database
        $db = new Db_Connect();
        $this->conn = $db->connect();
      
    }

    // destructor
    function __destruct() {
        
    }
	
        /**
     * Get publisher balance
     */
    public function getpubbalance($userId) {
        $stmt = $this->conn->prepare("SELECT pub_balance 
        FROM users WHERE userId =?");
        $stmt->bind_param("i", $userId);
        if ($stmt->execute()) {			
            $user = $stmt->get_result()->fetch_assoc();
            $stmt->close();
			return $user; 
        } else {
            return NULL;
        }
    }
}
?>