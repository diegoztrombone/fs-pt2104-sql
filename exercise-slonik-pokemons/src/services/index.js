const router = require('express').Router()

module.exports = db => {
    router.get('/pokemons', require('./get-pokemons')(db))
    router.get('/pokemons/:name', require('./get-pokemon-by-name')(db))
    router.get('/trainers', require('./get-trainers')(db))
    router.get('/trainers/:trainer', require('./get-trainers-by-name')(db))
    router.get('/cities', require('./get-cities')(db))
    router.get('/types', require('./get-types')(db))
    router.get('/types/:type', require('./get-by-type')(db))
    return router
}