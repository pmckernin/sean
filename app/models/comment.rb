class Comment < ActiveRecord::Base
   def user
    User.find(self.user_uid)
  end

  belongs_to :event

end
