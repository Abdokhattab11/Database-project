import sql from "mssql/msnodesqlv8.js";
import express from "express";
import bodyParser from "body-parser";


const port = 8000;
const app = express();

app.use(express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

const pool = new sql.ConnectionPool({
  database: "ProjectManagement",
  server: "DESKTOP-UT15SN3\\MSSQLSERVER01",
  driver: "msnodesqlv8",
  options: {
    trustedConnection: true,
  },
});

app.get("/", (req, res) => {
  res.render("index.ejs");
});

app.post("/result_table", (req, res) => {
  pool.connect().then(() => {
    pool.request().query(`select * from ${req.body.fetch}`, (err, result) => {
      let list_result = result["recordset"];
      res.json({
        list: list_result,
      });
    });
  });
});

app.post("/result_filter", (req, res) => {
  console.log(req.body);
  pool.connect().then(() => {
    pool.request().query(`select * from ${req.body.table} where ${req.body.condition}`, (err, result) => {
      console.log(result);
      let list_result = result["recordset"];
      res.json({
        list: list_result,
      });
    });
  });
});

app.delete("/delete_row", (req, res) => {
  console.log(req.body);
  // pool.connect().then(() => {
  //   pool.request().query(`select * from ${req.body.table} where ${req.body.condition}`, (err, result) => {
  //     console.log(result);
  //     let list_result = result["recordset"];
  //     res.json({
  //       list: list_result,
  //     });
  //   });
  // });
  res.status(200).send("The row has been deleted")
});

app.listen(port, (req, res) => {
  console.log(`server is running on port ${port}`);
});
