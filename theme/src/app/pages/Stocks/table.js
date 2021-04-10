
import React,{useEffect} from 'react';

import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';

const Stocktable=(props)=> {




  const classes = props.Tablestyle();
  let rows=props.rowdata;

  return (
    <Paper className={classes.root}>
      <Table className={classes.table}>
        <TableHead>
          <TableRow>
            <TableCell>ID</TableCell>
            <TableCell align="right">Name</TableCell>
            <TableCell align="right">Number</TableCell>
            <TableCell align="right">Adress</TableCell>
            <TableCell align="right">Date</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map(row => {return(
            <TableRow key={row.stock_id}>
              <TableCell component="th" scope="row">
                {row.stock_id}
              </TableCell>
              <TableCell align="right">{row.stock_name}</TableCell>
              <TableCell align="right">{row.stock_number}</TableCell>
              <TableCell align="right">{row.stock_address}</TableCell>
              <TableCell align="right">{row.created_at}</TableCell>
            </TableRow>
          );})}
        </TableBody>
      </Table>
    </Paper>
  );
}
export default Stocktable;