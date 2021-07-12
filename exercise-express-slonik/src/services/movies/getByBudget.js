const { getByBudget } = require('../../queries/movies')

module.exports = db => async (req, res, next) => {
  const { budget } = req.params
  const result = await getByBudget(db)(budget)

  if (result === false) {
    return next(new Error('No hay datos'))
  }

  res.status(200).json({
    success: true,
    data: result,
  })
}

