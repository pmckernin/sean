class Event < ActiveRecord::Base
  has_many :invites
  has_many :attendances
  has_many :comments


  def user
    User.find(self.user_uid)
  end


end
