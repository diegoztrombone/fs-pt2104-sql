const router = require('express').Router()

module.exports = db => {
  router.get('/getname', require('./getName')(db))
  router.get('/getQueryAndNickname', require('./getQueryAndNickname')(db))
  router.get('/getPicAndNickname', require('./getPicAndNickname')(db))
  router.get('/getNationality', require('./getNationality')(db))
  router.get('/getByRol', require('./getByRol')(db))
  router.get('/getComas', require('./getComas')(db))

  return router
}