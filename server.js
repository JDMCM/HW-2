var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var homeRouter = require('./routes/home');
var indexRouter = require('./routes/index');
var recipeRouter = require('./routes/recipe');
var formRouter = require('./routes/form');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(homeRouter);
app.use(indexRouter);
app.use(recipeRouter);
app.use(formRouter);

app.listen(4000)
