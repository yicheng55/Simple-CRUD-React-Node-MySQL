const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  // EX38-windows
  password: "12345678",

  // Home pc
  // password: "",
  // database: "codingdeft",
  database: "wms_master",
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
          // console.log(result.insertId);
          // res.send("Values Inserted");
          // 查詢新增資料
          db.query("SELECT *  FROM employees WHERE id = ?", result.insertId, (err, result) => {
            if (err) {
              console.log(err);
            } else {
              console.log(result[0]);
              res.send(result[0]);
            }
          });

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
      console.log(req);
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



app.get("/catalog/transaction", (req, res) => {
    //   console.log(req);
      db.query("SELECT * FROM transactions", (err, result) => {
        if (err) {
          console.log(err);
        } else {
          console.log(result);
          // res.json(result);
          res.send(result);
        }
      });
    });


app.get("/catalog/location", (req, res) => {
    //   console.log(req);
        db.query("SELECT * FROM locations", (err, result) => {
        if (err) {
            console.log(err);
        } else {
            console.log(result);
            res.json(result);
            // res.send(result);
        }
        });
    });



app.get("/:id", (req, res) => {
  const id = req.params.id;
  db.query("SELECT *  FROM employees WHERE id = ?", id, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      console.log(result);
      res.send(result);
    }
  });
});


app.put("/update", (req, res) => {
  console.log(req.body);
  const id = req.body.id;
  const address = req.body.address;
  db.query(
    "UPDATE employees SET address = ? WHERE id = ?",
    [address, id],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send(result);
      }
    }
  );
});


app.delete("/:id", (req, res) => {
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

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    console.log(req.url);
    const msg = {
      code: 404,
      msg: "url not found ......",
      data: [{msg: req.url}],
    };
    res.status(404);
    res.json(msg);
  });

app.listen(3001, () => {
  console.log("Yey, your server is running on port 3001");
});
