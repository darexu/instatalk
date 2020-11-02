jQuery(document).on 'turbolinks:load', ->
  App.online_users = App.cable.subscriptions.create "OnlineUsersChannel",
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log('Received message: ' + JSON.parse(data['user']).data.attributes.nickname);
      
      user = JSON.parse(data['user']).data
      id = user.attributes.id
      nickname = user.attributes.nickname
      online = user.attributes.online

      if online && $("span[data-user-id='#{id}'").length == 0
        $('#online').append("<span data-user-id='#{id}'>#{nickname} </span>")
      else if !online
        $("span[data-user-id='#{id}'").remove()
