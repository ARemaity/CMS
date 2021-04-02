import React from 'react';
import Modal from "react-bootstrap/Modal";
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
export const ModalInsert = (props) => {
    console.log(props.showr);
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
  <Form>
  <Modal.Body>
   
  
  <Form.Group controlId="formBasicName">
    <Form.Label>Stock Name</Form.Label>
    <Form.Control size="lg" type="text" placeholder="Enter Name" />
    <Form.Text className="text-muted">
    
    </Form.Text>
  </Form.Group>

  <Form.Group controlId="formBasicPassword">
    <Form.Label>Stock Number</Form.Label>
    <Form.Control size="lg" type="text" placeholder="Stock Number" />
  </Form.Group>
 
  <Form.Group controlId="formBasicAddress">
    <Form.Label>Address</Form.Label>
    <Form.Control size="lg" type="address" placeholder="Enter Adress" />
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