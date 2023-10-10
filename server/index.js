const express = require("express");
const mongoose = require("mongoose");

const authRouter = require("./routers/auth.js");
const adminRouter = require("./routers/admin.js");

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://yasser:127845963Eslam@cluster0.qnqe2jn.mongodb.net/?retryWrites=true&w=majority"
//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//Connections
mongoose.connect(DB).then(() => {console.log("Connection Successfull");}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected at port ${PORT}`);
});