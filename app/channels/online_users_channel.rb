class OnlineUsersChannel < ApplicationCable::Channel
  def initialize(connection, identifier, params = nil)
    super
    @users_online = []
  end

  def subscribed
    @users_online << current_user
    stream_from 'online_users_channel'
    speak(@users_online)
  end

  def unsubscribed
    @users_online.delete(current_user)
    speak(@users_online)
  end

  def speak(users_online)
    OnlineUsersService.new(
      users_online: users_online
    ).perform
  end
end
