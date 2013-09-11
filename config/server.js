// Generated by CoffeeScript 1.6.3
(function() {
  module.exports = function(express, app) {
    var child_process, config, spawn;
    child_process = require('child_process');
    spawn = child_process.spawn;
    config = require('./index');
    app.configure(function() {
      app.set('views', __dirname + '/../views');
      app.set('view engine', 'jade');
      app.use(express.bodyParser());
      app.use(express.methodOverride());
      app.use(app.router);
      return app.use(express["static"](__dirname + '/../public/'));
    });
    app.configure('development', function() {
      return app.use(express.errorHandler({
        dumpExceptions: true,
        showStack: true
      }));
    });
    app.configure('production', function() {
      return app.use(express.errorHandler());
    });
    return app.listen(config.server.port, function() {
      if (typeof config.server.port === 'string') {
        return spawn('sudo', ['chmod', 777, config.server.port]);
      }
    });
  };

}).call(this);