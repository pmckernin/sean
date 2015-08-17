class FriendsController < ApplicationController

  def index
    @friendship = Friendship.all
  end

  def recommended
  @user = User.all

    if user_signed_in?
      Koala.config.api_version = 'v2.0'
      @graph = Koala::Facebook::API.new(session["token"])
      @friends = @graph.get_connections("me", "friends")
    end
  end

  def pending

  end

end
