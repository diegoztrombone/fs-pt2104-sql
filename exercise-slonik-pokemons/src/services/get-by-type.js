const { getByType } = require('../queries')
module.exports = db => async (req, res, next) => {
  const { type } = req.params
  const result = await getByType(db)(type)

  if (result === false) {
      return next({info: new Error('No hay datos')})
    }

  res.status(200).json({
    success: true,
    data: result,
  })
}