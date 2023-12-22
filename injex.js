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
  server: "DESKTOP-OTMR5M4",
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
    pool
      .request()
      .query(
        `select * from ${req.body.table} where ${req.body.condition}`,
        (err, result) => {
          console.log(result);
          let list_result = result["recordset"];
          res.json({
            list: list_result,
          });
        }
      );
  });
});

app.delete("/delete_row", (req, res) => {
  console.log(req.body);
  pool.connect().then(() => {
    pool
      .request()
      .query(`delete from ${req.body.table} where id = ${req.body.id}`);
  });
  res.status(200).send("The row has been deleted");
});

app.post("/result_custom", (req, res) => {
  console.log(req.body);
  pool.connect().then(() => {
    pool.request().query(`${req.body.query}`, (err, result) => {
      let list_result = result["recordset"];
      res.json({
        keys: Object.keys(list_result[0]),
        list: list_result,
      });
    });
  });
});
app.listen(port, (req, res) => {
  console.log(`server is running on port ${port}`);
});
