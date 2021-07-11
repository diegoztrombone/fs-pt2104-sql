const router = require('express').Router()

module.exports = db => {
    router.get('/pokemons', require('./get-pokemons')(db))
    router.get('/trainers', require('./get-trainers')(db))
    router.get('/cities', require('./get-cities')(db))
    router.get('/types', require('./get-types')(db))
    return router
}