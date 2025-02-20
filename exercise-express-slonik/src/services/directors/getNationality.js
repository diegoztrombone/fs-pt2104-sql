const { getNationality } = require('../../queries/directors')

module.exports = db => async (req, res, next) => {
  const { nationality1, nationality2 } = req.query
  const result = await getNationality(db)(nationality1, nationality2)

  if (result === false) {
    return next(new Error('No hay datos'))
  }

  res.status(200).json({
    success: true,
    data: result,
  })
}

