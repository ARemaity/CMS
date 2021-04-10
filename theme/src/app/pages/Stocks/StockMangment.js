
import React,{Component} from 'react';
import Button from 'react-bootstrap/Button';
import axios from 'axios';
import {ModalInsert} from './ModalInsert'; 
import {ModalUpdate} from './ModalUpdate'; 
import { makeStyles } from '@material-ui/core/styles';
import Tablestocks from './table'; 
import Spinner from './Spinner';

export class StockManagment extends Component {

 state={showmodal:false,
       showmodal2:false,
       showspinner:false,
        stock_id:"",
        stock_name : ""
        ,stock_number :"",
         stock_address : "",
         table :[]
         
};


 componentDidMount=()=>{
   this.setState({showspinner:true})

this.updatetable();
this.setState({showspinner:false})
 };

 handleCellClick = (e) => {
  
let id={id:e.target.textContent}

    axios.post(`stock/getsingle.php`,id).then(res => {
      if(res.data!==0){
        
this.setState({
  stock_id:id.id,
  stock_name : res.data.stock_name
  ,stock_number :res.data.stock_number,
   stock_address : res.data.stock_address

});

      }
      
      }).catch(function (error) {
        console.log(error);
      }); 

   
        this.setState({showmodal2 : true});
       

  // console.log(e.target.textContent);
}




updatetable=()=>{

  axios.get( `stock/get.php`).then(res => {
   
    this.setState({table:res.data,
      showmodal:false
      
    });
    
  }).catch(function (error) {
    console.log(error);
  }); 
  this.reststock();

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

reststock=()=>{
  this.setState({  stock_name : ""
  ,stock_number :"",
   stock_address : ""});

};


 modalAction=()=>{
   
    if(this.state.showmodal){
    this.setState({showmodal : false})}
    else{ this.setState({showmodal : true})} };

   modalAction2=()=>{
   
    if(this.state.showmodal2){
    this.setState({showmodal2 : false})}
    else{ this.setState({showmodal2 : true})} 
    this.reststock();

  };
   
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
modalupdate=(e)=>{
  
  e.preventDefault();
let stock={stock_id:this.state.stock_id,
  stock_name:this.state.stock_name,
stock_number:this.state.stock_number,
stock_address:this.state.stock_address}

axios.post(`stock/update.php`,stock).then(res => {
if(res.data===1)this.updatetable();

}).catch(function (error) {
  console.log(error);
}); 

this.setState({showmodal2 : false});
this.reststock();
};

render(){
let sp=<Spinner/>;
if(this.state.showspinner){
  sp=<Spinner/>;
}else{  sp="";}



  return (
    
      <div>
  <Button onClick={()=>this.modalAction()} variant="primary" size="lg" active>
    Primary button
  </Button>
{sp}
  
  <ModalInsert
  submit={this.modalsubmit}
  change={(e)=>this.onChange(e)}
  number={this.state.stock_number}
      showr={this.state.showmodal}
     onHide={()=>this.modalAction()} 
     />
 <ModalUpdate 
  showr={this.state.showmodal2}
  onHide={()=>this.modalAction2()}
  number={this.state.stock_number}
name={this.state.stock_name}
adress={this.state.stock_address}
submit={this.modalupdate}
change={(e)=>this.onChange(e)}
 
 
 />
 <Tablestocks Tablestyle={this.Tablestyle} rowdata={this.state.table} cellclick={this.handleCellClick}/>

    </div>
  );
}
}
