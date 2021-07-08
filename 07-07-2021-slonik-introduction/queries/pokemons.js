const { sql } = require('slonik')

const getAll = async db => {
  try {
    const { rows: pokemons } = await db.query(sql`
      SELECT * FROM pokemons
    `)

    return pokemons
  } catch (error) {
    console.info('> error: ', error.message)
    return false
  }
}

module.exports = {
  getAll,
}