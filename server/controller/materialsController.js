const connection = require('../database/db')

class materials {
    async ButtonTextMaterials(req, res) {
        try {
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT * FROM `materials` WHERE 1')
            return res.status(200).json({ message: rows })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async podMaterials(req, res) {
        try {
            const { test_id } = req.body
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT * FROM `pod_materials` WHERE `test_id` = ?', [test_id])  
            
            if(rows[0]) {
                return res.status(200).json({ message: rows })
            }
            return res.status(200).json({ message: "Под материалов нет" })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async testQuest(req, res) {
        try {
            const { test_id } = req.body
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT * FROM `test_quest` WHERE `test_id` = ?', [test_id])  
            
            if(rows[0]) {
                return res.status(200).json({ message: rows[0] })
            }
            return res.status(200).json({ message: "Теста нет" })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async testAnswer(req, res) {
        try {
            const { test_id } = req.body
            const connect = await connection
            const [rows, fields] = await connect.execute('SELECT * FROM `test_otvet` WHERE `test_id` = ?', [test_id])  
            
            if(rows[0]) {
                return res.status(200).json({ message: rows })
            }
            return res.status(200).json({ message: "Ответов нет" })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }
}

module.exports = new materials()