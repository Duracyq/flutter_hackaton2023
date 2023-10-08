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

const fs = require('fs');

// app.post('/api/create', (req, res) => {
//   console.log('Received a POST request');

//   // Assuming you want to retrieve data from the request body
//   const requestBody = req.body;

//   // Define the path to the JSON file where you want to save the data
//   const filePath = './temp/data.json';

//   // Read existing data from the file (if it exists)
//   let existingData = [];
//   try {
//     existingData = JSON.parse(fs.readFileSync(filePath));
//   } catch (err) {
//     // If the file doesn't exist or is not valid JSON, existingData will remain an empty array
//   }

//   // Push the new data into the existing data array
//   existingData.push(requestBody);

//   // Write the updated data back to the file
//   fs.writeFileSync(filePath, JSON.stringify(existingData, null, 2));

//   // Send a response to the client
//   res.status(201).json({ message: 'Data created and saved to JSON file successfully' });
// });



app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

// statement;