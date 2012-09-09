Model = (()->
  self = {}
  config = require '../config'

  mongoose = require 'mongoose'
  mongoose.connect "mongodb://#{config.db.host}/#{config.db.name}"

  fs = require 'fs'
  path = require 'path'

  # User Schema and helper functions
  isAlphanumeric = (value) ->
    value.length and /[a-z]/.test value

  UserSchema = new mongoose.Schema {
    name: {
      type: String
      unique: true
      lowercase: true
      required: true
      validate: [isAlphanumeric, 'Not a proper value']
    }
    description: String
    date: { type: Date, default: Date.now }
  }

  UserSchema.pre 'save', (next) ->
    this.name = this.name.replace /\ /g, "_"
    next()

  mongoose.model 'User', UserSchema
  User = mongoose.model 'User'

  self.all = (callback) ->
    User.find {}, (err, users) ->
      callback err, users

  self.create = (data, callback) ->
    user = new User data
    user.save (err) ->
      callback err, user

  self.find = (conditions, callback) ->
    User.findOne conditions, (err, record) ->
      callback err, record

  self.remove = (conditions, callback) ->
    User.findOne conditions, (err, record) ->
      callback err if err
      user_name = record.name
      record.remove (err) ->
        callback err, user_name


  self.edit = (data) ->

  self

).call this

module.exports = Model
