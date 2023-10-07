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
console.log(`1 connection.connect`)
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


console.log('passed?, port')
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

// statement;