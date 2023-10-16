const connection = require('../database/db')

class isMynicipal {
    async isSelect(req, res) {
        try {
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT `mynicipal` FROM `mynicipal` WHERE 1')
            return res.status(200).json({ message: rows })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async isSelectSchools(req, res) {
        try {
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT `schools` FROM `schools` WHERE 1')
            return res.status(200).json({ message: rows })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }
}

module.exports = new isMynicipal()