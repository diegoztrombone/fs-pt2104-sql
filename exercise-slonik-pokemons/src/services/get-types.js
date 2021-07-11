const { getTypes } = require('../queries')
module.exports = db => async (req, res, next) => {
    const result = await getTypes(db)
    if (result === false) {
        return next(new Error('No hay datos'))
      }
    
      res.status(200).json({
        success: true,
        data: result,
      })
}