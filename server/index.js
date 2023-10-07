const express = require('express');
const snowflake = require('snowflake-sdk');

const tabele = 'wydarzenia'; // wydarzenia
const database = 'Hackathon_Manjaro '; // Hackathon_Manjaro
const schema = 'tabele'; // tabele

const app = express();
const port = 3000;

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


connection.execute({
  sqlText: "SELECT 1 FROM snowflake.account_usage.query_history limit 1",
  streamResult: true,
  complete: function (err, stmt)
  {
    var stream = stmt.streamRows();
    // Read data from the stream when it is available
    stream.on('readable', function (row)
    {
      while ((row = this.read()) !== null)
      {
        console.log(row);
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


console.log('passed?, port')
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

// statement;