var createError = require('http-errors');
var express = require('express');
var path = require('path');
const bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var app = express();

const db = require('./db');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));
//render homepage
app.get('/', (req, res) => {
    res.render('home');
});
//get the naames of the recipes then render the homepage
app.get("/index",(req,res) => {
    db.query("SELECT rname FROM recipes_table", (err,result) => {
        if(err) throw err;
        res.render("index"),{recipes: result}
    })
});

//get the names of the recipes and render the form
app.get("/form",(req,res) => {
    db.query("SELECT iname FROM ingredients_table", (err,result) => {
        if(err) throw err;
        res.render("form"),{ingredients: result}
    })
});
//submit the selected key ingredients into the junction table anad recipe info into the recipe
app.post("/form", (req,res) => {
    //console.log(req.body);
    var array = []
    var checkboxes = document.querySelectorAll('input[type=checkbox]:checked')
    for (var i = 0; i < checkboxes.length; i++) {
        array.push(checkboxes[i].value)
    }
    
    let sql1 = `INSERT INTO junc (rname,iname) VALUES (?,?)`;

    for (var i = 0; i < checkboxes.length; i++) {
        db.query(sql1,[req.body.rname,array[i]], (err) => {
            if(err) throw err;
        }); 
    }

    let sql2 = `INSERT INTO recipes_table (rname,author,instruct) VALUES (?,?,?)`
    db.query(sql2,[req.body.rname,req.body.author,req.body.instruct], (err) => {
        if(err) throw err;
        res.redirect('/index')
    }); 
});


app.listen(4000)
