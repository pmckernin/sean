class FriendsController < ApplicationController

  def index
    @friendship = Friendship.all
  end

  def recommended

  end

  def pending

  end

end
