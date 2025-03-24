var createError = require('http-errors');
var express = require('express');
var path = require('path');
const bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var app = express();

const db = require('./db');
const { title } = require('process');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));
//render homepage
app.get('/', (req, res) => {
    res.render('home', {title: 'Home', a1: 'on', a2: 'off', a3: 'off'});
});
//get the naames of the recipes then render the homepage
app.get("/index",(req,res) => {
    db.query("SELECT rname FROM recipes_table", (err,result) => {
        if(err) throw err;
        res.render('index',{recipes: result, title: 'Recipe Index', a1: 'off', a2: 'on', a3: 'off'});
    })
});

//get the names of the ingredients and render the form
app.get("/form",(req,res) => {
    db.query("SELECT iname FROM ingredients_table", (err,result) => {
        if(err) throw err;
        //if (result.length === 0) return res.status(404).send("No ingredients found.");
        res.render("form",{ingredients: result, title: "Add Recipe Form", a1: 'off', a2: 'off', a3: 'on'});
    })
});
//submit the selected key ingredients into the junction table anad recipe info into the recipe
app.post("/form", (req,res) => {
    //console.log(req.body);
    
    let sql2 = `INSERT INTO recipes_table (rname,author,instructions,ingredients) VALUES (?,?,?,?)`
    db.query(sql2,[req.body.rname,req.body.author,req.body.instruct,req.body.ingredients], (err) => {
        if(err) throw err;
        res.redirect('/index')
    }); 

    if(req.body.checkboxes.length != 0) {
        var arr = req.body.checkboxes;
        var array = [];

        arr.forEach(e => {
            array.push([req.body.rname,e])
        });

        console.log(array);
    

        let sql1 = `INSERT INTO junct (rname,iname) VALUES ?`;
        db.query(sql1,[array], (err) => {
            if(err) throw err;
            console.log(array)
        }); 
    }
});


app.listen(4000)
