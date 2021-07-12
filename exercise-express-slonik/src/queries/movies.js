const { sql } = require('slonik')

const getFilms = async db => {
    try {
        const result = await db.query(sql`
        SELECT title
        FROM movies
        WHERE source IS NOT NULL
      `)

        return result.rows
    } catch (error) {
        console.info('> error: ', error.message)
        return false
    }
}
const getMpaa = async db => {
    try {
        const result = await db.query(sql`
        SELECT title, mpaa_rating
        FROM movies
        WHERE mpaa_rating IS NOT NULL
        `)
        return result.rows


    }
    catch (error) {
        console.info('> error: ', error.message)
        return false
    }

}

const getByBudget = db => async data => {
    try {
        const result = await db.query(sql`
        SELECT title, production_budget
        FROM movies
        WHERE mpaa_rating IS NOT NULL
        `)
        return result.rows


    }
    catch (error) {
        console.info('> error: ', error.message)
        return false
    }

}

module.exports = {
    getFilms,
    getMpaa,
    getByBudget
}