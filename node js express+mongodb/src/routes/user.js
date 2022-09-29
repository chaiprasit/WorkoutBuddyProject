// import express from 'express'
const express = require('express')

const router = express.Router()

// import UserController from '../controllers/users/UserController'
const UserController = require('../controllers/User/UserController')

router.use('/user', UserController)


module.exports = router
