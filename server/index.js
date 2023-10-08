const { urlencoded } = require('body-parser');
const express = require('express');
const snowflake = require('snowflake-sdk');

const tabele = 'wydarzenia'; // wydarzenia
const database = 'Hackathon_Manjaro '; // Hackathon_Manjaro
const schema = 'tabele'; // tabele

const app = express();
const port = 3000;

app.use(express.json());
app.use(urlencoded({  extended: true  }));

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

app.get('/api/read/', (req, res) => {
  connection.execute({
    sqlText: `select * from ${database}.${schema}.${tabele};`,
    streamResult: true,
    complete: function (err, stmt)
    {
      let stream = stmt.streamRows();
      // Read data from the stream when it is available
      stream.on('readable', function (row)
      {
        while ((row = this.read()) !== null)
        {
          console.log(row);
          productListJson = row;
          console.log(productListJson);
          if(!productListJson.isEmpty) {
            res.status(200).send(productListJson);
            console.log('sent data');
          }
        }
      }).on('end', function ()
      {
        console.log('done');
      }).on('error', function (err)
      {
        console.log(err);
      });
    }
  });
});

const dataFilePath = '../volonteer_link/assets/users.json';

function loadUserData() {
  try {
    const data = fs.readFileSync(dataFilePath, 'utf8');
    return JSON.parse(data);
  } catch (error) {
    return [];
  }
}

function saveUserData(userData) {
  fs.writeFileSync(dataFilePath, JSON.stringify(userData, null, 2));
}

let productDataUsers = loadUserData();

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
    "status": 200,
    "message": "User registered",
    "product": productDataUsers
  })
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

// statement;