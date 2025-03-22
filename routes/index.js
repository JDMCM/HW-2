const express = require("express");
const router = express.Router();
const db = require("../Database/connection");




/* GET Index page. */
router.get('/', function(req, res, next) {

    db.query("SELECT name FROM recipes_table",  function(error,data){
        if(error){
            throw error;
        } else {
            res.render('index', {title:'INDEX', action:'list', sampleData:data});
        }
    });
  });



module.exports = router;