const express = require("express");
const router = express.Router();
const db = require("../Database/connection");

router.get("/addrecipe",(req,res) => {
    res.render('form',{title: 'Enter New Recipe'});
});

router.post("/addrecipe",(req,res) => {
    console.log(req.body);

    let sql = "INSERT INTO recipes_table (name,author,instruct) VALUES (name,author,instruct)";

    db.query(sql,[req.body.title,req.body.author], (err,result) => {
        if(err) throw err;
        res.redirect('./');
    });
});


module.exports = router;