class OnlineUsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'online_users_channel'
    current_user.update(online: true)
    speak
  end

  def unsubscribed
    current_user.update(online: false)
    speak
  end

  def speak
    OnlineUsersService.new(User.online).perform
  end
end
