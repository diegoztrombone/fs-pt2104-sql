const express = require('express')
const { PORT } = require('./constants')
const db = require('./configs/db')
const app = express()

app.use(require('./services')(db))

app.use((_, __, next) => {
  next({ info: new Error('path not found') })
})

app.use(({ status = 400, info }, _, res, __) => {
  res.status(status).json({
    success: false,
    message: info.message,
  })
})

app.listen(PORT,
  () => console.info(`> Listening at http://localhost:${PORT}`)
)