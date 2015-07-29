class Invite < ActiveRecord::Base
  belongs_to :event

  #Finds the sender of the invite
  def sender
   sender = User.where(:uid => sender_uid)
   sender.first
  end

#Finds the reciever of the invite
def recipient
  recipient = User.where(:uid => recipient_uid)
  recipient.first
end


end
