const { getFilms } = require('../../queries/movies')

module.exports = db => async (req, res, next) => {

  const result = await getFilms(db)

  if (result === false) {
    return next(new Error('No hay datos'))
  }

  res.status(200).json({
    success: true,
    data: result,
  })
}

