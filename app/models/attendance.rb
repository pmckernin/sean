class Attendance < ActiveRecord::Base

  def user
   user =  User.where(:uid => user_uid)
   user.first
  end

belongs_to :event

end
