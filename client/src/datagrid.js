import React from 'react';
import { DataGrid } from '@mui/x-data-grid';
import axios from "axios";
import { useEffect, useState } from "react";

const columns = [
  { field: 'id', headerName: 'ID', width: 70 },
  { field: 'firstName', headerName: 'First name', width: 130 },
  { field: 'lastName', headerName: 'Last name', width: 130 },
  {
    field: 'age',
    headerName: 'Age',
    type: 'number',
    width: 90,
  },
  {
    field: 'fullName',
    headerName: 'Full name',
    description: 'This column has a value getter and is not sortable.',
    sortable: false,
    width: 160,
    valueGetter: (params) =>
      `${params.row.firstName || ''} ${params.row.lastName || ''}`,
  },
];

const rows = [
  { id: 1, lastName: 'Snow', firstName: 'Jon', age: 35 },
  { id: 2, lastName: 'Lannister', firstName: 'Cersei', age: 42 },
  { id: 3, lastName: 'Lannister', firstName: 'Jaime', age: 45 },
  { id: 4, lastName: 'Stark', firstName: 'Arya', age: 16 },
  { id: 5, lastName: 'Targaryen', firstName: 'Daenerys', age: null },
  { id: 6, lastName: 'Melisandre', firstName: null, age: 150 },
  { id: 7, lastName: 'Clifford', firstName: 'Ferrara', age: 44 },
  { id: 8, lastName: 'Frances', firstName: 'Rossini', age: 36 },
  { id: 9, lastName: 'Roxie', firstName: 'Harvey', age: 65 },
  { id: 7, lastName: 'Clifford', firstName: 'Ferrara', age: 44 },
  { id: 8, lastName: 'Frances', firstName: 'Rossini', age: 36 },
  { id: 9, lastName: 'Roxie', firstName: 'Harvey', age: 65 },
];

let  urlpath = "http://127.0.0.1:3001";

export default function DataTable() {
  const [locations, setLocations] = useState([]);
  console.log( __filename );

  useEffect(() => {
    let url = `${urlpath}/catalog/location`;
    console.log(url);
    axios.get(url)
    .then((response) => {
      const { data } = response;
      // console.log(data.data);
      let resoult = data.data.map(function(list, index, array){
        // console.log(list);
        // return list;
        // 依據UI需要轉換欄位名稱
        return {id: list.ID, lastName: list.NAME, firstName: list.FULL_NAME, age: list.TYPE};
      });
      console.log(resoult);
      setLocations(resoult);
      // setLocations(rows);
    })
    .catch((error) => {
      console.error("Error", error);
    });

  }, []);



  return (
    <div style={{ height: 400, width: '100%' }}>
      <DataGrid
        rows={locations}
        columns={columns}
        pageSize={5}
        rowsPerPageOptions={[5]}
        checkboxSelection
      />
    </div>
  );
}
