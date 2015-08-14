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


#A list of events which current user created
def events_hosting
   Event.where(:creator_uid => self.uid).to_json
end


#Returns list all events that freinds are attending - goes into all events available
def events_friends_attending
friend_uids = self.friends.pluck(:uid)
events_attending = Attendance.where(:user_uid => friend_uids)
event_id = events_attending.pluck(:event_id)
return Event.where(:id => event_id)
end

#Returns a list of all events that confirmed friends created - Goes into all events available
def events_friends_created
friend_uids = self.friends.pluck(:uid)
return Event.where(:creator_uid => friend_uids)
end

#Returns all Events which are available for attendance
def events_that_are_available_to_me
events_i_can_see = []
events_i_can_see = events_i_can_see + self.events_friends_attending.pluck(:id)
events_i_can_see = events_i_can_see + self.events_friends_created.pluck(:id)
return Event.where(:id => events_i_can_see)
end


#Returns all events that I have created an Attendance
def events_user_is_attending
  events = Attendance.where(:user_uid => self.uid)
  event_ids = events.pluck(:event_id)
  return Event.where(:id => event_ids)
end

def attending
event = Attendance.where(:user_uid => self.uid)
end

def export
  return self.to_json
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
