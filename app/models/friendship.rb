class Friendship < ActiveRecord::Base

def sender
 sender =  User.where(:uid => sender_uid)
 sender.first
end

def reciever
  reciever = User.where(:uid => reciever_uid)
  reciever.first
end



end
