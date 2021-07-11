const { sql } = require('slonik')

const getPokemons = db => async (data1, data2) => {

    const search = `%${data1}%`
    console.log(search)
    try {
        const result = await db.query(sql`
        SELECT p.id , p.name, json_agg(e.name) AS types
        FROM pokemons AS p
        INNER JOIN pokemons_elements AS pe
        ON p.id = pe.pokemon_id
        INNER JOIN elements AS e
        ON pe.element_id = e.id
        WHERE types LIKE ${search}
        GROUP BY p.id, p.name
        ORDER BY p.id ASC
      `)
        console.log(result.rows)
        return result.rows
    } catch (error) {
        return false
    }
}


const getTrainers = async db => {
    try {
        const result = await db.query(sql`
        SELECT l.name, l.badge, l.description, g.city
        FROM leaders AS l
        INNER JOIN gyms AS g
        ON l.id = g.leader_id
        ORDER BY l.name ASC

      `)

        return result.rows
    } catch (error) {
        return false
    }
}

const getCities = async db => {
    try {
        const result = await db.query(sql`
        SELECT l.name AS Leader_name, l.badge AS Leader_Badge, json_agg(p.name) AS Pokemons, g.city AS City
        FROM leaders AS l
        INNER JOIN gyms AS g
        ON l.id = g.leader_id
        INNER JOIN pokemons AS p
        ON l.id = p.leader_id
        GROUP BY Leader_name, Leader_Badge, City
        ORDER BY l.name ASC


      `)

        return result.rows
    } catch (error) {
        return false
    }
}

const getTypes = async db => {
    try {
        const result = await db.query(sql`
        SELECT name
        FROM elements


      `)

        return result.rows
    } catch (error) {
        return false
    }
}
module.exports = {
    getPokemons,
    getTrainers,
    getCities,
    getTypes
}