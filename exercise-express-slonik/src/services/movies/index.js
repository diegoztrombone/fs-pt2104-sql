const router = require('express').Router()

module.exports = db => {
  router.get('/getfilms' , require('./getFilms')(db))
  router.get('/getmpaa' , require('./getMpaa')(db))
  router.get('/getbybudget/:budget', require('./getByBudget')(db))
  return router
}