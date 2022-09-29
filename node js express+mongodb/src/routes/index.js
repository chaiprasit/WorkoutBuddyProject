const express = require('express')
const test = require('./test')
const user = require('./user')
const router = express.Router()

router.use(test)
router.use(user)

module.exports = router
