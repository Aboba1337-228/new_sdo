const connection = require('../database/db')

class ResultsTable {
    async isLoading(req, res) {
        try {
            const { code } = req.body 
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT `id`, `code`, `answer` FROM `result` WHERE `code` = ?', [code])
            return res.status(200).json({ message: rows[0] })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }
}

module.exports = new ResultsTable()
