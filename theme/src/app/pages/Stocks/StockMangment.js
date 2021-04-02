
import React,{Component  } from 'react';
import Button from 'react-bootstrap/Button';
import axios from 'axios';
import {ModalInsert} from './ModalInsert'; 



export class StockManagment extends Component {

 state={showmodal:false,

        stock_name : ""
        ,stock_number :"",
         stock_address : ""
};

 modalAction=()=>{
    if(this.state.showmodal){
    this.setState({showmodal : false})}
    else{ this.setState({showmodal : true})} };

    onChange = (e) => {
      this.setState({ [e.target.name]: e.target.value });
    
    }
modalsubmit=(e)=>{
  
  e.preventDefault();
  

fetch("http://localhost:8080/CMS/theme/src/app/pages/Stocks/insert.php")
.then(res => res.json())
.then(
  (result) => {
   console.log(result);
  },
  // Note: it's important to handle errors here
  // instead of a catch() block so that we don't swallow
  // exceptions from actual bugs in components.
  (error) => {
   console.log(error)
  }
)

// axios.post(`http://localhost:8080/CMS/theme/src/app/pages/Stocks/insert.php`, { user:"sd" })
// .then(res => {
//   console.log(res);
//   console.log(res.data);
// })













}

render(){
  return (
      <div>
  <Button onClick={()=>this.modalAction()} variant="primary" size="lg" active>
    Primary button
  </Button>

  <ModalInsert
  submit={this.modalsubmit}
  change={this.onChange}
      showr={this.state.showmodal}
     onHide={()=>this.modalAction()} 
     />
 



    </div>
  );
}
}
