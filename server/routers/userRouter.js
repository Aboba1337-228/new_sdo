const express = require("express")
const user = require("../controller/userController")
const materials = require("../controller/materialsController")
const resultsTable = require("../controller/resultController")
const news = require("../controller/newsController")
const isMynicipal = require("../controller/mynicipalSelectController")

const router = express() 

// User
router.post("/loginByToken", user.loginByToken)
router.post("/login", user.login)
router.post("/register", user.register)
router.get("/infoByToken", user.infoByToken)
router.post("/changeInfoUserByToken", user.changeInfoUserByToken)

// Materials
router.post("/materials", materials.ButtonTextMaterials)
router.post("/podMaterials", materials.podMaterials)
router.post("/testQuest", materials.testQuest)
router.post("/testAnswer", materials.testAnswer)

// News
router.post("/news", news.isNews)

// Result
router.post("/loading", resultsTable.isUpLoading)
router.post("/unloading", resultsTable.isUnLoading)

//Select Mynicipal
router.post("/mynicipal", isMynicipal.isSelect)
router.post("/schools", isMynicipal.isSelectSchools)

module.exports = router