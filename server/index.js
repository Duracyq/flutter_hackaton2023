const express = require('express');
const snowflake = require('snowflake-sdk');
const bodyParser = require('body-parser');
const fs = require('fs');

const tabele = 'wydarzenia';
const database = 'Hackathon_Manjaro';
const schema = 'tabele';

const app = express();
const port = 47176;

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Snowflake configuration
const snowflakeConfig = {
  account: 'ck11917.eu-central-1',
  username: 'DR3X',
  password: 'zXcvbnm4%%6a',
  warehouse: 'COMPUTE_WH',
  database: database,
  schema: schema,
  role: 'ACCOUNTADMIN',
};

// Connect to Snowflake
const connection = snowflake.createConnection(snowflakeConfig);

connection.connect((err, conn) => {
  if (err) {
    console.error('Unable to connect to Snowflake:', err);
    process.exit(1);
  }
  console.log('Connected to Snowflake');
});

let productListJson = [];

app.get('/api/read', (req, res) => {
  connection.execute({
    sqlText: `select * from ${database}.${schema}.${tabele};`,
    streamResult: true,
    complete: function (err, stmt) {
      let stream = stmt.streamRows();
      // Read data from the stream when it is available
      stream.on('readable', function (row) {
        while ((row = this.read()) !== null) {
          console.log(row);
          productListJson = row;
          console.log(productListJson);
          if (!productListJson.isEmpty) {
            res.status(200).send(productListJson);
            console.log('sent data');
          }
        }
      }).on('end', function () {
        console.log('done');
      }).on('error', function (err) {
        console.log(err);
      });
    },
  });
});

const dataFilePath = '../volunteer_link/assets/users.json';

function loadData(dataFilePath) {
  try {
    const data = fs.readFileSync(dataFilePath, 'utf8');
    console.log(`loaded ${dataFilePath}`)
    return JSON.parse(data);
  } catch (error) {
    return [];
  }
}

function saveUserData(userData) {
  fs.writeFileSync(dataFilePath, JSON.stringify(userData, null, 2));
}

let productDataUsers = loadData(dataFilePath);

// Create a POST route to handle incoming user data
app.post('/api/postUser', (req, res) => {
  console.log('Received data:', req.body);

  // Assuming you want to add the received data to the existing JSON array
  const newUser = {
    id: productDataUsers.length + 1, // Generate a new ID
    uname: req.body.uname,
    sname: req.body.sname,
    pesel: req.body.pesel,
    phonenum: req.body.phonenum,
    email: req.body.email,
    age: req.body.age,
    role: req.body.role,
    regulamin: req.body.regulamin,
  };

  // Push the new user data to the existing array
  productDataUsers.push(newUser);
  saveUserData(productDataUsers);
  res.status(200).send({
    status: 200,
    message: 'User registered',
    product: productDataUsers,
  });
});

let productDataEvents = loadData('../volonteer_link/assets/events.json');

// Create a POST route to handle incoming event data
app.post('/api/postEvent', (req, res) => {
  console.log('Received event data:', req.body);

  // Assuming you want to add the received data to the existing JSON array
  const newEvent = {
    id: productDataEvents.length + 1, // Generate a new ID
    title: req.body.title,
    desc: req.body.desc,
    place: req.body.place,
    date: req.body.date,
    cVolo: req.body.cVolo,
    minAge: req.body.minAge,
  };

  // Push the new event data to the existing array
  productDataEvents.push(newEvent);
  fs.writeFileSync('../volonteer_link/assets/events.json', JSON.stringify(productDataEvents, null, 2));
  res.status(200).send({
    status: 200,
    message: 'Event registered',
    product: productDataEvents,
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
