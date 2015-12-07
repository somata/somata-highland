somata = require 'somata'
{log} = somata.helpers
h = require 'highland'

# TODO: Build this into Somata
eventStream = (client, service, event, args...) ->
    if !client?
        client = new somata.Client
    stream = h()
    client.on service, event, args..., (value, done) ->
        if done
            log.w "Ending stream"
            stream.end()
        else
            stream.write value
    return stream

module.exports = eventStream

