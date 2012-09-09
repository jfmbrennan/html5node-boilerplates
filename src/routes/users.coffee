Router = (() ->
  self = {}

  # Import required modules
  users = require '../models/user'

  self.index = (req, res) ->
    users.all (err, users) ->
      console.log users
      throw err if err
      res.send users

  self.view = (req, res) ->
    res.end 'this is the index'

  self.show = (req, res) ->
    users.find {name: req.params.name}, (err, user) ->
      throw err if err
      res.send user

  self.create = (req, res) ->
    users.create req.body.user, (err, user) ->
      throw err if err
      res.send user

  self
).call this

module.exports = Router
