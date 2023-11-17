import Express  from "express";
import bodyParser from "body-parser";
import mongoose from "mongoose";
import { render } from "ejs";

let app = Express();
let port = 3000;
mongoose.connect('mongodb://127.0.0.1:27017/job');

var StudentSchema = new mongoose.Schema({
    email: String,
    username: String,
    password: String,
    confirm_password: String,
});

var fullregSchema = new mongoose.Schema({
    email: String,
    username: String,
    fullname: String,
    location: String,
    mobile: String,
});

var reg = mongoose.model("reg", fullregSchema);
var Student = mongoose.model("Student", StudentSchema);

app.use(Express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");

app.get("/", (req, res) => {
    res.render("Login",{error:""});
});

app.get("/reg", (req, res) => {
    res.render("reg");
});

app.get("/Home", (req, res) => {
    res.render("Home");
});

app.get("/Jobapply/:id", (req, res) => {
    let id = req.params.id;
    res.render("Apply",{id : id});
});
app.get("/SuperHome/:id", (req, res) => {
    let id = req.params.id;
    res.render("Home",{id:id,user:id});
});

app.get("/ChangePass/:id", (req,res)=>{
    let id = req.params.id;
    res.render("Changepass",{id:id,error:""});
});

app.post("/LoginCheck", async(req, res) => {
    let username = req.body.email_log;
    let password = req.body.Password_log;
    let user = await Student.findOne({ email: username });
    if (user) {
        if (user.password === password) {
            res.render("Home",{id:username,user:username});
        } else {
            res.render("Login",{error:"Invalid Password"});
        }
    } else {
        res.render("Login",{error:"Invalid Username or Password"});
    }
});

app.post("/RegCheck", async(req, res) => {
    let username = req.body.name_reg;
    let email = req.body.email_reg;
    let password = req.body.Password_reg;
    if (password === req.body.conform_password_reg) {
        let user = await Student.findOne({ email: email });
        if (user) {
            res.render("reg",{error:"Email Already Exist"});
        } else {
            let newuser = new Student({
                username: username,
                email: email,
                password: password
            });
            await newuser.save();
            res.render("fullreg");
        }
    } else {
        res.render("reg",{error:"Password Not Matched"});
    }
});

app.post("/FullReg", async(req, res) => {
    let username = req.body.username;
    let email = req.body.email;
    let fullname = req.body.fullname;
    let location = req.body.location;
    let mobile = req.body.mobilenum;
    let user = await reg.findOne({ email: email });
    if (user) {
        res.render("fullreg",{error:"Email Already Exist"});
    } else {
        let newuser = new reg({
            username: username,
            email: email,
            fullname: fullname,
            location: location,
            mobile: mobile,
        });
        await newuser.save();
        res.render("Login",{error:"Register Success"});
    }
});

app.get("/Profile/:id",async(req,res)=>{
    let id = req.params.id;
    // console.log(id);
    let user = await reg.findOne({ email: id });
    // console.log(user);
    if (user) {
        res.render("Profile",{id:id,user:user});
    } else {
        res.render("Home",{id:id , user:id});
    }
});

app.get("/Edit/:id", async (req, res) => {
    let id = req.params.id;
    let user = await reg.findOne({ email: id });
    if(user){
        res.render("Edit",{id:id,user:user});
    }
    else{
        res.render("Home",{id:id,user:id});
}
});

app.get("/logout", async (req, res) => {
    res.render("Login",{error:""});
});

app.get("/settings/:id",async(req,res) =>{
    let id = req.params.id;
    let user = await reg.findOne({ email: id });
    if(user){
        res.render("Settings",{id:id,user:id});
    }
    else{
        res.render("Home",{id:id,user:id });
}
});

app.post("/EditCheck/:id",async(req,res)=>{
    let  id = req.params.id;
    let user = await reg.findOne({ email: id });
    let username = req.body.username;
    let email = req.body.email;
    let fullname = req.body.fullname;
    let location = req.body.location;
    let mobile = req.body.mobilenum;
    if(user){
        // await reg.updateOne({email:id},{$set:{user:user}});
        await reg.updateOne({email:id},{$set:{username:username}});
        await reg.updateOne({email:id},{$set:{email:email}});
        await reg.updateOne({email:id},{$set:{fullname:fullname}});
        await reg.updateOne({email:id},{$set:{location:location}});
        await reg.updateOne({email:id},{$set:{mobile:mobile}});
        let u = await reg.findOne({ email: id });
        res.render("Profile",{id:id,user:u});
    }
    else{
        res.render("Edit",{id:id,user:user});
    }
});

app.post("/Change/:id",async(req,res)=>{
    let id = req.params.id;
    let pass = req.body.Current_password;
    let npass = req.body.password;
    let cpass = req.body.conform_password;
    if(cpass !== npass){
        res.render("Changepass",{id:id,error:"New And Conform Password Not Matched"});
    }
    else{
    let user = await Student.findOne({ email: id });
    if(user){
        if(user.password === pass){
            await Student.updateOne({email:id},{$set:{password:npass}});
            alert("Password Changed");
            res.render("Settings",{id:id,user:id});
        }
        else{
            res.render("Changepass",{id:id,error:"Current Password Not Matched"});
        }
    }
}
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});