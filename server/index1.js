const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  // EX38-windows
  password: "12345678",
  database: "codingdeft",
  // database: "employeeSystem",
});


app.post("/create", (req, res) => {
    const name = req.body.name;
    const department = req.body.department;
    const address = req.body.address;

    db.query(
    //   "INSERT INTO employees (name, age, country, position, wage) VALUES (?,?,?,?,?)",
      "INSERT INTO employees (name, department, address) VALUES (?,?,?)",
      [name, department, address],
      (err, result) => {
        if (err) {
          console.log(err);
        } else {
          res.send("Values Inserted");
        }
      }
    );
  });


// app.post("/create", (req, res) => {
//   const name = req.body.name;
//   const age = req.body.age;
//   const country = req.body.country;
//   const position = req.body.position;
//   const wage = req.body.wage;

//   db.query(
//     "INSERT INTO employees (name, age, country, position, wage) VALUES (?,?,?,?,?)",
//     [name, age, country, position, wage],
//     (err, result) => {
//       if (err) {
//         console.log(err);
//       } else {
//         res.send("Values Inserted");
//       }
//     }
//   );
// });

app.get("/employees", (req, res) => {
//   console.log(req);
  db.query("SELECT * FROM employees", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      console.log(result);
      // res.json(result);
      res.send(result);
    }
  });
});


app.get("/department", (req, res) => {
    //   console.log(req);
      db.query("SELECT * FROM department", (err, result) => {
        if (err) {
          console.log(err);
        } else {
          console.log(result);
          // res.json(result);
          res.send(result);
        }
      });
    });

app.put("/update", (req, res) => {
  const id = req.body.id;
  const wage = req.body.wage;
  db.query(
    "UPDATE employees SET wage = ? WHERE id = ?",
    [wage, id],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
});

app.delete("/delete/:id", (req, res) => {
  const id = req.params.id;
  db.query("DELETE FROM employees WHERE id = ?", id, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      console.log(result);
      res.send(result);
    }
  });
});

app.listen(3001, () => {
  console.log("Yey, your server is running on port 3001");
});
