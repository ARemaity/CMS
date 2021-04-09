import React from 'react';
import Modal from "react-bootstrap/Modal";
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';

export const ModalInsert = (props) => {

    return (
        <Modal
        
        show={props.showr}
        onHide={props.onHide}
          size="lg"
          aria-labelledby="contained-modal-title-vcenter"
          centered
        >
          <Modal.Header closeButton>
    <Modal.Title>Insert Stock</Modal.Title>
  </Modal.Header>
  <Form   onSubmit={props.submit} >
  <Modal.Body>
   
  
  <Form.Group controlId="formBasicName">
    <Form.Label>Stock Name</Form.Label>
    <Form.Control size="lg" type="text" onChange={props.change} name="stock_name"  placeholder="Enter Name" required />
    <Form.Text className="text-muted">
    
    </Form.Text>
  </Form.Group>

  <Form.Group controlId="formBasicPassword">
    <Form.Label>Stock Number</Form.Label>
    <Form.Control pattern="[0-9]*" size="lg" type="text"  onChange={props.change} name="stock_number" placeholder="Stock Number"  required/>
  </Form.Group>
 
  <Form.Group controlId="formBasicAddress">
    <Form.Label>Address</Form.Label>
    <Form.Control size="lg" type="address"  onChange={props.change} name="stock_address" placeholder="Enter Adress" required />
    <Form.Text className="text-muted">
     
    </Form.Text>
  </Form.Group>


  </Modal.Body>
  
  <Modal.Footer>
    <Button onClick={props.onHide} variant="secondary">Close</Button>
    <Button variant="primary" type="submit" >Save changes</Button>
  </Modal.Footer>
  </Form>
        </Modal>
      );
    
  }