const { getNationality } = require('../../queries/directors')

module.exports = db => async (req, res, next) => {
    const {nationality} = req.query
    const result = await getNationality(db)(nationality)

    if (result === false) {
        return next( new Error('No hay datos') )
      }
    
      res.status(200).json({
        success: true,
        data: result,
      })
}

