const express = require('express')
const db = require('../configs/db')
const app = express()
const { PORT } = require('./constants')
app.use(express.json())

app.use('/', require('./services')(db))


app.use((_, __, next) => {
    next({status: 404, info: new Error('Ruta inválida')})
})

app.use(({status = 400, info}, req, res, next) => {
    console.log(">>>",status)
    res.status(status).json({
        success: false,
        message: info.message
    })
})


app.listen(PORT, () => {
    console.info(`Servidor funcionando en el puerto número: ${PORT}`)
})