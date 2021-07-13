const { sql } = require('slonik')

const getPokemons = db => async (data1 = '', data2 = '') => {
    let whereStatement = sql``
    if (data1 || data2) {
        whereStatement = sql`WHERE e.name::text IN (${data1}, ${data2})`
    }
    try {
        console.log("entra")
        const result = await db.query(sql`
            SELECT p.id , p.name, json_agg(e.name) AS types
            FROM pokemons AS p
            INNER JOIN pokemons_elements AS pe
            ON p.id = pe.pokemon_id
            INNER JOIN elements AS e
            ON pe.element_id = e.id
            ${whereStatement}
            GROUP BY p.id, p.name
            ORDER BY p.id ASC
          `)
        if (result.rows.length === 0) throw new Error()
        return result.rows

    }

    catch (error) {
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

const getByType = db => async data => {
    try {
        const result = await db.query(sql`
            SELECT p.name, json_agg(e.name) as type
            FROM pokemons AS p
            INNER JOIN pokemons_elements AS pe
            ON p.id = pe.pokemon_id 
            INNER JOIN elements AS e
            ON pe.element_id = e.id
            WHERE e.name::text LIKE ${data}
            GROUP BY p.name
    `)

        if (result.rows.length === 0) throw new Error()
        return result.rows

    } catch (error) {
        return false
    }
}
const getPokemonsByName = db => async data => {
    try {
        const result = await db.query(sql`
            SELECT p.id , p.name, json_agg(e.name) AS types
            FROM pokemons AS p
            INNER JOIN pokemons_elements AS pe
            ON p.id = pe.pokemon_id
            INNER JOIN elements AS e
            ON pe.element_id = e.id
            WHERE p.name LIKE ${data}
            GROUP BY p.id, p.name
            ORDER BY p.id ASC
        `)
        if (result.rows.length === 0) throw new Error()
        return result.rows
        
    } catch (error) {
        return false
    }
}

const getTrainersByname = db => async data => {
    const result = await db.query(sql`
    
    
    `)
}


module.exports = {
    getPokemons,
    getTrainers,
    getCities,
    getTypes,
    getByType,
    getPokemonsByName,
    getTrainersByname
}