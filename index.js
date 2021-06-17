const express = require('express')
const cors = require('cors')
const bearerToken = require('express-bearer-token')
const { db } = require('./config')
const { usersRouters, moviesRouters } = require('./routers')
const PORT = 2090

// main app
const app = express()

// apply middleware
app.use(cors())
app.use(express.json())
app.use(bearerToken())

db.getConnection((err, connection) =>{
    if(err){
        return console.log("Error mysql", err)
    }

    console.log(`Connected to my sql server ${connection.threadId}`)
})

// routing
app.get('/', (req, res) =>{
    res.status(200).send("welcome")
})
app.use('/users', usersRouters)
app.use('/movies', moviesRouters)
// app.use('/movies')
// handling error
app.use((error, req, res, next) =>{
    console.log("Handling error")
    res.status(500).send({status: 'Error', messages: error})
})

app.listen(PORT, () => console.log(`Server running at ${PORT}`))