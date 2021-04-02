
import React,{ useState } from 'react';
import Button from 'react-bootstrap/Button';
import axios from 'axios';
import {ModalInsert} from './ModalInsert'; 



export function StockManagment() {

 const [showmodal,setShow] = useState(false);

const modalAction=()=>{
    if(showmodal){
    setShow(false);}
    else{ setShow(true);}
       
}


  return (
      <div>
  <Button onClick={()=>modalAction()} variant="primary" size="lg" active>
    Primary button
  </Button>

  <ModalInsert
      showr={showmodal}
     onHide={modalAction} 
     />
 



    </div>
  );
}
