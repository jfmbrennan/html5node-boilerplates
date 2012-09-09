module.exports = (app) ->
  # Import modules
  resource = require 'express-resource'
  users = require '../routes/users'

  app.resource  'users',    users
