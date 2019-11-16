var express = require('express');
var router = express.Router();

// database module
var database = require('../config/database');
var RunQuery = database.RunQuery;

/* Route Contact-us page. */
router.route('/')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/contact-us',
            title: 'Contact us',
            customer: req.user
        };
        res.render('contact', contextDict);
    })

module.exports = router;