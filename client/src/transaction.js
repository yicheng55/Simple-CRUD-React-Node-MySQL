import {
  Button,
  EditableText,
  InputGroup,
  Toaster,
  Position,
} from "@blueprintjs/core";
import axios from "axios";
import { useEffect, useState } from "react";

const AppToaster = Toaster.create({
  position: Position.TOP,
});

function App() {
  const [employees, setEmployees] = useState([]);
  const [locations, setLocations] = useState([]);
  const [departments, setDepartments] = useState([]);
  const [newName, setNewName] = useState("");
  const [newDepartment, setNewDepartment] = useState("");
  const [newAddress, setNewAddress] = useState("");

  console.log( __filename );
  useEffect(() => {
    let url = "http://localhost:3001/catalog/location";
    axios.get(url)
    .then((response) => {
      const { data } = response;
      // console.log(data.data);
      let resoult = data.data.map(function(list, index, array){
        // console.log(list);
        return list;
        // 依據UI需要轉換欄位名稱
        // return {id: list.ID, name: list.NAME};
      });
      console.log(resoult);
      setLocations(resoult);
    })
    .catch((error) => {
      console.error("Error", error);
    });

    // axios.get("http://localhost:3001/catalog/transaction")
    url = "http://localhost:3001/catalog/transaction";
    axios.get(url)
    .then((response) => {
      const { data } = response;
      // console.log(data.data);
      let resoult = data.data.map(function(list, index, array){
        // console.log(list);
        return list;
        // 依據UI需要轉換欄位名稱
        // return {id: list.ID, name: list.USER_ID, location: list.LOCATION_ID, type: list.TYPE};
      });
      console.log(resoult);
      setEmployees(resoult);
    })
    .catch((error) => {
      console.error("Error", error);
    });

  }, []);

  const addEmployee = () => {
    const name = newName.trim();
    const department = newDepartment;
    const address = newAddress.trim();
    if (name && department && address) {
      axios
        .post("http://localhost:3001/create", {
          name,
          department,
          address,
        })
        .then((response) => {
          const { data } = response;
          // console.log(response.data);
          // console.log(JSON.parse(JSON.stringify(data)));
          // let data1 = JSON.parse(JSON.stringify(data));
          console.log(data);
          setEmployees([...employees, data]);
          setNewName("");
          setNewAddress("");
          setNewDepartment("");
        });
    }
  };

  const onChangeHandler = (id, key, value) => {
    console.log({ id, key, value });
    setEmployees((values) => {
      return values.map((item) =>
        item.id === id ? { ...item, [key]: value } : item
      );
    });
  };

  const updateAddress = (id) => {
    const data = employees.find((item) => item.id === id);
    axios.put(`http://localhost:3001/update`, data).then((response) => {
      AppToaster.show({
        message: "Data updated successfully",
        intent: "success",
        timeout: 3000,
      });
    });
  };

  const deleteEmployee = (id) => {
    axios.delete(`http://localhost:3001/${id}`).then((response) => {
      setEmployees((values) => {
        return values.filter((item) => item.id !== id);
      });

      AppToaster.show({
        message: "Employee deleted successfully",
        intent: "success",
        timeout: 3000,
      });
    });
  };

  return (
    <div className="App">
      <table className="bp4-html-table .modifier">
        <thead>
          <tr>
            <th>ID</th>
            <th>User</th>
            <th>Item</th>
            <th>Type</th>
            <th>Location</th>
            <th>Tag</th>
            <th>Quantity</th>
            <th>Device</th>
            <th>Physical</th>
            <th>Comment</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {employees.map((employee) => {
            // 抓取所需顯示欄位
            const { ID, USER_ID, ITEM_ID, TYPE, LOCATION_ID, TAG_ID, QUANTITY, DEVICE_ID, PHYSICAL_PORT, COMMENT } = employee;
            // 儲位代號id轉為儲位名稱顯示.
            let Location = locations.filter(function(elem, index, arr) {
              return elem.ID === LOCATION_ID;
            });
            // console.log(location);
            console.log(Location);
            return (
              <tr key={ID}>
                <td>{ID}</td>
                <td>{USER_ID}</td>
                <td>{ITEM_ID}</td>
                <td>{TYPE}</td>
                <td>{Location[0].NAME}</td>
                <td>{TAG_ID}</td>
                <td>{QUANTITY}</td>
                <td>{DEVICE_ID}</td>
                <td>{PHYSICAL_PORT}</td>
                <td>
                  <EditableText
                    value={COMMENT}
                    onChange={(value) => onChangeHandler(ID, "COMMENT", value)}
                  />
                </td>
                <td>
                  <Button intent="primary" onClick={() => updateAddress(ID)}>
                    Update
                  </Button>
                  &nbsp;
                  <Button intent="danger" onClick={() => deleteEmployee(ID)}>
                    Delete
                  </Button>
                </td>
              </tr>
            );
          })}
        </tbody>
        <tfoot>
          <tr>
            <td></td>
            <td>
              <InputGroup
                placeholder="Add name here..."
                value={newName}
                onChange={(e) => setNewName(e.target.value)}
              />
            </td>
            <td>
              <div className="bp4-html-select .modifier">
                <select
                  onChange={(e) => setNewDepartment(e.target.value)}
                  value={newDepartment}
                >
                  <option defaultValue ="none">
                    Select department
                  </option>
                  {locations.map((location) => {

                    // 抓取所需顯示欄位
                    const { ID, NAME } = location;
                    return (
                      <option key={ID} value={ID}>
                        {NAME}
                      </option>
                    );
                  })}
                </select>
                <span className="bp4-icon bp4-icon-double-caret-vertical"></span>
              </div>
            </td>
            <td>
              <InputGroup
                placeholder="Add address here..."
                value={newAddress}
                onChange={(e) => setNewAddress(e.target.value)}
              />
            </td>
            <td>
              <Button intent="success" onClick={addEmployee}>
                Add Employee
              </Button>
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
  );
}

export default App;
