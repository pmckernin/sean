class FriendsController < ApplicationController

  def index
    @friendship = Friendship.all
  end


end
