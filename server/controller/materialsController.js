const connection = require('../database/db')

class materials {
    async Items(req, res) {
        try {
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT * FROM `materials` WHERE 1')
            return res.status(200).json({ message: rows })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async iClass(req, res) {
        try {
            const { item } = req.body
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT * FROM `pod_materials` WHERE `item` = ?', [item])  
            
            if(rows[0]) {
                return res.status(200).json({ message: rows })
            }
            return res.status(200).json({ message: "Под материалов нет" })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async Quest(req, res) {
        try {
            const { item, classes } = req.body
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT `id`,`quest` FROM `quest` WHERE `item` = ? and `class` = ?', [item, classes])  
            
            if(rows[0]) {
                return res.status(200).json({ message: rows })
            }
            return res.status(200).json({ message: "Теста нет" })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async Answer(req, res) {
        try {
            const { answer, item, classes } = req.body
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT `answer` FROM `quest` WHERE `item` = ? and `class` = ?', [item, classes]) 
            
            let response = []
            let min = 10000000000
            let max = 99999999999
            let random = Math.floor(Math.random() * (max - min + 1)) + min
            let code = 'd'+random

            for (let index = 0; index < rows.length; index++) {
                const verify = rows[index];
                const user_answer = answer[index];

                if(verify.answer == user_answer)
                    response.push(1)
                else
                    response.push(0)
            }

            await connect.execute('INSERT INTO `result`(`code`, `answer`) VALUES (?,?)', [code, response]) 
            return res.status(200).json({ code: code })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }
}

module.exports = new materials()