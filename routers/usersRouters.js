const express = require('express')
const { readToken } = require('../config')
const { usersControllers } = require('../controllers')
const router = express.Router()

router.post('/register', usersControllers.register)
router.post('/login', readToken, usersControllers.login)
router.patch('/deactive', readToken, usersControllers.deactivate)
router.patch('/activate', readToken, usersControllers.activate)
router.patch('/close', readToken, usersControllers.closeAcc)
module.exports = router