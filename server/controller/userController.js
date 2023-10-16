const jwt = require('jsonwebtoken')
const hash = require('password-hash')
const connection = require('../database/db')

const { secret } = require("../config.json")

class User {
    async loginByToken(req, res){
        try {
            const token = req.headers.authorization

            const user = jwt.verify(token, secret)

            if (user === false)
                throw new Error("Неверный токен")

            return res.status(200).json({ message: "Авторизация прошла успешно" })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async login(req, res){
        try {
            const { numSchools, numClass, numSip, numItems } = req.body
            
            const connect = await connection;
            const [rows, fields] = await connect.execute('SELECT * FROM `users` WHERE `numSchools` = ? and `numClass` = ? and `numSip` = ? and `numItems` = ?', [numSchools, numClass, numSip, numItems]);
            const expiredUser = rows[0]

            if (!expiredUser)
                throw new Error("Пользователя не существует")

            const token = jwt.sign({ numberS: expiredUser.number }, secret, { expiresIn: "24h" })
            return res.status(200).json({ token })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async register(req, res){
        try {
            const { numSchools, numClass, numSip, numItems, city, schools } = req.body  

            const connect = await connection;
            const numberS = Math.random(1,1000000000000000)
            await connection.execute("INSERT INTO `users` (`numSchools`, `numClass`, `numSip`, `numItems` , `number`, `city`, `schools`) VALUES (?, ?, ?, ?, ?, ?, ?)", [numSchools, numClass, numSip, numItems, numberS, city, schools]);

            const token = jwt.sign({ numberS }, secret, { expiresIn: "24h" })
            return res.status(200).json({ token })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async infoByToken(req, res) {
        try {
            const token = req.headers.authorization
            const connect = await connection;
            const suspect = jwt.verify(token, secret)

            if (suspect === false)
                throw new Error("Неверный токен")

            const [rows, fields] = await connect.execute('SELECT * FROM `users` WHERE `number` = ?', [suspect.numberS]);
            const user = rows[0]
            if (user === false)
                throw new Error("Пользователя не существует")

            return res.status(200).json({ user })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }

    async changeInfoUserByToken(req, res) {
        try {
            const { name, number, mail, password, city } = req.body  
            const token = req.headers.authorization
            const connect = await connection;
            const suspect = jwt.verify(token, secret)

            if (suspect === false)
                throw new Error("Неверный токен")

            const [rows, fields] = await connect.execute('SELECT * FROM `users` WHERE `number` = ?', [suspect.number]);
            const user = rows[0]
            if (user === false)
                throw new Error("Пользователя не существует")
    
            await connect.execute('UPDATE `users` SET `name`=?,`number`=?,`mail`=?,`password`=?,`city`=? WHERE `id`=?', [name, number, mail, password, city, user.id]);

            const newToken = jwt.sign({ number }, secret, { expiresIn: "24h" })
            return res.status(200).json({ message: "Данные обновлены успешно", token: newToken })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }
}

module.exports = new User()
