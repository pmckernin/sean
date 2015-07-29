class Friendship < ActiveRecord::Base
def sender
 sender =  User.where(:uid => sender_uid)
 sender.first
end

def reciever
  reciever = User.where(:uid => reciever_uid)
  reciever.first
end

 # has sender_id and receiver_id columns to store User IDs
  #belongs_to :sender, :class_name => "User" , :foreign_key => "sender_uid"

  #belongs_to :receiver, :class_name => "User" , :foreign_key => "receiver_uid"

  # has accepted:boolean column
  #scope :accepted, -> { where(:accepted => true) }
end
