const express = require('express')
const helmet = require('helmet')

const app = express()
const port = 8080

app.use(helmet())

app.get('/', (req, res) => {
  res.send('Hello World Josh!')
})

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`)
})