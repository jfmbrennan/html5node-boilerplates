// Generated by CoffeeScript 1.6.3
(function() {
  var app, express;

  express = require('express');

  app = module.exports = express.createServer();

  require('./config/server')(express, app);

  require('./config/routes')(app);

}).call(this);
