connect = require 'connect'
express = require 'express'
ws = require 'websocket-server'

app = express.createServer()
app.use connect.staticProvider __dirname + '/lib'

app.get '/', (req, res) -> res.redirect '/whiteboard.html'

app.listen 80

socket = ws.createServer()

clients = []
socket.on 'connection', (client) ->
  clients.push client
  client.on 'message', (message) ->
    socket.send other.id, '!' for other in clients when other isnt client

socket.listen 81