import React from 'react';
import Modal from "react-bootstrap/Modal";
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';

export const ModalUpdate = (props) => {

    return (
        <Modal
        
        show={props.showr}
        onHide={props.onHide}
          size="lg"
          aria-labelledby="contained-modal-title-vcenter"
          centered
        >
          <Modal.Header closeButton>
    <Modal.Title>Update Stock</Modal.Title>
  </Modal.Header>
  <Form   onSubmit={props.submit}  >
  <Modal.Body>
   
  
  <Form.Group controlId="formBasicName">
    <Form.Label>Stock Name</Form.Label>
    <Form.Control size="lg" type="text" onChange={props.change}  name="stock_name"  placeholder="Enter Name" value={props.name} required />
    <Form.Text className="text-muted">
    
    </Form.Text>
  </Form.Group>

  <Form.Group controlId="formBasicPassword">
    <Form.Label>Stock Number</Form.Label>
    <Form.Control  size="lg" type="text" onChange={props.change}   name="stock_number" placeholder="Stock Number" value={props.number}  required/>
  </Form.Group>
 
  <Form.Group controlId="formBasicAddress">
    <Form.Label>Address</Form.Label>
    <Form.Control size="lg" type="address" onChange={props.change}  name="stock_address" placeholder="Enter Adress" value={props.adress} required />
    <Form.Text className="text-muted">
     
    </Form.Text>
  </Form.Group>


  </Modal.Body>
  
  <Modal.Footer>
    <Button onClick={props.onHide} variant="secondary">Close</Button>
    <Button variant="primary" type="submit" >Update Stock</Button>
  </Modal.Footer>
  </Form>
        </Modal>
      );
    
  }