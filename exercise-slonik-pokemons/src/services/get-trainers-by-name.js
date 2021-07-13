const { getTrainersByname } = require('../queries')
module.exports = db => async (req, res, next) => {
  const { trainer } = req.params
  const result = await getTrainersByname(db)
  if (result === false) {
    return next(new Error('No hay datos'))
  }

  res.status(200).json({
    success: true,
    data: result,
  })
}