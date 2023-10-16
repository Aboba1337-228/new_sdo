const connection = require('../database/db')

class ResultsTable {
    async isUpLoading(req, res) {
        try {
            const { name, number, mynicipal, item, schools } = req.body
            console.log(number)
            const sl = `[${number}]`   

            const connect = await connection
            await connect.execute('INSERT INTO `table_result` (`FIO`, `number`, `mynicipal`, `items`, `schools`) VALUES (?, ?, ?, ?, ?)', [name, sl, mynicipal, item, schools])
            return res.status(200).json({ message: "Добавленно" })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async isUnLoading(req, res) {
        try {
	    const {mynicipal} = req.body
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT * FROM `table_result` WHERE `mynicipal` = ?', [mynicipal])
            return res.status(200).json({ message: rows })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }
}

module.exports = new ResultsTable()
