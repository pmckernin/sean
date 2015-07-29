class Friendship < ActiveRecord::Base

#Returns the User who has SENT the friendship request
def sender
 sender =  User.where(:uid => sender_uid)
 sender.first
end

#Returns the User who has RECIEVED the friendship request
def reciever
  reciever = User.where(:uid => reciever_uid)
  reciever.first
end



end
