class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

#Returns a list of all friendships you initated / sent to another user
def sent_friends
   Friendship.where(:sender_uid => self.uid, :accepted => true)
end

#Returns a list of all friend confirmed friendships you received
def received_friends
  Friendship.where(:reciever_uid => self.uid, :accepted => true)
end

#Returns a list of everyone you are confirmed friends with
  def friends
    friend_uids = []
    friend_uids = friend_uids + self.sent_friends.pluck(:reciever_uid)
    friend_uids = friend_uids + self.received_friends.pluck(:sender_uid)
    return User.where(:uid => friend_uids)
  end

#Returns pending friendship requests you sent to other users
def sent_friend_requests
   Friendship.where(:sender_uid => self.uid, :accepted => false)
end

#Returns pending friendship requests you are recieveing from other users
def received_friend_requests
  Friendship.where(:reciever_uid => self.uid, :accepted => false)
end

#Returns a list of Users you have recieved friend requests from
def pending_recieved_friend_requests
    friend_uids = []
    friend_uids = friend_uids + self.received_friend_requests.pluck(:sender_uid)
    return User.where(:uid => friend_uids)
end

#Returns a list of Users you have SENT friend requests
def pending_sent_friend_requests
    friend_uids = []
    friend_uids = friend_uids + self.sent_friend_requests.pluck(:reciever_uid)
    return User.where(:uid => friend_uids)
end


#Recieves the following info from facebook when a new user is created
def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.name = auth.info.name
    user.image = auth.info.image
    user.uid = auth.uid
  end
end
end
