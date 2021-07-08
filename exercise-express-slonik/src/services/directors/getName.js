const { getName } = require('../../queries/directors')

module.exports = db => async (req, res, next) => {
   
    const result = await getName(db)

    if (result === false) {
        return next( new Error('No hay datos') )
      }
    
      res.status(200).json({
        success: true,
        data: result,
      })
}

