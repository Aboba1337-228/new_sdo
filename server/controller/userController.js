const jwt = require('jsonwebtoken')
const hash = require('password-hash')
const connection = require('../database/db')
const { secret } = require("../config.json")

class User {
    async login(req, res){
        try {
            const { login, password } = req.body
            
            const connect = await connection;
            const [rows, fields] = await connect.execute('SELECT * FROM `users` WHERE `login` = ? and `password` = ?', [login, password]);
            const expiredUser = rows[0]
            let mynicipal = expiredUser.mynicipal
            let school = expiredUser.school
            let u_class = expiredUser.class
            let number = expiredUser.number

            if (!expiredUser)
                throw new Error("Неверный логин или пароль")

            const token = jwt.sign({ code: expiredUser.login }, secret)
            return res.status(200).json({ token, login, mynicipal, school, u_class, number })
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

            const [rows, fields] = await connect.execute('SELECT `login`, `mynicipal`, `school`, `class`, `number` FROM `users` WHERE `login` = ?', [suspect.code]);
            const user = rows[0]
            if (user === false)
                throw new Error("Пользователя не существует")

            return res.status(200).json({ user })
        } catch (error) {
            return res.status(400).json({ message: error.message })
        }
    }
}

module.exports = new User()
