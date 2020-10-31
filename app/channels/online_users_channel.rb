class OnlineUsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'online_users_channel'
    current_user.update(online: true)
    broadcast_online_users
  end

  def unsubscribed
    current_user.update(online: false)
    broadcast_current_user_offline
  end

  def broadcast_online_users
    ActionCable.server.broadcast 'online_users_channel',
                                 users: users_to_json
  end

  def users_to_json
    User.online.as_json.map do |user|
      { user['nickname'] => user['online'] }.to_json
    end
  end

  def broadcast_current_user_offline
    ActionCable.server.broadcast 'online_users_channel',
                                users: current_user_to_json
  end

  def current_user_to_json
    [{ current_user.nickname => false }.to_json]
  end
end
