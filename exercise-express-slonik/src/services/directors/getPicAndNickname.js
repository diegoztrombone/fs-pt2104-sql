const { getPicAndNickname } = require('../../queries/directors')

module.exports = db => async (req, res, next) => {
   
    const result = await getPicAndNickname(db)

    if (result === false) {
        return next( new Error('No hay datos') )
      }
    
      res.status(200).json({
        success: true,
        data: result,
      })
}