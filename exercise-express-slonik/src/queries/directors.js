const { sql } = require('slonik')

const getName = async db => {
    try {
        const result = await db.query(sql`
        SELECT name
        FROM directors
        WHERE name NOT LIKE ''
        
        
        
      
      `)

        return result.rows
    } catch (error) {
        console.info('> error: ', error.message)
        return false
    }
}

const getQueryAndNickname = async db => {
    try {
        const result = await db.query(sql`
        SELECT query_name, nickname
        FROM directors

        
        
        `)
        return result.rows
    } catch (error) {
        console.info('> error: ', error.message)
        return false
    }

}

const getPicAndNickname = async db => {
    try {
        const result = await db.query(sql`
        SELECT pic, nickname
        FROM directors
        WHERE nickname NOT LIKE ''
        
        `)
        return result.rows
    } catch (error) {
        console.info('> error: ', error.message)
        return false
    }

}

const getNationality = db => async data => {
    console.log(data)
    try {
        const result = await db.query(sql`
        SELECT query_name, nationality
        FROM directors
        WHERE nationality 
        LIKE ${data}
        
        `)
        return result.rows
    } catch (error) {
        console.info('> error: ', error.message)
        return false
    }

}

const getByRol = db => async data => {
    const search = `%${data}%`
    try {
        const result = await db.query(sql`
        SELECT query_name, nationality, roles
        FROM directors
        WHERE roles like ${search}

        
        `)
        return result.rows
    } catch (error) {
        console.info('> error: ', error.message)
        return false
    } 
}

module.exports = {
    getName,
    getQueryAndNickname,
    getPicAndNickname,
    getNationality,
    getByRol

}