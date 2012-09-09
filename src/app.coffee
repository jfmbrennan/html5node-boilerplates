#import required modules
express = require 'express'

# Create our Express Server
app = module.exports = express.createServer()

# Configure our server
require('./config/server')(express, app)

# Import our router
require('./config/routes')(app)
