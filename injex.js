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

app.post("/result", (req, res) => {
  console.log(req.body);
  pool.connect().then(() => {
    //simple query
    pool.request().query(`select * from ${req.body.fetch}`, (err, result) => {
      console.dir(result);
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
