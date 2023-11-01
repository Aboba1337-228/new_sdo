const express = require("express")
const user = require("../controller/userController")
const materials = require("../controller/materialsController")
const resultsTable = require("../controller/resultController")

const router = express() 

// User
router.post("/login", user.login)
router.get("/infoByToken", user.infoByToken)

// Materials
router.post("/items", materials.Items)
router.post("/class", materials.iClass)
router.post("/option", materials.iOption)
router.post("/quest", materials.Quest)
router.post("/answer", materials.Answer)

// Result
router.post("/loading", resultsTable.isLoading)

module.exports = router