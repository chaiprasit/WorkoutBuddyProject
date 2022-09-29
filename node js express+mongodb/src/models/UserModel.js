const mongoose = require('mongoose')
const constants = require('../configs/constants')   

const userSchema = new mongoose.Schema(
    {
        fullname: {
            type: String,
            require: true
        },
        email: {
            type: String,
            require: true
        },
        password: {
            type: String,
            require: true
        },
        phone: {
            type: String,
            require: true
        },
        age: {
            type: String
        }
    }
)

const UserModel = mongoose.model('User', userSchema)

module.exports = UserModel