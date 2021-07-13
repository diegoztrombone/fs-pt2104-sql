const { getPokemons } = require('../queries')
module.exports = db => async (req, res, next) => {
  const { type1, type2 } = req.query
  const result = await getPokemons(db)(type1, type2)

  if (result === false) {
    return next({ status: 404, info: new Error('No hay datos') })
  }

  res.status(200).json({
    success: true,
    data: result,
  })
}