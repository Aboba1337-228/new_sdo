const connection = require('../database/db')

class News {
    async isNews(req, res) {
        try {
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT * FROM `table_result` WHERE 1')
            return res.status(200).json({ message: rows })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }
}

module.exports = new News()