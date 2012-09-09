# Configure Express Server
module.exports = (express, app) ->

  child_process = require 'child_process'
  spawn = child_process.spawn

  config = require './index'

  app.configure () ->
    app.set 'views', __dirname + '/../views'
    app.set 'view engine', 'jade'
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use app.router
    app.use express.static __dirname + '/../public/'

  app.configure 'development', () ->
    app.use express.errorHandler { dumpExceptions: true, showStack: true }

  app.configure 'production', () ->
    app.use express.errorHandler()

  # Bind Express Server to port or unix socket
  app.listen config.server.port, () ->
    if typeof config.server.port is 'string'
      spawn 'sudo', ['chmod', 777, config.server.port]
