const { getByRol } = require('../../queries/directors')

module.exports = db => async (req, res, next) => {
    const { rol } = req.query
    const result = await getByRol(db)(rol)

    if (result === false) {
        return next( new Error('No hay datos') )
      }
    
      res.status(200).json({
        success: true,
        data: result,
      })
}

