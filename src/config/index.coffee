#Set the current environment to true in the env object

sessionId = (length=8) ->
  id = ""
  id += Math.random().toString(36).substr(2) while id.length < length
  id.substr 0, length

currentEnv = process.env.NODE_ENV or 'development'

exports.appName = 'html5node-boilerplate'

exports.env =
  production: false
  test: false
  development: false

exports.env[currentEnv] = true

exports.server =
  #port: '/tmp/launchpad/launchpad.socket'
  port: 3000
  ip: '127.0.0.1'

exports.db =
  host: '127.0.0.1'
  port: 27017
  name: exports.appName.toLowerCase()

if currentEnv isnt 'production'
  exports.enableTests = true
  exports.server.ip = '0.0.0.0'
