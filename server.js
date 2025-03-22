var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var app = express();

const db = require('./db');

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.render('home');
});

app.get("/index",(req,res) => {
    db.query("SELECT name FROM recipes", (err,result) => {
        if(err) throw err;
        res.render("index"),{recipes: result}
    })
});



app.listen(4000)
