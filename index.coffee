log = (require 'somata').helpers.log
h = require 'highland'

# TODO: Build this into Somata
eventStream = (client, service, event, args...) ->
    stream = h()
    client.on service, event, args..., (err, value, done) ->
        if done
            log.w "Ending stream"
            stream.end()
        else
            stream.write value
    return stream

module.exports = eventStream

