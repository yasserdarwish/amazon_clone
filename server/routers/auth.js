const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcryptjs")
const jwt = require("jsonwebtoken");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
   try{
    const {name , email, password} = req.body;
    const existingUser = await User.findOne({email});
    if (existingUser){
        return res.status(400).json({msg: "This email is already exists!"});
    }

    const hashedPassword = await bcrypt.hash(password, 8);

    let user =  new User({
        name,
        email,
        password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
   }catch (e){
    res.status(500).json({error: e.message});
   }
});

authRouter.post('/api/signin', async (req, res) => {
    try{
        const {email, password} = req.body;
        const existingUser = await User.findOne({email});
        if (!existingUser){
            return res.status(400).json({msg: "User with this email doesn't exist!"})
        }
        const isMatch = await bcrypt.compare(password, existingUser.password);
        if (!isMatch){
            return res.status(400).json({msg: "Incorrect password."});
        }
        const token = jwt.sign({id: existingUser._id}, "passwordKey");
        res.json({token, ...existingUser._doc});
    }catch (e){
        res.status(500).json({error: e.message});
    }
});

module.exports = authRouter;