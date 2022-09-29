var jwt = require("jsonwebtoken");
const express = require("express");

const Joi = require("joi");
const Validate = require("express-joi-validator");
const responseCode = require("../../configs/responseCode");

const UserModel = require("../../models/UserModel");
const UserDecorator = require("../../decorators/UserDecorator");

const bcrypt = require("bcrypt");
const saltRounds = 10;

const router = express.Router();

router.get("/", async (request, response, next) => {
  const data = {
    _id: "asd235$tsdf12fxz",
    name: "test01",
    email: "test01@gmail.com",
  };

  const decorator = await TestDecorator.Decorator(data);
  response.json({
    code: responseCode.SUCCESS,
    message: "success",
    data: decorator,
  });
});

router.post("/register", async (request, response, next) => {
  request.body.password = await bcrypt.hash(request.body.password, 10);

  const usermodel = await UserModel(request.body).save();
  const decorator = await UserDecorator.Decorator(usermodel);
  response.json({
    code: responseCode.SUCCESS,
    message: "success",
    data: decorator,
  });
});

router.post("/login", async (request, response, next) => {
  const usermodel = await UserModel.findOne({ email: request.body.email });
  const decorator = await UserDecorator.Decorator(usermodel);
  const result = await bcrypt.compare(
    request.body.password,
    decorator.password
  );
  if (result) {
    var token = jwt.sign(
      {
        id: decorator.id,
        fullname: decorator.fullname,
        email: decorator.email,
        phone: decorator.phone,
      },
      "shhhhh"
    );
    console.log(token)
    response.json({
      code: responseCode.SUCCESS,
      message: "success",
      data: token,
    });
  } else {
    response.json({
      code: responseCode.SUCCESS,
      message: "not success!!!",
      data: "not found!!",
    });
  }
});

module.exports = router;
