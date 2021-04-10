
import React,{Component} from 'react';
import Button from 'react-bootstrap/Button';
import axios from 'axios';
import {ModalInsert} from './ModalInsert'; 
import { makeStyles } from '@material-ui/core/styles';
import Tablestocks from './table'; 


export class StockManagment extends Component {

 state={showmodal:false,

        stock_name : ""
        ,stock_number :0,
         stock_address : "",
         table :[]
         
};


 componentDidMount=()=>{

this.updatetable();
 };




updatetable=()=>{

  axios.get( `stock/get.php`).then(res => {
    console.log(res.data);
    this.setState({table:res.data});
    
  }).catch(function (error) {
    console.log(error);
  }); 
  

};

Tablestyle = makeStyles(theme => ({
  root: {
    width: '100%',
    marginTop: theme.spacing(3),
    overflowX: 'auto',
  },
  table: {
    minWidth: 650,
  },
}));



 modalAction=()=>{
    if(this.state.showmodal){
    this.setState({showmodal : false})}
    else{ this.setState({showmodal : true})} };

    onChange = (e) => {

      const re = /^[0-9\b]+$/;

      // if value is not blank, then test the regex
  if((e.target.name).localeCompare("stock_number"))
  { this.setState({ [e.target.name]: e.target.value });}
  else{
      if (e.target.value === '' || re.test(e.target.value)) {


      this.setState({ [e.target.name]: e.target.value });
      }}
    }
modalsubmit=(e)=>{
  
  e.preventDefault();
let stock={stock_name:this.state.stock_name,
stock_number:this.state.stock_number,
stock_address:this.state.stock_address}

axios.post(`stock/insert.php`,stock).then(res => {
if(res.data===1)this.updatetable();
}).catch(function (error) {
  console.log(error);
}); 

this.setState({showmodal : false});

};

render(){
  return (
      <div>
  <Button onClick={()=>this.modalAction()} variant="primary" size="lg" active>
    Primary button
  </Button>

  <ModalInsert
  submit={this.modalsubmit}
  change={(e)=>this.onChange(e)}
  number={this.state.stock_number}
      showr={this.state.showmodal}
     onHide={()=>this.modalAction()} 
     />
 
 <Tablestocks Tablestyle={this.Tablestyle} rowdata={this.state.table}/>

 
    </div>
  );
}
}
