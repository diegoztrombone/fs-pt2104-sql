const { getPokemonsByName } = require('../queries')
module.exports = db => async (req, res, next) => {
  const { name } = req.params
  const result = await getPokemonsByName(db)(name)
  if (result === false) {
    return next({ info: new Error('No hay datos') })
  }

  res.status(200).json({
    success: true,
    data: result,
  })
}