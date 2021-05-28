const express = require('express')
const helmet = require('helmet')
const mongoose = require('mongoose')

const app = express()
const port = 8080
const MONGO_URI = "mongodb://db:27017/my_local_db"

app.use(helmet())

mongoose.connect(MONGO_URI, { useUnifiedTopology: true, useNewUrlParser: true, useFindAndModify: false }); 
mongoose.connection.once('open', function() { 
  console.log('Connected to the Database.');
});
mongoose.connection.on('error', function(error) {
  console.log('Mongoose Connection Error : ' + error);
});

app.get('/', (req, res) => {
  res.send('Hello World Josh!')
})

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`)
})