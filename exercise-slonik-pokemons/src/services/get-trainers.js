const { getTrainers } = require('../queries')
module.exports = db => async (req, res, next) => {
    const result = await getTrainers(db)
    if (result === false) {
        return next(new Error('No hay datos'))
      }
    
      res.status(200).json({
        success: true,
        data: result,
      })
}