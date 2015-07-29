class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]


  #has_many :friend_requests_as_sender, :class_name => "Friendship", :foreign_key => "sender_uid"
  #has_many :friend_requests_as_sender_accepted, -> { accepted }, :class_name => "Friendship", :foreign_key => "sender_uid"
  #has_many :sent_friends, :through => :friend_requests_as_sender_accepted, :source => :receiver

  #has_many :friend_requests_as_receiver, :class_name => "Friendship", :foreign_key => "receiver_uid"
  #has_many :friend_requests_as_receiver_accepted, -> { accepted }, :class_name => "Friendship", :foreign_key => "receiver_uid"
  #has_many :received_friends, :through => :friend_requests_as_receiver_accepted, :source => :sender


def sent_friends
   Friendship.where(:sender_uid => self.uid, :accepted => true)

end

def received_friends
  Friendship.where(:reciever_uid => self.uid, :accepted => true)

end

  def friends
    friend_uids = []
    friend_uids = friend_uids + self.sent_friends.pluck(:reciever_uid)
    friend_uids = friend_uids + self.received_friends.pluck(:sender_uid)

    return User.where(:uid => friend_uids)
  end


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
