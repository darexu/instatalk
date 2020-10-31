jQuery(document).on 'turbolinks:load', ->
  App.online_users = App.cable.subscriptions.create "OnlineUsersChannel",
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log('Received message: ' + data['message'])
      $('#online').replaceWith ('<div id="online">' + data['message'] + '</div>')
    speak: ->
      @perform 'speak'
