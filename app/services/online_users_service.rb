class OnlineUsersService
  def initialize(users_online:)
    @users_online = users_online
  end

  def perform
    broadcast_online
  end

  private

  def broadcast_online
    ActionCable.server.broadcast 'online_users_channel',
                                 message: render_users_online
  end

  def render_users_online
    ApplicationController.renderer.render(partial: 'layouts/online_users', locals: {
      users_online: @users_online
    })
  end
end
