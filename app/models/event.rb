class Event < ActiveRecord::Base
  has_many :invites
  has_many :attendances
  has_many :comments


  def creator
    creator = User.where(:uid => creator_uid)
    creator.first
  end


def users_who_are_attending
  user_uids = []
  event_attendors = Attendance.where(:event_id => self.id)
  user_uids = event_attendors.pluck(:user_uid)
  return User.where(:uid => user_uids)
end

def export
  return self.as_json
end

end
