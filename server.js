const express = require("express");
const fetch = require("node-fetch");
var mysql = require("mysql");

const app = express();
const port = process.env.PORT || 3000;
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
/* Start database connection */
// Adding credentials to access database
var connection = mysql.createConnection({
  //Host and login info will have to be changed if we use AWS, currently pointing to my database
  host: "162.241.216.56",
  user: "connorm4_490user",
  password: "InfoCap490",
  database: "connorm4_inst490"
});

// connect to mysql
connection.connect(function(err) {
  // in case of error
  if (err) {
    console.log(err.code);
    console.log(err.fatal);
  }
});

// Perform a test query
$query = "SELECT * from actors LIMIT 10";
var actors;
connection.query($query, function(err, rows, fields) {
  if (err) {
    console.log("An error ocurred performing the query.");
    return;
  }
  actors = rows[2];
  //console.log("Query succesfully executed: ", rows);
});

// Close the database connection
connection.end(function() {});

/*
 * The 'express.static' middleware provides some services Express can use to
 * serve files from a directory - in this case, the 'public' subdirectory of
 * this project.
 *
 * The 'app.use' function attaches middleware to our Express application, so
 * that when the application is running, it can serve static files. In this
 * case, we mount it over the entire app: any web request that GETs a path that
 * exists in the 'public' directory will be handled by the middleware. The
 * middleware also serves the 'index.html' file in a directory (if it exists)
 * whenever a client requests the directory itself.
 *
 * The 'public' directory for this project, in turn, contains all the HTML,
 * Javascript, and CSS files needed to run a simple chat client connected to
 * this server. Accessing this server's root URL will serve 'public/index.html',
 * which contains our chat client. This gives users an easy way to connect to
 * the server and interact with other users.
 *
 * See also:
 *  - Express: Serving static files in Express
 *    https://expressjs.com/en/starter/static-files.html
 *  - Express: express.static()
 *    https://expressjs.com/en/4x/api.html#express.static
 *  - Express: Using middleware
 *    https://expressjs.com/en/guide/using-middleware.html
 *  - Express: app.use()
 *    https://expressjs.com/en/4x/api.html#app.use
 */
app.use(express.static("public"));

// this is a single route, in the simplest possible format
// the simplest format is not necessarily the best one.
// this is, right now, an introduction to Callback Hell
// but it is okay for a first-level example

app.get("/actors", (req, res) => {
  var connection = mysql.createConnection({
    //Host and login info will have to be changed if we use AWS, currently pointing to my database
    host: "162.241.216.56",
    user: "connorm4_490user",
    password: "InfoCap490",
    database: "connorm4_inst490"
  });
  var actors;
  // connect to mysql
  connection.connect(function(err) {
    // in case of error
    if (err) {
      console.log(err.code);
      console.log(err.fatal);
    }
    $query = "SELECT * from actors LIMIT 10";
    connection.query($query, function(err, rows, fields) {
      if (err) {
        console.log("An error ocurred performing the query.");
        return;
      }
      //var obj = JSON.stringify(rows);
      //actors = obj;
      res.send({ data: rows });
      console.log(rows);
      //console.log(actors);
      //console.log(obj);

      //console.log("Query succesfully executed: ", rows);
    });
    // Close the database connection
    connection.end(function() {});
  });
});

app.get("/groupings", (req, res) => {
  const baseURL = "http://localhost:" + port + "/json/groupings.json";
  fetch(baseURL)
    .then(res => res.json())
    .then(data => {
      //console.log(data);
      res.send({ data: data });
    })
    .catch(err => {
      console.log(err);
      res.redirect("/error");
    });
});

app.get("/instances", (req, res) => {
  const baseURL = "http://localhost:" + port + "/json/instances.json";
  fetch(baseURL)
    .then(res => res.json())
    .then(data => {
      //console.log(data);
      res.send({ data: data });
    })
    .catch(err => {
      console.log(err);
      res.redirect("/error");
    });
});

app.get("/instances", (req, res) => {
  const baseURL = "http://localhost:" + port + "/json/instances.json";
  fetch(baseURL)
    .then(res => res.json())
    .then(data => {
      //console.log(data);
      res.send({ data: data });
    })
    .catch(err => {
      console.log(err);
      res.redirect("/error");
    });
});

app.get("/msgactions", (req, res) => {
  const baseURL = "http://localhost:" + port + "/json/msgactions.json";
  fetch(baseURL)
    .then(res => res.json())
    .then(data => {
      //console.log(data);
      res.send({ data: data });
    })
    .catch(err => {
      console.log(err);
      res.redirect("/error");
    });
});

app.get("/people", (req, res) => {
  const baseURL = "http://localhost:" + port + "/json/people.json";
  fetch(baseURL)
    .then(res => res.json())
    .then(data => {
      //console.log(data);
      res.send({ data: data });
    })
    .catch(err => {
      console.log(err);
      res.redirect("/error");
    });
});

app.get("/roles", (req, res) => {
  const baseURL = "http://localhost:" + port + "/json/roles.json";
  fetch(baseURL)
    .then(res => res.json())
    .then(data => {
      //console.log(data);
      res.send({ data: data });
    })
    .catch(err => {
      console.log(err);
      res.redirect("/error");
    });
});

app.get("/versions", (req, res) => {
  const baseURL = "http://localhost:" + port + "/json/versions.json";
  fetch(baseURL)
    .then(res => res.json())
    .then(data => {
      //console.log(data);
      res.send({ data: data });
    })
    .catch(err => {
      console.log(err);
      res.redirect("/error");
    });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
