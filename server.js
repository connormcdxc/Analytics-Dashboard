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
    $query = "select r.role_type_id, r.role_type, COUNT(CASE WHEN action_type LIKE 'Sent' THEN 1 END) AS sent, COUNT(CASE WHEN action_type LIKE 'Received' THEN 1 END) AS received from message_actions m inner join actors a on m.actor_id = a.actor_id inner join role_types r on r.role_type_id = a.role_type_id group by role_type_id";
    connection.query($query, function(err, rows, fields) {
      if (err) {
        console.log("An error ocurred performing the query.");
        return;
      }
      var obj = JSON.stringify(rows);
      var obj2 = JSON.parse(obj);
      //actors = obj;
      console.log(obj2);
      //var obj = JSON.parse(rows);
      //console.log(rows);
      res.send({ rows: obj2 });
      //console.log(rows);
      //console.log(actors);
      //console.log(obj);

      //console.log("Query succesfully executed: ", rows);
    });
    // Close the database connection
    connection.end(function() {});
  });
});
app.get("/teammsg1", (req, res) => {
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
    $query = "SELECT g.team_id, a.role_type_id, COUNT(CASE WHEN game_position LIKE 'Day 1' THEN 1 END) AS day1, COUNT(CASE WHEN game_position LIKE 'Day 2' THEN 1 END) AS day2, COUNT(CASE WHEN game_position LIKE 'Day 3' THEN 1 END) AS day3, COUNT(CASE WHEN game_position LIKE 'Day 4' THEN 1 END) AS day4, COUNT(CASE WHEN game_position LIKE 'Day 5' THEN 1 END) AS day5 FROM `message_actions` m inner join actors a on m.actor_id = a.actor_id inner join groupings g on g.actor_id = a.actor_id group by g.team_id";
    connection.query($query, function(err, rows, fields) {
      if (err) {
        console.log("An error ocurred performing the query.");
        return;
      }
      var obj = JSON.stringify(rows);
      var obj2 = JSON.parse(obj);
      //actors = obj;
      console.log(obj2);
      //var obj = JSON.parse(rows);
      //console.log(rows);
      res.send({ rows: obj2 });
      //console.log(rows);
      //console.log(actors);
      //console.log(obj);

      //console.log("Query succesfully executed: ", rows);
    });
    // Close the database connection
    connection.end(function() {});
  });
});
app.get("/TeamMessagesRec", (req, res) => {
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
    $query = "SELECT distinct COUNT(message_id) as count, team_id FROM `groupings` g inner join actors a on a.actor_id = g.actor_id left join message_actions m on m.actor_id = g.actor_id where action_type = 'Received' group by team_id";
    connection.query($query, function(err, rows, fields) {
      if (err) {
        console.log("An error ocurred performing the query.");
        return;
      }
      var obj = JSON.stringify(rows);
      var obj2 = JSON.parse(obj);
      //actors = obj;
      console.log(obj2);
      //var obj = JSON.parse(rows);
      //console.log(rows);
      res.send({ rows: obj2 });
      //console.log(rows);
      //console.log(actors);
      //console.log(obj);

      //console.log("Query succesfully executed: ", rows);
    });
    // Close the database connection
    connection.end(function() {});
  });
});
app.get("/TeamMessagesSent", (req, res) => {
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
    $query = "SELECT distinct COUNT(message_id) as count, team_id FROM `groupings` g inner join actors a on a.actor_id = g.actor_id left join message_actions m on m.actor_id = g.actor_id where action_type = 'Sent' group by team_id";
    connection.query($query, function(err, rows, fields) {
      if (err) {
        console.log("An error ocurred performing the query.");
        return;
      }
      var obj = JSON.stringify(rows);
      var obj2 = JSON.parse(obj);
      //actors = obj;
      console.log(obj2);
      //var obj = JSON.parse(rows);
      //console.log(rows);
      res.send({ rows: obj2 });
      //console.log(rows);
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
