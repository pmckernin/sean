class Event < ActiveRecord::Base
  has_many :invites
  has_many :attendances
  has_many :comments


  def creator
    creator = User.where(:uid => creator_uid)
    creator.first
  end


end
