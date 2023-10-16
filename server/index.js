const express = require("express")
const cors = require("cors")
const userRouter = require("./routers/userRouter")

const PORT = process.env.PORT || 3001
const HOST = '0.0.0.0' //192.168.100.60
const app = express()

app.use(express.json())
app.use(cors())

app.use("/user", userRouter)

app.listen(PORT, HOST, () => {
    console.log("server started on port: " + PORT)
})
