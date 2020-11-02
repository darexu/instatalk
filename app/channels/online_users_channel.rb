class OnlineUsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'online_users_channel'
    current_user.update(online: true)
    broadcast
  end

  def unsubscribed
    current_user.update(online: false)
    broadcast
  end

  def broadcast
    ActionCable.server.broadcast 'online_users_channel',
                                 user: UserSerializer.new(current_user).serializable_hash.to_json
  end
end
